SELECT
  (CASE
    WHEN Age >= 15 AND Age <= 19 THEN '15-19'
    WHEN Age >= 20 AND Age <= 24 THEN '20-24'
    WHEN Age >= 25 AND Age <= 29 THEN '25-29'
    WHEN Age >= 30 AND Age <= 34 THEN '30-34'
    WHEN Age >= 35 AND Age <= 39 THEN '35-39'
    WHEN Age >= 40 AND Age <= 44 THEN '40-44'
    WHEN Age >= 45 AND Age <= 49 THEN '45-49'
    ELSE '50+'
  END) AS Age_group,
  COUNT(Age) as Total_Patients
FROM
  `Clinic.patient` as p
JOIN `Clinic.appointment` a
ON p.PatientID = a.PatientID
GROUP BY Age_group
ORDER BY 2 desc
