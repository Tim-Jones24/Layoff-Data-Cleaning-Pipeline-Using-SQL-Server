Select*
from [dbo].[layoffs]
---Identifying Duplicates
Select*,count(*)
from [dbo].[layoffs]
Group by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised
Having Count(*)>1
--Distinct Records
Select distinct *
From [dbo].[layoffs]
--Removing Duplicates
With EmpCte as
(
Select*, row_number () over ( Partition by [company],[location],[industry],[total_laid_off]
,[percentage_laid_off],[date],[stage],[country],[funds_raised] order by company) as rowno from [dbo].[layoffs]
)
delete from EmpCte where rowno > 1
--Fetching records from Modified Table
Select*
from [dbo].[layoffs]
--Chceking Nulls and blanks
Select funds_raised
from [dbo].[layoffs]
Where funds_raised is Null
--Replacing Nulls in location as N/A
Update [dbo].[layoffs]
Set location='N/A' where location is Null
--Replacing Nulls in Industry as N/A
Update [dbo].[layoffs]
Set industry='N/A' where industry is Null
--Fixing Nulls in total laid off with the average value derived
Select avg(total_laid_off) as 'mean value'
from [dbo].[layoffs]
--Fixing Nulls
Update [dbo].[layoffs]
Set total_laid_off=241 where total_laid_off is Null
---Fixing Nulls in Percentage_laid_off with the average value derived
Select avg(percentage_laid_off) as 'mean value'
from [dbo].[layoffs]
--Fixing Nulls
Update [dbo].[layoffs]
Set percentage_laid_off=0.277558440113525
where percentage_laid_off is Null
--Replacing Nulls in stage as N/A
Update [dbo].[layoffs]
Set stage='N/A' where stage is Null
--Fixing Nulls in funds_raised with the average value derived
Select avg(funds_raised) as 'mean value'
from [dbo].[layoffs]
--Fixing Nulls
Update [dbo].[layoffs]
Set funds_raised=775
where funds_raised=774.863410655409
