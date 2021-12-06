EMSIReadMeFirst.md

Element Exists was created as a library to deal with a popup
    library is in the 'Libraries' directory

Library files are included
    in EMSIpopUp directory

Do While loops have been put in place for Element Exists
    this solves issue with a delay in the site loading
    also solves issue with a dealy in finding the company

There is a 15 second delay in place between company search and scrape
    this solves issue with a delay in information updating
        this delay had been rather lengthy

Tried to swap delay with 'Element Attribute Change Trigger' activity
    did not work

Tried to use simulated click/type
    did not work

# 12/03/2021
    replaced the 15 second delay with Do While loop
        checks to verify that the postings data changed before continuing
    EMSI website now opens and closes for each company searched