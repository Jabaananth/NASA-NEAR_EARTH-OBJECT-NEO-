SELECT * FROM nasa_project.asteroids;
SELECT * FROM nasa_project.close_approach;

SELECT * FROM NASA_PROJECT.asteroids
limit 10;

-- Qures 1   
-- Count how many times each asteroid has approached Earth"
     
        SELECT ID,NAME, COUNT(*) AS approach_count
        FROM NASA_PROJECT.asteroids
        GROUP BY ID,NAME
        ORDER BY approach_count DESC;                                -- ---------------done----------------
    
-- Qures 2   
-- Average velocity of each asteroid over multiple approaches
    
SELECT ID, AVG(velocity) AS avg_velocity
FROM NASA_PROJECT.close_approach
GROUP BY ID
ORDER BY avg_velocity DESC;								        -- ---------------done------------
        
            
    
-- Qures 3   
-- List top 10 fastest asteroids
    
        SELECT month(CL_DATE)approach_month,count(*) AS total_approaches
        FROM NASA_PROJECT.close_approach
        where ORBIT_BODY='Earth'
        group by month(CL_DATE) 
        order by total_approaches DESC limit 1;                     -- ---------------done------------
       
    
 -- Qures 4   
-- Find potentially hazardous asteroids that have approached Earth more than 3 times""	

		SELECT NAME, COUNT(*) AS approach_count
        FROM NASA_PROJECT.asteroids
        WHERE HAZARDOUS = 1
        GROUP BY NAME
        HAVING COUNT(*) > 3;							-- -------------done-------------------

-- Qures 5   
-- Count of hazardous vs non-hazardous asteroids
    
        SELECT HAZARDOUS, COUNT(*) AS count
        FROM NASA_PROJECT.asteroids
        GROUP BY HAZARDOUS;											-- ---------------done------------
   

-- Qures 6   
-- Year with most asteroid approaches
    
        SELECT CL_DATE AS year, COUNT(*) AS count
        FROM NASA_PROJECT.close_approach
        GROUP BY CL_DATE
        ORDER BY count DESC;                                             -- -----------------done----------------

-- Qures 7   
-- Average size of asteroids
    
        SELECT AVG(DIAMETER_MIN + DIAMETER_MAX)/2 AS avg_size_km
        FROM NASA_PROJECT.asteroids;                                    -- ---------------done--------------------

-- Qures 8   
-- Asteroid with maximum estimated size
    
        SELECT NAME, MAX(DIAMETER_MAX) AS max_diameter_km
        FROM NASA_PROJECT.asteroids
        GROUP BY NAME
        ORDER BY max_diameter_km DESC;                                  -- -----------------done------------------

-- Qures 9   
-- Number of asteroids approaching each planet
    
        SELECT ORBIT_BODY, COUNT(*) AS count
        FROM NASA_PROJECT.close_approach
        GROUP BY ORBIT_BODY;                                          -- -------------------done---------------
 

-- Qures 10   
-- Monthly distribution of asteroid approaches
    
        SELECT MONTH(CL_DATE) AS month, COUNT(*) AS count
        FROM NASA_PROJECT.close_approach
        GROUP BY CL_DATE
        ORDER BY CL_DATE;                                               -- ---------------done------------------
   
 -- Qures 11   
-- Top 5 largest hazardous asteroids
    
        SELECT NAME, DIAMETER_MAX AS size_km
        FROM NASA_PROJECT.asteroids
        WHERE HAZARDOUS = 'Earth'
        ORDER BY size_km DESC;                                         -- --------------------done----------------
   
-- Qures 12   
-- Distribution of asteroids by speed range
    
        SELECT CASE 
                WHEN VELOCITY < 10000 THEN '< 10,000 km/h'
                WHEN VELOCITY BETWEEN 10000 AND 30000 THEN '10,000–30,000 km/h'
                ELSE '> 30,000 km/h'
            END AS VELOCITY, 
            COUNT(*) AS count
        FROM NASA_PROJECT.close_approach
        GROUP BY VELOCITY;
   
-- Qures 13   
-- Count of asteroids by year
    
        SELECT YEAR(CL_DATE) AS year, COUNT(*) AS count
        FROM NASA_PROJECT.close_approach
        GROUP BY CL_DATE
        ORDER BY CL_DATE;                                            -- --------------------done------------------

-- Qures 14   
-- Average velocity of hazardous vs non-hazardous
    
        SELECT ASTRONOMICAL, AVG(VELOCITY) AS avg_velocity
        FROM NASA_PROJECT.close_approach
        GROUP BY ASTRONOMICAL;                                          -- --------------done---------------------
    
-- 15
-- Number of asteroid approaches by weekday"
    
        SELECT DAYNAME(CL_DATE) AS weekday, COUNT(*) AS count
        FROM NASA_PROJECT.close_approach
        GROUP BY weekday
        ORDER BY FIELD(weekday, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');
                                                                        -- -----------------done-------------------
    
    
    



