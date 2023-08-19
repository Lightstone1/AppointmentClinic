SELECT
    FORMAT_DATE('%B', ApptDate) AS AppointmentMonth,
    COUNT(CASE WHEN  DATE_DIFF(ApptDate, BookedDate, DAY) < 7 THEN 1 END) AS AppointmentsLessThan7Days,
    COUNT(*) AS TotalAppointments,
    Round((COUNT(CASE WHEN DATE_DIFF(ApptDate, BookedDate, DAY) < 7 THEN 1 END) / COUNT(*)) * 100, 2) AS PercentageLessThan7Days
FROM
    `Clinic.appointment` 
GROUP BY
    1
ORDER BY
   4;
