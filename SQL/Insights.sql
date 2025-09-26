-- What is the demographic breakdown of our participants?
SELECT 
    Gender,
    COUNT(*) as ParticipantCount,
    AVG(CAST(Age AS INT)) as AverageAge,
    AVG(CAST(Anxiety_Score AS INT)) as AvgAnxiety
FROM anxiety_depression_data
GROUP BY Gender
ORDER BY ParticipantCount DESC;

-- Which employment group experiences the highest stress levels?
SELECT 
    Employment_Status,
    COUNT(*) as TotalPeople,
    AVG(CAST(Stress_Level AS INT)) as AvgStress,
    AVG(CAST(Work_Stress AS INT)) as AvgWorkStress
FROM anxiety_depression_data
GROUP BY Employment_Status
ORDER BY AvgStress DESC;

--Is therapy associated with better mental health outcomes?
SELECT 
    Therapy,
    COUNT(*) as ParticipantCount,
    AVG(CAST(Anxiety_Score AS INT)) as AvgAnxiety,
    AVG(CAST(Depression_Score AS INT)) as AvgDepression,
    AVG(CAST(Life_Satisfaction_Score AS INT)) as AvgLifeSatisfaction
FROM anxiety_depression_data
GROUP BY Therapy
ORDER BY Therapy;

-- How does family history of mental illness affect anxiety and depression scores?

SELECT 
    Family_History_Mental_Illness,
    COUNT(*) as TotalCases,
    AVG(CAST(Anxiety_Score AS INT)) as AvgAnxiety,
    AVG(CAST(Depression_Score AS INT)) as AvgDepression,
    AVG(CAST(Stress_Level AS INT)) as AvgStress
FROM anxiety_depression_data
GROUP BY Family_History_Mental_Illness;

-- Is there a relationship between sleep hours and mental health scores?

SELECT 
    CASE 
        WHEN CAST(Sleep_Hours AS DECIMAL(4,2)) < 6 THEN 'Less than 6 hours'
        WHEN CAST(Sleep_Hours AS DECIMAL(4,2)) BETWEEN 6 AND 8 THEN '6-8 hours'
        ELSE 'More than 8 hours'
    END as SleepCategory,
    COUNT(*) as PeopleCount,
    AVG(CAST(Anxiety_Score AS INT)) as AvgAnxiety,
    AVG(CAST(Depression_Score AS INT)) as AvgDepression,
    AVG(CAST(Stress_Level AS INT)) as AvgStress
FROM anxiety_depression_data
GROUP BY CASE 
    WHEN CAST(Sleep_Hours AS DECIMAL(4,2)) < 6 THEN 'Less than 6 hours'
    WHEN CAST(Sleep_Hours AS DECIMAL(4,2)) BETWEEN 6 AND 8 THEN '6-8 hours'
    ELSE 'More than 8 hours'
END
ORDER BY AvgAnxiety;

-- Who are our highest-risk participants (high anxiety + high depression)?

SELECT 
    COUNT(*) as HighRiskCount,
    AVG(CAST(Age AS INT)) as AverageAge,
    Gender,
    Employment_Status
FROM anxiety_depression_data
WHERE CAST(Anxiety_Score AS INT) > 15 
  AND CAST(Depression_Score AS INT) > 15
GROUP BY Gender, Employment_Status
ORDER BY HighRiskCount DESC;

-- Does physical activity correlate with better mental health?
SELECT 
    CASE 
        WHEN CAST(Physical_Activity_Hours AS DECIMAL(5,2)) = 0 THEN 'None'
        WHEN CAST(Physical_Activity_Hours AS DECIMAL(5,2)) <= 3 THEN 'Low (1-3 hrs)'
        WHEN CAST(Physical_Activity_Hours AS DECIMAL(5,2)) <= 7 THEN 'Moderate (4-7 hrs)'
        ELSE 'High (8+ hrs)'
    END as ActivityLevel,
    COUNT(*) as PeopleCount,
    AVG(CAST(Anxiety_Score AS INT)) as AvgAnxiety,
    AVG(CAST(Stress_Level AS INT)) as AvgStress,
    AVG(CAST(Life_Satisfaction_Score AS INT)) as AvgLifeSatisfaction
FROM anxiety_depression_data
GROUP BY CASE 
    WHEN CAST(Physical_Activity_Hours AS DECIMAL(5,2)) = 0 THEN 'None'
    WHEN CAST(Physical_Activity_Hours AS DECIMAL(5,2)) <= 3 THEN 'Low (1-3 hrs)'
    WHEN CAST(Physical_Activity_Hours AS DECIMAL(5,2)) <= 7 THEN 'Moderate (4-7 hrs)'
    ELSE 'High (8+ hrs)'
END
ORDER BY AvgAnxiety;