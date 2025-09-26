USE MentalHealth;

INSERT INTO anxiety_depression_data (
    Age, Gender, Employment_Status, Education_Level, 
    Financial_Stress, Work_Stress, Chronic_Illnesses, 
    Family_History_Mental_Illness, Therapy, Meditation, 
    Physical_Activity_Hours, Sleep_Hours, Stress_Level, 
    Anxiety_Score, Depression_Score, Life_Satisfaction_Score, 
    Self_Esteem_Score, Social_Support_Score, Loneliness_Score
)
SELECT 
    Age, Gender, Employment_Status, Education_Level,
    Financial_Stress, Work_Stress, Chronic_Illnesses,
    Family_History_Mental_Illness, Therapy, Meditation,
    Physical_Activity_Hrs, Sleep_Hours, Stress_Level,
    Anxiety_Score, Depression_Score, Life_Satisfaction_Score,
    Self_Esteem_Score, Social_Support_Score, Loneliness_Score
FROM mental_health_data;