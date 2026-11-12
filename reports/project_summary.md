# Diabetes Hospital Readmission Analysis — Project Summary

## 1. Project Overview

This project investigates hospital readmission patterns among patients with diabetes using the Diabetes 130-US Hospitals dataset. The analysis combines SQL Server for data exploration, cleaning and analysis with Power BI for interactive visualisation.

The objective is to examine how patient characteristics, hospital utilisation and admission and discharge pathways are associated with recorded hospital readmissions.

## 2. Key Findings

### Overall Readmission

- Approximately 102,000 hospital encounters were analysed.
- Approximately 46,900 encounters were associated with a recorded readmission.
- The overall recorded readmission rate was **46.1%**.
- The average hospital length of stay was **4.4 days**.

### Readmission by Race

Recorded readmission rates differed across racial groups:

| Race | Readmission Rate |
|---|---:|
| Caucasian | 46.9% |
| African American | 45.8% |
| Hispanic | 41.9% |
| Other | 39.2% |
| Asian | 35.3% |

These are descriptive differences and do not establish causal relationships.

### Medication Utilisation

Encounters followed by readmission within 30 days had a higher average number of recorded medications than encounters without recorded readmission.

### Previous Inpatient Visits

Encounters followed by readmission within 30 days had the highest average number of previous inpatient visits, suggesting an association between previous hospital utilisation and subsequent readmission.

### Admission Sources

Emergency room admissions and physician referrals accounted for the largest numbers of hospital encounters.

### Discharge Disposition

Discharge to home was the most common recorded discharge destination, followed by transfers to skilled nursing facilities and discharge to home with health services.

## 3. Tools and Methods

- **SQL Server:** Data exploration, data cleaning and readmission analysis.
- **Power BI:** Interactive dashboard development and visualisation.
- **DAX:** Calculation of readmission rates and healthcare utilisation measures.
- **GitHub:** Version control and project documentation.

## 4. Limitations

- The dataset represents historical hospital encounters from US hospitals and may not reflect current clinical practice.
- Multiple encounters may belong to the same patient.
- Some variables contain missing or unavailable information.
- The analysis identifies associations rather than causal relationships.
- Differences between patient groups have not been adjusted for potential confounding factors.

## 5. Conclusion

The analysis highlights differences in recorded readmission rates across demographic groups and suggests that previous inpatient utilisation and medication burden are associated with readmission status.

The findings demonstrate how SQL and Power BI can be used to explore hospital utilisation patterns and communicate insights relevant to healthcare service improvement.
