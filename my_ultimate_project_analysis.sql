select*
from staging_healthcare
limit 5;
-- total by gender
select gender, count(*) as total_by_gender , round((count(*)*100/sum(count(name)) over()),2) percentage
from staging_healthcare
group by gender;

-- total by blood type

select `Blood Type`, count(*) as total_by_gender , round((count(*)*100/sum(count(name)) over()),2) percentage
from staging_healthcare
group by `Blood Type`;

-- total by medical condition

select `Medical Condition`, count(*) as total_by_gender , round((count(*)*100/sum(count(name)) over()),2) percentage
from staging_healthcare
group by `Medical Condition`
order by total_by_gender desc
;
-- total by medical condition and gender
select `Medical Condition`,gender, count(*) as total_by_gender , round((count(*)*100/sum(count(name)) over()),2) percentage
from staging_healthcare
group by `Medical Condition`,gender
order by `Medical Condition`;

-- total by medical condition, gender and blood type

select gender, `Medical Condition`,`Blood Type`, total_by_gender

from(select `Medical Condition`,gender,`Blood Type`, count(*) as total_by_gender , round((count(*)*100/sum(count(name)) over()),2) percentage
from staging_healthcare
group by `Medical Condition`,gender,`Blood Type`) as max_table
group by `Medical Condition`,gender ,`Blood Type`
order by `Medical Condition`

;
-- total billing amount by disease

select  `Medical Condition`,sum(`Billing Amount`) as total_amount_by_disease
from staging_healthcare
group by `Medical Condition`

order by total_amount_by_disease desc;

-- billing total by medicale condition  and gender

select  gender,`Medical Condition`,sum(`Billing Amount`) as total_amount_by_disease
from staging_healthcare
group by `Medical Condition`,gender
order by `Medical Condition`, total_amount_by_disease desc;

-- total by medicale condition and admission type

select `Medical Condition`,`Admission Type`,count(*) as total_person
from staging_healthcare
group by `Medical Condition`,`Admission Type`
order by `Medical Condition` asc;

select gender,`Admission Type`,count(*) as total_person
from staging_healthcare
group by gender,`Admission Type`
order by gender , total_person asc;
-- total by medical condition, admission type and medication

select `Medical Condition`,`Admission Type`,Medication,count(*) as total_person
from staging_healthcare
group by `Medical Condition`,`Admission Type`,Medication
order by `Medical Condition` asc;
-- age bracket

select name ,age,
case
when age <= 20 then 'young'
when age <= 59 then 'adult'
when age <=79 then  'old'
when age >79 then 'very old'
end as age_bracket
from staging_healthcare
order by age_bracket;


alter table staging_healthcare
add column age_bracket varchar(20);

update  staging_healthcare
set age_bracket= case
when age <= 20 then 'young'
when age <= 59 then 'adult'
when age <=79 then  'old'
when age >79 then 'very old'
end;










