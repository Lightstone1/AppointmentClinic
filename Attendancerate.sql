
WITH attended as (
SELECT
ClinicName as clinic,
count(Attendance) as frequency_attended
from
`Clinic.appointment`
where
Attendance = 'Attended'
group by
1
order by
2 desc
),

total_attendance as (
SELECT
ClinicName as clinic,
COUNT(attendance) as total_attendance
FROM
`Clinic.appointment` 
GROUP BY 1
)

SELECT
a.clinic,
Round((frequency_attended/total_attendance*100), 2) as rate_attendance
FROM
attended as a
JOIN total_attendance as t
  on a.clinic = t.clinic 
order by 2 desc
