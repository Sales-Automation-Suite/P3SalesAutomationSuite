## Installation & Startup:
<br>

<b>For UiPath Studio:</b>

<br>

1. Make sure you are running Windows 10 or 11 on a desktop or laptop with the latest updates are installed for the system

* https://www.microsoft.com/en-us/software-download/

<br>
<br>

2. Install Microsoft Edge Browser

* https://www.microsoft.com/en-us/edge

<br>
<br>

3. Install Microsoft Excel
 - https://www.microsoft.com/en-us/microsoft-365/excel

<br>
<br>
  
4. Install UiPath Studio and UiPath Assistant

* https://docs.uipath.com/installation-and-upgrade/docs/studio-install-studio

<br>
<br>

5. Download project from the Sales Automation Suite GitHub repository:

* https://github.com/Sales-Automation-Suite/P3SalesAutomationSuite/tree/main

<br>
<br>

<b>For UiPath Orchestrator & UiPath Assistant:</b>

<br>

1. Register account through UiPath Orchestrator

<br>

2. Create an Orchestrator Service on your Orchestrator account Home Page:
 * Select Create New
 * Select Add Tenant
 * Provide a Tenant Name then select Assign Licenses
 * Select Save

<br>

3. Open UiPath Assistant

<br>

4. Select Preferences

<br>

6. Select Orchestrator Settings

<br>

7. In the Connection Type drop-down menu, select Machine Key

<br>

8. On your Orchestrator Home page, select your newly created Orchestrator service under Orchestrator Services

<br>

9. Select Tenant

<br>

10. Select Machines

<br>

11. Select Add -> Add Standard Machine

<br>

12. In UiPath Assistant, in the Orchestrator Settings section, copy your Machine Name

<br>

13. In the UiPath Orchestrator Add Standard Machine page, enter your machine name into the Name box.

<br>

14. Under License - Unattended Runtimes (execution slots), enter 1.

<br>

15. Select Provision.

<br>

16. In your newly created provision, copy your Machine Key by selecting the Clipboard icon to the right.

<br>

17. In UiPath Assistant in Orchestrator Settings, enter the machine key into the Machine Key box.

<br>

18. In the UiPath Orchestrator Add Standard Machine page, copy everything in the web URL (left to right) up to the Tenant name/.

<br>

19. In UiPath Assistant in Orchestrator Settings, enter the copied web URL into the Orchestrator URL box.

<br>

20. Select Connect.

<br>

21. In UiPath Orchestrator in the Orchestrator tab, select the Default folder.

<br>

22. Select Robots.

<br>

23. Select Add -> Standard Robot 

<br>

24. Select  your Machine name in the Machine drop-down box.

<br>

25. Provide a name to your Robot in the Name box. You may also choose to provide a description for it in the Description box below.

<br>

26. Select Unattended in the Type drop-down box.

<br>

27. Enter your domain\username in the Domain\Username box.
* NOTE: This can be found in the Command Prompt
        - Open Command Prompt and in the SystemRoot:\Users\user, enter whoamI
         * <i>Ex. C:\Users\user>whoamI</i>
        - Hit Enter to return your domain\username

<br>

28. Enter your Windows password into the Password box.

<br>

29. Select Create
* NOTE: Your robot may take some time to connect. To ensure it's connected, refresh the page accordingly until you see it's connected.

<br>

30. In UiPath Studio, select Publish.

<br>

31. In the Publish Process page, ensure that in Publish options you have selected Orchestrator Tenant Processes Feed in the Publish to drop-down box.

<br>

32. Select Publish to Publish the project to your Orchestrator.

<br>

33. In UiPath Orchestrator, select Tenant.

<br>

34. Select Packages.

<br>

35. In the triple dot icon to the right of the project name, select View Versions to view the version for your project.

<br>

36. In UiPath Orchestrator, select the Default folder.

<br>

37. Select Environments.

<br>

38. Select Add

<br>

39. Enter a group name under Name.

* NOTE: You may also choose to enter a Description below.

<br>

40. Select Create

<br> 

41. On the Manage Environments prompt, select (checkmark) your robot and then select Update.

<br>

42. In the Default folder, select Home.

<br> 

43. Select Processes.

<br>

44. On the Processes page, select Add.

<br>

45. In the Package Overview drop-down box, select your project name.

<br>

46. Select the Package version you wish to use for your project. It is recommended you select the most recent version for optimal performance, but you can choose to rollback to an older version should multiple versions be purchased.

<br>

47. In Environment, select your created group name.

<br> 

48. Select Continue

<br>

49. Select Create

<br>

50. Select Start a Job.
  
<br>

51. Under Execution Target, select your robot name, and then select Start.

<br>

52. In UiPath Assistant, go to the Home page and select Refresh until your running automation displays below.
