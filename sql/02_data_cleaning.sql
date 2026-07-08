-- =====================================================
-- 02_DATA_CLEANING.SQL
-- -----------------------------------------------------


-- -----------------------------------------------------
-- CREATE A CLEANING DATA COPY
-- -----------------------------------------------------
SELECT *
INTO diabetes_readmission_clean
FROM diabetes_readmission;


-- -----------------------------------------------------
-- CHECK FOR DUPLICATE ENCOUNTERS
-- -----------------------------------------------------

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT encounter_id) AS unique_encounters
FROM diabetes_readmission_clean;


-- -----------------------------------------------------
-- CHECK GENDER VALUES
-- -----------------------------------------------------

SELECT
    gender,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY gender;


-- -----------------------------------------------------
-- CHECK RACE VALUES
-- -----------------------------------------------------

SELECT
    race,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY race;

-- Replace missing race values

UPDATE diabetes_readmission_clean
SET race = 'Unknown'
WHERE race = '?';

-- Verify cleaning

SELECT
    race,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY race;


-- -----------------------------------------------------
-- CHECK PAYER CODE
-- -----------------------------------------------------

SELECT
    payer_code,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY payer_code
ORDER BY patients DESC;

-- Replace missing payer codes

UPDATE diabetes_readmission_clean
SET payer_code = 'Unknown'
WHERE payer_code = '?';

-- Verify cleaning

SELECT
    payer_code,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY payer_code
ORDER BY patients DESC;


-- -----------------------------------------------------
-- CHECK MEDICAL SPECIALTY
-- -----------------------------------------------------

SELECT
    medical_specialty,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY medical_specialty
ORDER BY patients DESC;

-- Replace missing medical specialties

UPDATE diabetes_readmission_clean
SET medical_specialty = 'Unknown'
WHERE medical_specialty = '?';

-- Verify cleaning

SELECT
    medical_specialty,
    COUNT(*) AS patients
FROM diabetes_readmission_clean
GROUP BY medical_specialty
ORDER BY patients DESC;


-- -----------------------------------------------------
-- FINAL DATASET CHECK

SELECT COUNT(*) AS total_records
FROM diabetes_readmission_clean;
