-- =====================================================
-- DIABETES HOSPITAL READMISSION ANALYSIS


-- 01_DATA_EXPLORATION.SQL

-- =====================================================
-- DATASET OVERVIEW
-- ------------------------------------------------------

-- View first 10 records
SELECT TOP 10 *
FROM diabetes_readmission;

-- Count total number of patient encounters
SELECT COUNT(*) AS total_patients
FROM diabetes_readmission;


-- -----------------------------------------------------
-- OUTCOME VARIABLE
-- -----------------------------------------------------

-- Readmission categories
SELECT
    readmitted,
    COUNT(*) AS number_of_patients
FROM diabetes_readmission
GROUP BY readmitted;


-- -----------------------------------------------------
-- DEMOGRAPHIC VARIABLES
-- -----------------------------------------------------

-- Age distribution
SELECT
    age,
    COUNT(*) AS patients
FROM diabetes_readmission
GROUP BY age
ORDER BY age;

-- Gender distribution
SELECT
    gender,
    COUNT(*) AS patients
FROM diabetes_readmission
GROUP BY gender
ORDER BY patients DESC;


-- -----------------------------------------------------
-- INSURANCE / PAYER INFORMATION
-- -----------------------------------------------------

-- Number of patients by payer code
SELECT
    payer_code,
    COUNT(*) AS sponsored_patients
FROM diabetes_readmission
GROUP BY payer_code
ORDER BY sponsored_patients DESC;


-- -----------------------------------------------------
-- HOSPITAL ADMISSION VARIABLES
-- -----------------------------------------------------

-- Admission Type Distribution
SELECT
    admission_type_id,
    CASE admission_type_id
        WHEN 1 THEN 'Emergency'
        WHEN 2 THEN 'Urgent'
        WHEN 3 THEN 'Elective'
        WHEN 4 THEN 'Newborn'
        WHEN 5 THEN 'Not Available'
        WHEN 6 THEN 'Missing'
        WHEN 7 THEN 'Trauma Center'
        WHEN 8 THEN 'Not Mapped'
        ELSE 'Unknown'
    END AS admission_type,
    COUNT(*) AS total_patients
FROM diabetes_readmission
GROUP BY admission_type_id
ORDER BY admission_type_id;


-- Admission Source Distribution
SELECT
    admission_source_id,
    CASE admission_source_id
        WHEN 1 THEN 'Physician Referral'
        WHEN 2 THEN 'Clinic Referral'
        WHEN 3 THEN 'HMO Referral'
        WHEN 4 THEN 'Transfer from Hospital'
        WHEN 5 THEN 'Transfer from Skilled Nursing Facility'
        WHEN 6 THEN 'Transfer from Health Care Facility'
        WHEN 7 THEN 'Emergency Room'
        WHEN 8 THEN 'Court/Law Enforcement'
        WHEN 9 THEN 'Not Available'
        WHEN 10 THEN 'Transfer from Critical Access Hospital'
        WHEN 11 THEN 'Normal Delivery'
        WHEN 12 THEN 'Premature Delivery'
        WHEN 13 THEN 'Sick Baby'
        WHEN 14 THEN 'Extramural Birth'
        WHEN 15 THEN 'Not Available'
        WHEN 17 THEN 'Missing'
        WHEN 18 THEN 'Transfer from Home Health Agency'
        WHEN 19 THEN 'Readmission to Same Home Health Agency'
        WHEN 20 THEN 'Not Mapped'
        WHEN 21 THEN 'Unknown/Invalid'
        WHEN 22 THEN 'Transfer from Same Facility'
        WHEN 23 THEN 'Born Inside This Hospital'
        WHEN 24 THEN 'Born Outside This Hospital'
        WHEN 25 THEN 'Transfer from Ambulatory Surgery Center'
        WHEN 26 THEN 'Transfer from Hospice'
        ELSE 'Unknown'
    END AS admission_source,
    COUNT(*) AS total_patients
FROM diabetes_readmission
GROUP BY admission_source_id
ORDER BY total_patients DESC;


