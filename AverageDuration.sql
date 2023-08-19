SELECT 
ClinicName,
CEILING(avg(Duration)) as  average_duration
 FROM `dataverse-392722.Clinic.appointment` 
group by ClinicName
order by 2 DESC

 
