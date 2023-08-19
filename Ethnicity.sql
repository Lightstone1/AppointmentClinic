
WITH cancellations as (

SELECT 
 p.Ethnicity as ethnicity,
  COUNT(Attendance) as   cancellation_frequency
FROM `dataverse-392722.Clinic.appointment` as a
JOIN `dataverse-392722.Clinic.patient` as p
  on a.PatientID = p.PatientID
WHERE Attendance in ('Did Not Attend (DNA)', 'Cancelled')
GROUP BY 1
ORDER BY 2 DESC
),

total_attendance as (

SELECT 
  p.Ethnicity as ethnicity,
  COUNT(Attendance) as   total_attendance
FROM `dataverse-392722.Clinic.appointment` as a
JOIN `dataverse-392722.Clinic.patient` as p
  on a.PatientID = p.PatientID
GROUP BY 1
ORDER BY 2 DESC
)

SELECT
  c.ethnicity,
  ROUND((cancellation_frequency/total_attendance*100), 2) AS cancellation_rate
FROM cancellations as c
JOIN total_attendance as t
  on c.ethnicity = t.ethnicity 
ORDER BY 2 desc 

