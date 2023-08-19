SELECT
  ClinicName as clinic,
    FORMAT_DATE('%B', DATE(TIMESTAMP_TRUNC(ApptDate, MONTH))) AS AppointmentMonth,
    SUM(IF(DATE_DIFF(ApptDate, BookedDate, DAY) < 7, 1, 0)) AS AppointmentsLessThan7Days,
    COUNT(*) AS TotalAppointments,
    ROUND((SUM(IF(DATE_DIFF(ApptDate, BookedDate, DAY) < 7, 1, 0)) / COUNT(*)) * 100, 2) AS PercentageLessThan7Days
FROM
    `Clinic.appointment`
GROUP BY
    clinic, AppointmentMonth
ORDER BY
    5;
