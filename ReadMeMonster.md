ReadMeMonster.md

# 11/18/2021
    started work on scraping Monster.com
    only able to scrape 10 jobs at this point
    no links to job page available in scrape
    output is to excel file monsterdata.xls
        not .xlsx as i do not have access to Excel
    
# 11/19/2021
    changed data scrape
        scrape gets each card
        need to parse info from each scrape
    only getting 9 results
        need to get more results
        
# 11/22/2021
    fixed selector issue
    added 'Element Exists' for company size
    fixed issue getting company size
    now able to scrape first 9 job results
    added scrape for 'Job Type'
        used an if 'Element Exists'
    added a click activity
        clicks job card to allow scroll down
    added a 'Send Hotkey' activity
        to page down in order to get more results
    now able to get 99 job results
    changed 'str_JobSearch' from variable to arguement
    is now considered finished
