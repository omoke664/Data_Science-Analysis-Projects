/*ANALYSIS OF COFFEE CONSUMPTION IN INDIA USING SQL*/
USE coffee;
SELECT 
    *
FROM
    coffee_data;

-- DEMOGRAPHICS & CONSUMPTION PATTERNS
-- is there a preference for different coffee brands among different gender
SELECT 
    gender, coffee_type, AVG(daily_cups) AS avg_cups
FROM
    coffee_data
GROUP BY gender , coffee_type
ORDER BY gender , avg_cups DESC;
-- what age group consumes the most coffee on average?
SELECT 
    age_group, FLOOR(AVG(daily_cups)) AS daily_cups_consumed
FROM
    coffee_data
GROUP BY age_group
ORDER BY daily_cups_consumed DESC;
-- does gender have an influence on weekly cafe visits
SELECT 
    gender, AVG(cafe_visit_weekly) AS avg_visits
FROM
    coffee_data
GROUP BY gender
ORDER BY avg_visits DESC;
-- is there a significant difference in coffee consumption between males and females?
SELECT 
    gender, SUM(daily_cups) AS daily_cups
FROM
    coffee_data
GROUP BY gender
ORDER BY daily_cups DESC;

SELECT 
    gender, AVG(daily_cups) AS avg_daily_cups
FROM
    coffee_data
GROUP BY gender
ORDER BY avg_daily_cups DESC;
-- what is the total number of coffee customers from each state and city
SELECT 
    state, city, COUNT(*) AS customers
FROM
    coffee_data
GROUP BY state , city
ORDER BY customers DESC;

-- which city has the highest average daily number of cups consumed?
SELECT 
    state, city, AVG(daily_cups) AS avg_daily_cups
FROM
    coffee_data
GROUP BY state , city
ORDER BY avg_daily_cups DESC;

-- total number of cups consumed in each city
SELECT 
    state, city, SUM(daily_cups) AS total_daily_cups
FROM
    coffee_data
GROUP BY state , city
ORDER BY total_daily_cups DESC;


-- BRAND & COFFEE TYPE PREFERENCES
-- what is the most popular brand
SELECT 
    coffee_type, SUM(daily_cups) AS total_cups
FROM
    coffee_data
GROUP BY coffee_type
ORDER BY total_cups DESC;
-- ON AVERAGE
SELECT 
    coffee_type, AVG(daily_cups) AS avg_total_cups
FROM
    coffee_data
GROUP BY coffee_type
ORDER BY avg_total_cups DESC;
-- which coffee type is most popular among different age groups?
SELECT 
    age_group, coffee_type, SUM(daily_cups) AS total_cups
FROM
    coffee_data
GROUP BY age_group , coffee_type
ORDER BY total_cups DESC;

SELECT 
    age_group, coffee_type, AVG(daily_cups) AS avg_total_cups
FROM
    coffee_data
GROUP BY age_group , coffee_type
ORDER BY avg_total_cups DESC;
-- what is the most preferred coffee brand overall? Does preference vary by state?
SELECT 
    coffee_type, COUNT(coffee_type) AS total_cups
FROM
    coffee_data
GROUP BY coffee_type
ORDER BY total_cups DESC;

-- by state
SELECT 
    state, coffee_type, COUNT(coffee_type) AS total_cups
FROM
    coffee_data
GROUP BY state , coffee_type
ORDER BY state , total_cups DESC;

-- do people who consume coffee more tend to prefer a specific brand?

SELECT 
    age_group, AVG(monthly_expense) AS avg_expense
FROM
    coffee_data
GROUP BY age_group
ORDER BY avg_expense DESC;
-- do people who visit cafe's more frequently spend more on coffee monthly?
SELECT 
    consumption_setting, AVG(monthly_expense) AS avg_spending
FROM
    coffee_data
GROUP BY consumption_setting
ORDER BY avg_spending DESC;
-- which city has the highest average monthly coffee expenditure?
SELECT 
    state, city, AVG(monthly_expense) AS avg_spending
