-- Q1 Total number of Movies and TV Shows

SELECT 
	Content_type,
	COUNT(*) AS Total_Count
FROM Netflix
GROUP BY Content_type;

-- Q2 Most common Rating for Movies and TV Shows

SELECT
	Content_type,
	Rating AS Common_Rating
FROM
	(
		SELECT 
			Content_type,
			Rating,
			COUNT(*),
			RANK() OVER(PARTITION BY Content_type ORDER BY COUNT(*) DESC) AS Rank
		FROM Netflix
		GROUP BY Content_type, Rating 
		ORDER BY Content_type, COUNT(*) DESC
	)
WHERE Rank = 1;

--Q3 List all Movies released in 2020

SELECT 
	title As Movies
FROM Netflix
WHERE release_year = 2020 AND Content_type = 'Movie';

-- Q4 Top 5 Countries with most content on Netflix

SELECT
	-- Converting String into Array and 
	-- then unnesting each element from Array into separate row
	DISTINCT UNNEST(STRING_TO_ARRAY(Country, ',')) AS New_Country,
	COUNT(Show_id) as Content_Count
FROM Netflix
GROUP BY Country
ORDER BY Content_Count DESC LIMIT 5;

-- Q5 Identify the longest Movies

SELECT 
	title,
	duration
FROM Netflix
WHERE duration = (
					SELECT 
						MAX(duration)
					FROM Netflix
				 );

-- Q6 List all TV Shows with more than 3 Seasons

SELECT
	title,
	duration
FROM Netflix
WHERE Content_type = 'TV Show' AND duration >= '5 Seasons';

-- Q7 Find the content added in last 5 years

SELECT
	Content_type,
	title
FROM Netflix
WHERE CAST(date_added AS DATE) >= CURRENT_DATE - INTERVAL '5 years';

-- Q8 In how many Moview actor Salman Khan appeared in last 10 years

SELECT *,
	Content_type,
	title,
	release_year
FROM Netflix
WHERE casts LIKE '%Salman Khan%' AND 
release_year >= EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '10 years')
;

-- Q9 Top 10 actors who have appeared in highest number of Movies produced in India

SELECT 
	UNNEST(STRING_TO_ARRAY(casts,',')) AS Actors,
	COUNT(*) Total_content,
	RANK() OVER(ORDER BY COUNT(*) DESC)
FROM Netflix
WHERE country LIKE '%India%'
GROUP BY 1 LIMIT 10;


-- Q10 Categorize content as Action_Film OR Normal_Film and 
-- Count how many films fall into each category


WITH New_Table
AS
	(
	SELECT *,
		CASE 
		WHEN description ILIKE '%kill%' OR
			 description ILIKE '%violence%' 
		THEN 'Action_Film'
		ELSE 'Normal_Film'
		END Category
	FROM Netflix
	)
SELECT 
	Category,
	COUNT(*) AS Total_Count
FROM New_Table
GROUP BY 1;