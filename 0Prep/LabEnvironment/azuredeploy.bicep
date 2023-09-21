param initials string
param location string = resourceGroup().location

var administratorLogin = 'sqladmin'
var administratorLoginPassword = 'WortellSmartLearning.nl'

resource sqlServer 'Microsoft.Sql/servers@2020-02-02-preview' = {
  name: 'sql-${initials}'
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
  name: 'syn-${initials}'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    managedResourceGroupName: 'rg-syn-${initials}'
    sqlAdministratorLogin: administratorLogin
    sqlAdministratorLoginPassword: administratorLoginPassword
    defaultDataLakeStorage: storageAccount
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'stor${initials}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
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

resource storageAccountRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().id, 'SynapseStorageBlobDataContributor')
  scope: storageAccount
  properties: {
    principalId: synapseWorkspace.identity.principalId
    roleDefinitionId: '7f1dbf46-3dcd-4e01-ae0f-b6b8af8e75b9' // storageBlobDataContributor role definition ID
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: 'kv-${initials}'
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