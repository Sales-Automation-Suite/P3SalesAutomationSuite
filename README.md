# P3SalesAutomationSuite
Revature UiPath 0927 batch repo for Sales Automation Suite.

### Flow Chart:
![Diagram](https://github.com/Sales-Automation-Suite/P3SalesAutomationSuite/blob/main/Diagram.JPG)


<br>
	
## Program Overview

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

## Compatibility:

SAS currently supports Windows 10 and Windows 11. 

<br>
<br>

## Program Flow Details

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


Each of these states are handled with various transitions, each being triggered under certain conditions:

<br>
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
<br>

<b>(4) Final State</b>

Entry:
- Terminates program.

<br>
<br>
<br>

## Runtime:
When running Sales Automation Suite (SAS), a window will display where SAS is installed. SAS will read job search keywords you wish to search from within the Template.xlsx file. The user must select this file to begin the automation process.

NOTE: To view or modify the current job search keyword(s), users must either:
 1. Open the file (ex. right click -> Open)
 OR
 2. Open the file outside of SAS runtime.
