param initials string
param location string = resourceGroup().location

var administratorLogin = 'sqladmin'
var administratorLoginPassword = 'WortellSmartLearning.nl'
var random = substring(uniqueString(resourceGroup().id, subscription().id, initials), 0, 3)
var prefix = toLower('${initials}${random}')

resource sqlServer 'Microsoft.Sql/servers@2020-02-02-preview' = {
  name: 'sql-${prefix}'
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    version: '12.0'
  }
}

resource firewallRule 'Microsoft.Sql/servers/firewallRules@2020-02-02-preview' = {
  name: 'allowAll'
  parent: sqlServer
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '255.255.255.255'
  }
}

resource sourceDb 'Microsoft.Sql/servers/databases@2020-02-02-preview' = {
  parent: sqlServer
  name: 'sqldb-source'
  location: location
  properties: {
    sampleName: 'AdventureWorksLT'
  }
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}

resource targetDb 'Microsoft.Sql/servers/databases@2020-02-02-preview' = {
  parent: sqlServer
  name: 'sqldb-target'
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
}

resource synapseWorkspace 'Microsoft.Synapse/workspaces@2021-06-01-preview' = {
  name: 'syn-${prefix}'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    managedResourceGroupName: 'rg-syn-${prefix}'
    sqlAdministratorLogin: administratorLogin
    sqlAdministratorLoginPassword: administratorLoginPassword
    defaultDataLakeStorage: {
      accountUrl: storageAccount.properties.primaryEndpoints.dfs
      createManagedPrivateEndpoint: false
      filesystem: blobContainer.name
      resourceId: storageAccount.id
    }
    publicNetworkAccess: 'Enabled'
  }
}

resource synapseFirewall 'Microsoft.Synapse/workspaces/firewallRules@2021-06-01' = {
  name: 'allowAll'
  parent: synapseWorkspace
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '255.255.255.255'
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'stor${prefix}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    isHnsEnabled: true
  }
}

resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2021-04-01' = {
  parent: storageAccount
  name: 'default'
}

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  parent: blobService
  name: 'data'
}

resource waitBeforeRoleAssignment 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'waitBeforeRoleAssignment'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.0.80'
    scriptContent: 'sleep 60'
    retentionInterval: 'P1D'
    cleanupPreference: 'Always'
  }
  dependsOn: [
    synapseWorkspace
    storageAccount
  ]
}


resource storageAccountRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().id, 'SynapseStorageBlobDataContributor')
  scope: storageAccount
  properties: {
    principalId: synapseWorkspace.identity.principalId
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe') // storageBlobDataContributor role definition ID
  }
  dependsOn: [
    waitBeforeRoleAssignment
  ]
}

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: 'kv-${prefix}'
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: synapseWorkspace.identity.principalId
        permissions: {
          secrets: ['get', 'list']
        }
      }
    ]
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
    }
  }
}

resource keyVaultSecret 'Microsoft.KeyVault/vaults/secrets@2021-06-01-preview' = {
  parent: keyVault
  name: administratorLogin
  properties: {
    value: administratorLoginPassword
  }
}
