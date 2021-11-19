Create table Indeed
(
    id serial primary key,
    JobTitles varchar(100),
    CompanyName varchar(100),
    JobLocation varchar(100),
    JobType Varchar (100),
    CompanySize varchar(100),
    NumberOfJobs varchar(100),
    PostDate varchar(100),
    SearchDate varchar(100),
    source varchar(20),
    URLlink varchar(1000)

);
Create table Dice
(
    id serial primary key,
    JobTitles varchar(100),
    CompanyName varchar(100),
    JobLocation varchar(100),
    PostDate varchar(100),
    SearchDate varchar(100),
    JobType Varchar (100),
    URLlink varchar(1000), 
    NumberOfJobs varchar(100),
    Source varchar(20)
    
);   

select * from Indeed;
select * from DICE;


drop table indeed;
drop table Dice;