FROM
    coffee_data
GROUP BY state , city
ORDER BY avg_spending DESC;

-- CONSUMPTION SETTING & HABITS
-- where do most people prefer to consume coffee (Home, Cafe, Work, etc.)
SELECT 
    consumption_setting, COUNT(*) AS no_of_customers
FROM
    coffee_data
GROUP BY consumption_setting
ORDER BY no_of_customers DESC;
-- does the reason for consumption (Taste, Habit, socializing) vary by age group?
SELECT 
    age_group, consumption_setting, COUNT(*) AS no_of_customers
FROM
    coffee_data
GROUP BY age_group , consumption_setting
ORDER BY age_group , no_of_customers DESC;

-- which time of the day is coffee most commonly consumed?
SELECT 
    preferred_time, COUNT(*) AS sales
FROM
    coffee_data
GROUP BY preferred_time
ORDER BY sales DESC;
-- SOCIAL MEDIA INFLUENCE & TRENDS
-- does social media influence younger consumers more than older ones?
-- total number of customers who were influecned by social media from each age group
SELECT 
    age_group, COUNT(*) AS customers
FROM
    coffee_data
WHERE
    influence_social_media = 'Yes'
GROUP BY age_group
ORDER BY customers DESC;
-- assessing percentage of customers from each age group who were influenced by social media
SELECT 
    age_group,
    ((SELECT 
            COUNT(*)
        FROM
            coffee_data
        WHERE
            influence_social_media = 'Yes') / (SELECT 
            COUNT(*)
        FROM
            coffee_data)) * 100 AS percentage
FROM
    coffee_data
GROUP BY age_group
ORDER BY age_group;

    
    
-- do people who are aware of specialty coffee spend more on coffee?
SELECT 
    awareness_of_specialty, AVG(monthly_expense) AS avg_spending
FROM
    coffee_data
GROUP BY awareness_of_specialty
ORDER BY avg_spending DESC;
-- is there a correlation between cafe visits and social media influence? 

SELECT 
    *
FROM
    coffee_data;
SELECT 
    influence_social_media,
    AVG(cafe_visit_weekly) avg_cafe_visits
FROM
    coffee_data
GROUP BY influence_social_media
ORDER BY avg_cafe_visits DESC;

-- does the reason for taking coffee have an impact on monthly expenses
SELECT 
    reason, AVG(monthly_expense) AS expense
FROM
    coffee_data
GROUP BY reason
ORDER BY expense DESC;

-- Does the reason for taking coffee have an influence on the avg daily cups taken
SELECT 
    reason, AVG(daily_cups) AS avg_cups
FROM
    coffee_data
GROUP BY reason
ORDER BY avg_cups DESC;


-- does sugar preference have an influence on daily cups taken
SELECT 
    sugar, AVG(daily_cups) AS avg_cups
FROM
    coffee_data
GROUP BY sugar
ORDER BY avg_cups DESC;

-- what about milk
SELECT 
    milk, AVG(daily_cups) AS avg_cups
FROM
    coffee_data
GROUP BY milk
ORDER BY avg_cups DESC;


-- what influence does sugar and milk preference have on monthly coffee expenses
SELECT 
    sugar, AVG(monthly_expense) AS avg_spending
FROM
    coffee_data
GROUP BY sugar
ORDER BY avg_spending DESC;

-- milk
SELECT 
    milk, AVG(monthly_expense) AS avg_spending
FROM
    coffee_data
GROUP BY milk
ORDER BY avg_spending DESC;

-- does time have an influence on monthly expenses
SELECT preferred_time, AVG(monthly_expense) AS avg_expense
FROM coffee_data
GROUP BY preferred_time
ORDER BY avg_expense DESC;

-- does time have an influence on the amt of cups taken 
SELECT preferred_time, AVG(daily_cups) AS avg_cups
FROM coffee_data
GROUP BY preferred_time
ORDER BY avg_cups DESC;
