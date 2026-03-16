-- ============================================================
-- QUERY 3: Does Home Form Win Titles?
-- Question: Is the best home team each season also the league champion?
-- Concepts: RANK() window function, PARTITION BY, ORDER BY
-- ============================================================

SELECT 
  season,
  team,
  home_wins,
  home_goals_for,
  RANK() OVER (PARTITION BY season ORDER BY home_wins DESC, home_goals_for DESC) AS home_rank,
  final_position AS actual_position
FROM `premier_league.teams_seasons`
ORDER BY season, home_rank;

-- FINDING: The team with the best home record almost always finishes in the
-- top 2. Home dominance is strongly correlated with title-winning seasons,
-- reinforcing that building a "fortress" at home is crucial for championship bids.
