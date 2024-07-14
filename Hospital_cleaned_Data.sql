-- Create a view named table1
CREATE VIEW table1 AS 
SELECT * 
FROM [Practice_2].[dbo].[HeartData];

-- Select all from table1 to verify view creation
SELECT * FROM table1;

-- Insert into new table to keep the original table intact
SELECT * INTO table2 FROM [Practice_2].[dbo].[HeartData];

-- Select all from table2 to verify data copy
SELECT * FROM table2;

-- Adding new column for gender instead of 0s and 1s
ALTER TABLE table2 ADD Gender VARCHAR(255);

-- Updating gender column based on sex column values
UPDATE table2
SET Gender = IIF(sex = 1, 'Male', 'Female');

-- Adding new column for chest pain levels
ALTER TABLE table2 ADD CP_Level VARCHAR(255);

-- Updating values for chest pain levels
UPDATE table2
SET CP_Level = 
    CASE 
        WHEN cp = 0 THEN 'Typical angina'
        WHEN cp = 1 THEN 'Atypical Angina'
        WHEN cp = 2 THEN 'Non-Anginal Pain'
        ELSE 'Asymptomatic'
    END;

-- Adding column EIA which means exercise induced angina
ALTER TABLE table2 ADD EIA VARCHAR(255);

-- Updating values for EIA
UPDATE table2
SET EIA = IIF(exang = 1, 'Yes', 'No');

-- Adding column Slope_result
ALTER TABLE table2 ADD Slope_result VARCHAR(255);

-- Updating values for Slope_result
UPDATE table2
SET Slope_result = 
    CASE 
        WHEN slope = 0 THEN 'Upsloping'
        WHEN slope = 1 THEN 'Flat'
        ELSE 'Downsloping'
    END;

-- Adding column Thal_results
ALTER TABLE table2 ADD Thal_results VARCHAR(255);

-- Updating values for Thal_results levels
UPDATE table2
SET Thal_results = 
    CASE 
        WHEN thal = 0 THEN 'normal'
        WHEN thal = 1 THEN 'fixed defect'
        ELSE 'reversible defect'
    END;

-- Adding column diseases_state
ALTER TABLE table2 ADD diseases_state VARCHAR(255);

-- Updating values for diseases_state levels
UPDATE table2
SET diseases_state = 
    CASE 
        WHEN condition = 0 THEN 'No'
        ELSE 'Yes'
    END;

-- Creating a new cleaned view for the hospital management to see and take decisions
CREATE VIEW Hospital AS 
SELECT 
    age,
    --Gender,
    CP_Level,
    trestbps,
    chol,
    fbs,
    restecg,
    thalach,
    EIA,
    oldpeak,
    Slope_result,
    Thal_results,
    diseases_state 
FROM table2;

-- Select all from the Hospital view to verify its creation
SELECT * FROM Hospital;
