# P3SalesAutomationSuite
Revature UiPath 0927 batch repo for Sales Automation Suite.

### Flow Chart:
![Diagram](https://github.com/Sales-Automation-Suite/P3SalesAutomationSuite/blob/main/Diagram.JPG)


<br>
	
## General Information

The UiPath Sales Automation Suite (SAS) is a robot used for automating job searches for users. This robot collects data from various job postings across multiple job search platforms and consolidates that information into one document.
These sites currently include:
 - LinkedIn
 - Indeed
 - Dice
 - Monster
 - ZipRecruiter
 - CareerBuilder
 - EMSI (for labor market data acquisition)

<br>
<br>

The Sales Automation Suite (SAS) primarily utilizes a state machine to handle different workflows for job search platforms and EMSI. The states included are:
<br>
<br>

(1) Initial State
<br>
(2) Add Data to Queue State
<br>
(3) Scrape data
<br>
(4) Final State
<br>
<br>

![SAS State Machine](https://user-images.githubusercontent.com/51932270/144765042-c82f7896-88a5-4033-b5a0-e37fd60d449b.JPG)


Each of these states are handled with various transitions, each being triggered under certain conditions:

<br>

<b>(1) Initial State</b>

Destinations:
T1 --> Destination: Add Data to Queue State
T2 --> Destination: Final State

Entry:
Uses Try Catch sequence:
-Try 
 -Select file activity to handle All files (*.*).
  - Output to variable "selectfile".
   - Assigns boolean type to "selected" variable.

Exit:
    - When "selected" variable evaluates to True, T1 transition is made to Add Data to Queue State
    - When "selected" variable evaluates to False, T2 transition is made to Final State.

<br>

<b>(2) Add Data to Queue State</b>
<br>

Destinations:
T3 --> Destination: Final State
T4 --> Destination: Scrape data

Entry:
- Go into AddQueue sequence:
 - Read Range utilizes selectfile variable to read created spreadsheet (Currently designated to "Sheet1")
 - Bulk Add Queue Items activity used for reading job keywords from spreadsheet and adding them as queues used for job searching.

Exit:
- Assign EndProgram to False to T4 transition is made to Scrape data state.
- Assign EndProgram to True to T3 transition is made to Final State.

<br>

<b>(3) Scrape data</b>

Destinations:
T5 --> Destination: Final State

Entry:
- Goes into Create Folder sequence to create Excel spreadsheet for posting job data.
- Goes to Get Transaction Item to read queues for processing.
- Goes to Flow Decision
 - False evaluates to Job Searching sequence (when queued items are still detected for transaction)
  - Accesses Job Searching sequence
   - Initiates job searching workflow in following order:
    1. LinkedIn
    2. Indeed
    3. Dice
    4. Monster
    5. ZipRecruiter
    6. CareerBuilder
    7. EMSI
    
    NOTE: Indeed and Dice workflows are processed in parallel:
                  LinkedIn
                     |
                     v
               Indeed -- Dice
                     |
                     v
               CareerBuilder
                     |
                     v
                  Monster
                     |
                     v
                ZipRecruiter
                     |
		     v
                    EMSI
                     |
                     v
	    Set Transaction Status

 - True evaluates to Log Message sequence 
  - Fatal: Program must terminate during queue processing.
  - Error: Error during queue processing.
  - Warn: Potential issue during processing.
  - Info: All queue items have been processed.
  - Trace: Tracking queue processing.
  NOTE: Default message is set to Info.
- When passing through LinkedIn workflow, program goes to Logging Out sequence, logging user out of site. A login for Linkedin is required to provide access to collecting certain data from site.
- Goes to Assign activity to evaluate EndProgram to True.
- Goes to PuttingDataTogether sequence to write collected job data to Excel sheet. 
- Goes to FilteringData sequence to read same Excel sheet and filter out duplicate job data. 

Exit: 
Upon Scrape data State completion, T5 transition is made to Final State

<br>

<b>(4) Final State</b>

Entry:
- Terminates program.

<br>
<br>

## Automation Inputs

Before, or at the start of, running Sales Automation Suite (SAS), the user will have the option to modify their search criteria in the Template.xlsx file. Users can modify:
1. Number of job keywords to search for (JobTitle column)
2. Number of searches made for each keyword (Number-Of_Job_Search column)

<br>

These modifications must be made underneath each column as such:
<br>

 ![image](https://user-images.githubusercontent.com/51932270/144953500-bef02c27-621d-45d1-8eb5-a2de34520c52.png)

In the example provided, the job keywords the user has decided to search for are "Engineer" and "Developer" jobs, and they wish to find the first 10 jobs under each search term.
When the user runs the program, SAS will run through each job platform and enter the keywords provided into the sites' search engines. 

<br>
<br>

## Automation Outputs

SAS will collect various job information on each site's Results page. This information includes:

* Company name
* Job location
* Job type
* Company size
* Number of unique jobs provided by the company
* Date the job was first posted
* Date the job was searched
* Company contact information
* Site where the job was originally posted
* URL for the found job

After SAS runtime completes, the job information will be stored in 3 different files:
 1. Job.xlsx - Shows various job data for each job keyword searched (see various job information listed above). Sheets will be created in this file for each site and the respective keywords used when searching those sites. 
 2. Job(Filtered).xlsx - Shows unique jobs found during search.
 3. CompanyName(Filter).xlsx - Shows unique company names found during search.

These files can be accessed via SystemRootDirectory\revature\Project 3\excelsheet. 

![image](https://user-images.githubusercontent.com/51932270/144967610-90018bb3-79e5-418e-85ef-38caf6f3a75e.png)

<i>Ex. Opened Job.xlsx file</i>

<br>
<br>

## Software Requirements

* UiPath Studio
* UiPath Orchestrator 
* UiPath Assistant
* Windows 10/11
* Microsoft Edge Browser

<br>
<br>

## License Requirements

* UiPath Community License

<br>
<br>

## UiPath Studio Project Dependencies

* Scroll Activity
