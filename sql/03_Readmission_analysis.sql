
-- =====================================================
-- 03_READMISSION_ANALYSIS.SQL



-- -----------------------------------------------------
-- OVERALL READMISSION RATE
-- -----------------------------------------------------

SELECT
    readmitted,
    COUNT(*) AS patients,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM diabetes_readmission_clean),2
    ) AS percentage
FROM diabetes_readmission_clean
GROUP BY readmitted
ORDER BY percentage DESC;


-- -----------------------------------------------------
-- READMISSION BY AGE GROUP
-- -----------------------------------------------------

SELECT
    age,
    readmitted,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY age, readmitted
ORDER BY age;


-- -----------------------------------------------------
-- READMISSION BY GENDER
-- -----------------------------------------------------

SELECT
    gender,
    readmitted,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY gender, readmitted
ORDER BY gender;


-- -----------------------------------------------------
-- READMISSION BY RACE
-- -----------------------------------------------------

SELECT
    race,
    readmitted,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY race, readmitted
ORDER BY race;


-- -----------------------------------------------------
-- READMISSION BY PAYER CODE
-- -----------------------------------------------------

SELECT
    payer_code,
    readmitted,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY payer_code, readmitted
ORDER BY payer_code;


-- -----------------------------------------------------
-- READMISSION BY ADMISSION TYPE
-- -----------------------------------------------------

SELECT
    admission_type_id,
    readmitted,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY admission_type_id, readmitted
ORDER BY admission_type_id;


-- -----------------------------------------------------
-- READMISSION BY ADMISSION SOURCE
-- -----------------------------------------------------

SELECT
    admission_source_id,
    readmitted,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY admission_source_id, readmitted
ORDER BY admission_source_id;


-- -----------------------------------------------------
-- READMISSION BY DISCHARGE DISPOSITION
-- -----------------------------------------------------

SELECT
    discharge_disposition_id,
    readmitted,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY discharge_disposition_id, readmitted
ORDER BY discharge_disposition_id;


-- -----------------------------------------------------
-- AVERAGE LENGTH OF HOSPITAL STAY
-- -----------------------------------------------------

SELECT
    readmitted,
    AVG(time_in_hospital) AS average_hospital_stay
FROM diabetes_readmission_clean
GROUP BY readmitted;


-- -----------------------------------------------------
-- AVERAGE NUMBER OF MEDICATIONS
-- -----------------------------------------------------

SELECT
    readmitted,
    AVG(num_medications) AS average_medications
FROM diabetes_readmission_clean
GROUP BY readmitted;


-- -----------------------------------------------------
-- AVERAGE NUMBER OF LABORATORY PROCEDURES
-- -----------------------------------------------------

SELECT
    readmitted,
    AVG(num_lab_procedures) AS average_lab_procedures
FROM diabetes_readmission_clean
GROUP BY readmitted;


-- -----------------------------------------------------
-- AVERAGE NUMBER OF PREVIOUS INPATIENT VISITS
-- -----------------------------------------------------

SELECT
    readmitted,
    AVG(number_inpatient) AS average_previous_inpatient_visits
FROM diabetes_readmission_clean
GROUP BY readmitted;


-- -----------------------------------------------------
-- AVERAGE NUMBER OF PREVIOUS EMERGENCY VISITS
-- -----------------------------------------------------

SELECT
    readmitted,
    AVG(number_emergency) AS average_previous_emergency_visits
FROM diabetes_readmission_clean
GROUP BY readmitted;


-- -----------------------------------------------------
-- AVERAGE NUMBER OF PREVIOUS OUTPATIENT VISITS
-- -----------------------------------------------------

SELECT
    readmitted,
    AVG(number_outpatient) AS average_previous_outpatient_visits
FROM diabetes_readmission_clean
GROUP BY readmitted;


-- -----------------------------------------------------
-- TOP 10 PRIMARY DIAGNOSES AMONG READMITTED PATIENTS
-- -----------------------------------------------------

SELECT TOP 10
    diag_1,
    COUNT(*) AS readmitted_patients
FROM diabetes_readmission_clean
WHERE readmitted <> 'NO'
GROUP BY diag_1
ORDER BY readmitted_patients DESC;


-- -----------------------------------------------------
-- TOP 10 AGE GROUPS WITH THE HIGHEST READMISSIONS
-- -----------------------------------------------------

SELECT TOP 10
    age,
    COUNT(*) AS readmissions
FROM diabetes_readmission_clean
WHERE readmitted <> 'NO'
GROUP BY age
ORDER BY readmissions DESC;


-- -----------------------------------------------------
-- TOP 10 PATIENTS WITH THE LONGEST HOSPITAL STAY
-- -----------------------------------------------------

SELECT TOP 10
    encounter_id,
    patient_nbr,
    age,
    time_in_hospital,
    readmitted
FROM diabetes_readmission_clean
ORDER BY time_in_hospital DESC;


-- -----------------------------------------------------
-- READMISSION RATE BY NUMBER OF MEDICATIONS
-- -----------------------------------------------------

SELECT
    num_medications,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
WHERE readmitted <> 'NO'
GROUP BY num_medications
ORDER BY num_medications;
