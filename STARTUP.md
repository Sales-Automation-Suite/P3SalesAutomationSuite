## Installation & Startup:
<br>

1. Make sure you are running Windows 10 or 11 and the latest updates are installed for the system
 * Windows 10
  - https://www.microsoft.com/en-us/software-download/windows10
 * Windows 11
  - https://www.microsoft.com/software-download/windows11

2. Install Microsoft Edge Browser
 - https://www.microsoft.com/en-us/edge

3. Install Microsoft Excel
 - https://www.microsoft.com/en-us/microsoft-365/excel

4. Install UiPath Studio and UiPath Assistant
 - https://docs.uipath.com/installation-and-upgrade/docs/studio-install-studio

5. Open UiPath Assistant and select Sign In.

6. Select Open UiPath in the new window to sign in and connect to Orchestrator.

7. Navigate to UiPath Orchestrator from the left side of the screen.

8. Navigate to the folder where SAS is stored.

9. Select Automations from the tab. SAS is currently labeled as Project.3.

10. Select the 'Start a Job' icon from the right to begin the automation.

11. When prompted with File Explorer window, select the Template.xlsx file to begin job data collection.

![SAS RunTime Excel](https://user-images.githubusercontent.com/51932270/144765302-faccbd2e-e625-45be-84d2-1193086ff7e9.JPG)


* NOTE: Searches can be modified within the Template.xlsx file. To do so, open the file
  1. Before program runtime
  2. During program runtime (ex. right-click -> Open)
        
12. During runtime, SAS creates a several folders on your system's root directory (revature\Project 3\excelsheet). 

13. Separate Excel files will be created during runtime. This is where collected job data will be printed:
  * CompanyName(Filter).xlsx
  * Job(Filtered).xlsx
  * Job.xlsx

![SAS Folder Path   File Creation](https://user-images.githubusercontent.com/51932270/144765489-11a943cd-88aa-4d78-bad8-a0a16339a3fa.JPG)



