Here's the English translation of the provided text:

# Lab 6 - Triggers

*Requirements*

To be able to start the lab, it is important that Lab5 has been completed.

*Objective*

We have now created pipelines and manually started them. This is, of course, very cumbersome, especially if you want to realize incremental or night-time processing. We can automate this by using triggers. Follow the tasks step by step.

## Task 1 - Triggers

1. Click on the **toolbox** (Manage) on the left. Then click on **Triggers** on the left side.

2. Click on **New**, a new screen will appear to be able to create a trigger.

3. Give the trigger a clear name. The recommended format starts with TR_, followed by the name of the pipeline being triggered.

4. Choose the **Schedule** option under **Type**. Set the **Start date** to today and 10 minutes later than the current time. There are several different options as you have been able to see, such as:

    *Schedule:* A **Schedule trigger** can execute 1 or more pipelines based on the specified schedule. You have control and flexibility as to when a trigger should fire, allowing you to set a start and end date.

    *Tumbling window:* A **Tumbling window trigger** can execute 1 pipeline for each defined time frame. You use this for time-based data so you can do something with it.

    *Event Trigger:* An **Event trigger** can execute 1 or more pipelines based on an event in blob storage, such as the creation or deletion of a file.

    *Custom Trigger:* A **Custom trigger** can execute 1 or more pipelines based on an event from the **Event Grid** service.

5. For **Time zone**, fill in the following: **Amsterdam** and choose the option **Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna (UTC+1)**.

6. Set the **Recurrence** to 1 minute.

7. Check **Specify an end date** and set it 5 minutes later than the chosen **Start date** and then click on **OK**.

8. Click on the **Pencil** (Author) on the left and then click on the `PL_copy_master` pipeline.

9. Click on **Add trigger** and then **New/Edit**.

10. At **Choose Triggers**, click on the trigger you just created. The trigger's screen will appear. If it's already later than the time you set, adjust this now, including the end time.

11. Set the **Status** to **Started** and click **OK** and then **OK** again.

12. Click on the **Blue button** with the text **Publish all** and then click on the **Publish** button.

13. Click on **Monitor** on the left side and go to **pipeline runs**. Click on **Refresh** around the start time, you will see that your pipeline has automatically been triggered.

## Table of Contents

1. [Preparing the Azure environment](../Lab1/LabInstructions1.md)
2. [Integration Runtimes](../Lab2/LabInstructions2.md)
3. [Linked Services](../Lab3/LabInstructions3.md)
4. [Datasets](../Lab4/LabInstructions4.md)
5. [Pipelines](../Lab5/LabInstructions5.md)
6. [Triggers](../Lab6/LabInstructions6.md)
7. [Global Parameters](../Lab7/LabInstructions7.md)
8. [Activities](../Lab8/LabInstructions8.md)
9. [Batching and DIUs](../Lab9/LabInstructions9.md)
10. [First Data Flows](../Lab10/LabInstructions10.md)
11. [Data integration flows](../Lab11/LabInstructions11.md)