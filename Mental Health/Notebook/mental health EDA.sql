
-- EDA ON MENTAL HEALTH  IN TECH INDUSTRY

SELECT * FROM cleaned_survey2;

-- Total participants
SELECT  COUNT(*) AS Total_participants FROM cleaned_survey2;

-- Employees who reaported mental health issue/how many employees have sought mental heath treatment
SELECT  COUNT(*) AS Total_employees_with_mental_health FROM cleaned_survey2
WHERE treatment = "Yes";

-- Percentage who have sought treatment
WITH Treated AS
(SELECT  COUNT(*) AS Total_employees_with_mental_health FROM cleaned_survey2
WHERE treatment = 'Yes'
)
SELECT Total_employees_with_mental_health*100/(SELECT  COUNT(*) AS Total_participants FROM cleaned_survey2)
FROM Treated;

-- Treatment rate by geographical disparities
-- mental health treatment by country
SELECT  Country, treatment, COUNT(*) AS Total FROM cleaned_survey2
WHERE  Total>=10
GROUP BY Country, treatment
;

-- how doe Age affect treatment
SELECT CASE
						WHEN Age bETWEEN 18 AND 24 THEN "24 And Below"
                        WHEN Age bETWEEN 25 AND 34 THEN "25 - 34"
                        WHEN Age bETWEEN 35 AND 44 THEN "35 - 44"
                        WHEN Age bETWEEN 45 AND 54 THEN "45 - 54"
                        ELSE "55 And Above"
				END AS Age_group,
treatment , COUNT(*) AS count FROM cleaned_survey2
GROUP BY Age_group, treatment
ORDER BY count DESC;

-- how does Gender affect treatment
SELECT Gender, treatment, COUNT(*)  FROM cleaned_survey2
GROUP BY Gender, treatment;

-- how self_employment correlate with treatment
SELECT self_employed, treatment, COUNT(*) FROM cleaned_survey2
GROUP BY self_employed, treatment;

-- campany size and corelation with treatment
SELECT no_employees, treatment, COUNT(*) FROM  cleaned_survey2
GROUP BY no_employees, treatment
ORDER BY no_employees DESC;

-- Are company offering enough support to employees mental health
SELECT benefits, treatment, COUNT(*) FROM  cleaned_survey2
GROUP BY benefits, treatment;

-- does presence of wellness encourage treatment
SELECT wellness_program, treatment, COUNT(*) FROM  cleaned_survey2
GROUP BY wellness_program, treatment;

-- What are the consequences of disclosing mental health issue
SELECT obs_consequence, treatment, COUNT(*) AS count
FROM cleaned_survey2
GROUP BY obs_consequence, treatment;
 
-- does consequences of disclosing vary by gender, comapny size
SELECT obs_consequence, gender, count(*) FROM cleaned_survey2
GROUP BY obs_consequence, gender
ORDER BY gender;

SELECT obs_consequence, no_employees, count(*) FROM cleaned_survey2
GROUP BY obs_consequence, no_employees
ORDER BY no_employees;




                        


