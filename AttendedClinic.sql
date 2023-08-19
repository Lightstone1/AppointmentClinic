SELECT
ClinicName,
count(Attendance) as frequency_attended
from
`Clinic.appointment`
where
Attendance = 'Attended'
group by
ClinicName
order by
2 desc
