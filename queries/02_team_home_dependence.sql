-- ============================================================
-- QUERY 2: Which Teams Rely on Home Advantage Most?
-- Question: Do some teams benefit from their home crowd more than others?
-- Concepts: GROUP BY, HAVING, AVG, calculated fields
-- ============================================================

SELECT 
  team,
  COUNT(*) AS seasons,
  ROUND(AVG(home_wins), 1) AS avg_home_wins,
  ROUND(AVG(away_wins), 1) AS avg_away_wins,
  ROUND(AVG(home_wins) - AVG(away_wins), 1) AS home_advantage_gap,
  ROUND(AVG(home_goals_for), 1) AS avg_home_goals,
  ROUND(AVG(away_goals_for), 1) AS avg_away_goals
FROM `premier_league.teams_seasons`
GROUP BY team
HAVING COUNT(*) >= 4
ORDER BY home_advantage_gap DESC;

-- FINDING: Teams like Arsenal and Tottenham show a large home advantage gap,
-- while top teams like Manchester City perform almost equally well home and away,
-- suggesting elite squads are less dependent on crowd support.
