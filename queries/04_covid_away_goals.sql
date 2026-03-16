-- ============================================================
-- QUERY 4: COVID Impact on Away Goal Scoring
-- Question: Did away teams score more when fans were absent?
-- Concepts: CTE (Common Table Expression), CASE statement
-- ============================================================

WITH season_avg AS (
  SELECT
    season,
    ROUND(AVG(home_goals_for), 2) AS avg_home_goals,
    ROUND(AVG(away_goals_for), 2) AS avg_away_goals,
    ROUND(AVG(home_goals_for) - AVG(away_goals_for), 2) AS home_goal_advantage,
    CASE
      WHEN season = '2019-20' THEN 'COVID partial'
      WHEN season = '2020-21' THEN 'COVID full'
      ELSE 'Normal'
    END AS fan_status
  FROM `premier_league.teams_seasons`
  GROUP BY season
)
SELECT *
FROM season_avg
ORDER BY season;

-- FINDING: The home goal advantage (difference between avg home goals scored
-- and avg away goals scored per team) shrinks during COVID seasons. Without
-- hostile crowds, away teams were less intimidated and created more chances,
-- narrowing the scoring gap.
