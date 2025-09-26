CREATE DATABASE MentalHealth;


USE MentalHealth;


CREATE TABLE anxiety_depression_data (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Age INT,
    Gender NVARCHAR(50),
    Employment_Status NVARCHAR(100),
    Education_Level NVARCHAR(100),
    Financial_Stress INT,
    Work_Stress INT,
    Chronic_Illnesses NVARCHAR(10), -- 'Yes' or 'No'
    Family_History_Mental_Illness NVARCHAR(10), -- 'Yes' or 'No'
    Therapy NVARCHAR(10), -- 'Yes' or 'No'
    Meditation NVARCHAR(10), -- 'Yes' or 'No'
    Physical_Activity_Hours DECIMAL(5,2),
    Sleep_Hours DECIMAL(4,2),
    Stress_Level INT,
    Anxiety_Score INT,
    Depression_Score INT,
    Life_Satisfaction_Score INT,
    Self_Esteem_Score INT,
    Social_Support_Score INT,
    Loneliness_Score INT
);