-- Discharge Disposition Distribution
SELECT
    discharge_disposition_id,
    CASE discharge_disposition_id
        WHEN 1 THEN 'Discharged to home'
        WHEN 2 THEN 'Transferred to another short-term hospital'
        WHEN 3 THEN 'Transferred to SNF'
        WHEN 4 THEN 'Transferred to ICF'
        WHEN 5 THEN 'Transferred to another inpatient institution'
        WHEN 6 THEN 'Home with home health service'
        WHEN 7 THEN 'Left Against Medical Advice'
        WHEN 8 THEN 'Home under Home IV provider'
        WHEN 9 THEN 'Admitted as inpatient to this hospital'
        WHEN 10 THEN 'Neonate transferred'
        WHEN 11 THEN 'Expired'
        WHEN 12 THEN 'Still patient/expected outpatient'
        WHEN 13 THEN 'Hospice (Home)'
        WHEN 14 THEN 'Hospice (Medical Facility)'
        WHEN 15 THEN 'Transferred to Medicare swing bed'
        WHEN 16 THEN 'Transferred for outpatient services'
        WHEN 17 THEN 'Referred to this institution'
        WHEN 18 THEN 'Missing'
        WHEN 19 THEN 'Expired at home (Hospice)'
        WHEN 20 THEN 'Expired in medical facility'
        WHEN 21 THEN 'Expired (Unknown place)'
        WHEN 22 THEN 'Transferred to rehabilitation'
        WHEN 23 THEN 'Transferred to long-term care hospital'
        WHEN 24 THEN 'Transferred to Medicaid nursing facility'
        WHEN 25 THEN 'Not Mapped'
        WHEN 26 THEN 'Unknown/Invalid'
        WHEN 27 THEN 'Federal health care facility'
        WHEN 28 THEN 'Psychiatric hospital'
        WHEN 29 THEN 'Critical Access Hospital'
        WHEN 30 THEN 'Other Health Care Institution'
        ELSE 'Unknown'
    END AS discharge_disposition,
    COUNT(*) AS total_patients
FROM diabetes_readmission
GROUP BY discharge_disposition_id
ORDER BY total_patients DESC;


-- -----------------------------------------------------
-- NUMERICAL VARIABLES
-- -----------------------------------------------------

-- Length of hospital stay
SELECT
    MIN(time_in_hospital) AS minimum_days,
    MAX(time_in_hospital) AS maximum_days,
    AVG(time_in_hospital) AS average_days
FROM diabetes_readmission;

-- Number of laboratory procedures
SELECT
    MIN(num_lab_procedures) AS minimum_lab_tests,
    MAX(num_lab_procedures) AS maximum_lab_tests,
    AVG(num_lab_procedures) AS average_lab_tests
FROM diabetes_readmission;

-- Number of medications
SELECT
    MIN(num_medications) AS minimum_medications,
    MAX(num_medications) AS maximum_medications,
    AVG(num_medications) AS average_medications
FROM diabetes_readmission;

-- Previous inpatient visits
SELECT
    MIN(number_inpatient) AS minimum_inpatient_visits,
    MAX(number_inpatient) AS maximum_inpatient_visits,
    AVG(number_inpatient) AS average_inpatient_visits
FROM diabetes_readmission;


-- -----------------------------------------------------
-- CLINICAL VARIABLES
-- -----------------------------------------------------

-- Top 10 primary diagnoses
SELECT TOP 10
    diag_1,
    COUNT(*) AS patients
FROM diabetes_readmission
GROUP BY diag_1
ORDER BY patients DESC;

-- Top 10 secondary diagnoses
SELECT TOP 10
    diag_2,
    COUNT(*) AS patients
FROM diabetes_readmission
GROUP BY diag_2
ORDER BY patients DESC;

-- Top 10 tertiary diagnoses
SELECT TOP 10
    diag_3,
    COUNT(*) AS patients
FROM diabetes_readmission
GROUP BY diag_3
ORDER BY patients DESC;
