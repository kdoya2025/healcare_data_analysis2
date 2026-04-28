select *
from healthcare_dataset
limit 10;
-- creating a new table as the dable we will be cleanig
create table staging_healthcare
like healthcare_dataset;
insert into staging_healthcare
select *
from healthcare_dataset;
select*
from staging_healthcare;

-- removing dupplicate

select *,row_number() 
over(partition by `Name`, Age,gender, `Blood Type`,`Medical Condition`,
 `Date of Admission`,doctor,hospital,`Insurance Provider`,`Billing Amount`,
 `Room Number`,`Admission Type`,`Discharge Date`,Medication,`Test Results`)
from staging_healthcare;

with dupplicate as
(select *,row_number() 
over(partition by `Name`, Age,gender, `Blood Type`,`Medical Condition`,
 `Date of Admission`,doctor,hospital,`Insurance Provider`,`Billing Amount`,
 `Room Number`,`Admission Type`,`Discharge Date`,Medication,`Test Results`) as row_num
from staging_healthcare)
select*
from dupplicate
where row_num > 1;

-- there is no duppiclate

-- handling null value

select*
from staging_healthcare
where `Name`='' or `Name`= null
or Age='' or Age=null
or gender='' or gender= null
or `Blood Type`='' or `Blood Type`= null
or`Medical Condition`='' or`Medical Condition`= null
or`Date of Admission`='' or`Date of Admission`=null
or doctor='' or doctor=null 
or hospital=''  or hospital=null 
or`Insurance Provider`='' or`Insurance Provider`=null
or`Billing Amount`='' or`Billing Amount`=null
or`Room Number`='' or`Room Number`=''
or`Admission Type`='' or`Admission Type`=null
or`Discharge Date`='' or`Discharge Date`=null
or Medication =''  or Medication =null 
or`Test Results`='' or`Test Results`=null;
 -- there is n

-- standardize


 
select*
from staging_healthcare;

update staging_healthcare
set `Date of Admission`=str_to_date(`Date of Admission`,'%Y-%m-%d');

update staging_healthcare
set `Discharge Date`=str_to_date(`Discharge Date`,'%Y-%m-%d');


select distinct Gender
from staging_healthcare;



select distinct `medical condition`
from staging_healthcare;

select distinct `Blood Type`
from staging_healthcare;

select distinct `Insurance Provider`
from staging_healthcare;
update staging_healthcare
set `Insurance Provider`=replace(`Insurance Provider`,'UnitedHealthcare','United Healthcare');

select distinct `Admission Type`
from staging_healthcare
;

select distinct `Test Results`
from staging_healthcare;

select distinct `Medication`
from staging_healthcare;

update staging_healthcare
set`Name`=trim(`Name`),
 gender=trim(gender),
`Blood Type`=trim( `Blood Type`),
`Medical Condition`=trim(`Medical Condition`),
`Date of Admission`=(`Date of Admission`),
doctor= trim(doctor),
hospital=trim(hospital) ,
`Insurance Provider`=trim(`Insurance Provider`),
`Admission Type`=trim(`Admission Type`),
Medication =trim( Medication),
`Test Results`=trim(`Test Results`)
;





select*
from staging_healthcare











