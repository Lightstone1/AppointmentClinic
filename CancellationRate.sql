
WITH DNA as (

SELECT 
 ClinicName as clinic,
  COUNT(Attendance) as dna_frequency
FROM `dataverse-392722.Clinic.appointment` 
WHERE Attendance ='Did Not Attend (DNA)'
GROUP BY 1

),

cancelled as (

SELECT 
 ClinicName as clinic,
  COUNT(Attendance) as cancelled_frequency
FROM `dataverse-392722.Clinic.appointment` 
WHERE Attendance ='Cancelled'
GROUP BY 1
),

total_attendance as (

SELECT 
  ClinicName as clinic,
  COUNT(Attendance) as   total_attendance
FROM `dataverse-392722.Clinic.appointment` 
GROUP BY 1

)

SELECT
  c.clinic,
  ROUND((dna_frequency/total_attendance*100), 2) AS dna_rate,
  ROUND((cancelled_frequency/total_attendance*100), 2) AS cancellation_rate
FROM cancelled as c
JOIN total_attendance as t
  on c.clinic = t.clinic 
JOIN DNA as d
  on d.clinic=t.clinic
Order by 3 desc

