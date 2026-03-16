-- ============================================================
-- QUERY 1: Home Advantage by Season
-- Question: Has home advantage in the Premier League declined?
-- Concepts: GROUP BY, aggregation, calculated fields
-- ============================================================

SELECT 
  season,
  SUM(home_wins) AS total_home_wins,
  SUM(home_draws) AS total_draws,
  SUM(home_losses) AS total_away_wins,
  ROUND(SUM(home_wins) / 380 * 100, 1) AS home_win_pct,
  ROUND(SUM(home_losses) / 380 * 100, 1) AS away_win_pct,
  SUM(home_goals_for) AS home_goals,
  SUM(away_goals_for) AS away_goals
FROM `premier_league.teams_seasons`
GROUP BY season
ORDER BY season;

-- FINDING: Home win percentage dropped during COVID seasons (2019-20, 2020-21)
-- when fans were banned from stadiums, supporting the theory that crowd
-- atmosphere is a significant factor in home advantage.
