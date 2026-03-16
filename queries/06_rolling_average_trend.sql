-- ============================================================
-- QUERY 6: Full Home Advantage Trend with Rolling Average
-- Question: What does the long-term trend look like when smoothed?
-- Concepts: CTE + window function (rolling average), CASE, ROUND
-- ============================================================

WITH yearly_stats AS (
  SELECT
    season,
    ROUND(SUM(home_wins) / 380.0 * 100, 1) AS home_win_pct,
    ROUND(SUM(home_losses) / 380.0 * 100, 1) AS away_win_pct,
    ROUND(SUM(home_goals_for) * 1.0 / SUM(home_goals_for + away_goals_for) * 100, 1) AS home_goal_share,
    CASE
      WHEN season IN ('2019-20', '2020-21') THEN 'COVID'
      ELSE 'Normal'
    END AS era
  FROM `premier_league.teams_seasons`
  GROUP BY season
)
SELECT
  season,
  era,
  home_win_pct,
  away_win_pct,
  home_goal_share,
  ROUND(AVG(home_win_pct) OVER (ORDER BY season ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING), 1) AS rolling_avg_home_pct
FROM yearly_stats
ORDER BY season;

-- FINDING: The rolling average reveals a gradual long-term decline in home
-- advantage across the Premier League, accelerated by COVID. Even after fans
-- returned, home win rates haven't fully recovered to pre-2019 levels,
-- suggesting the game may be permanently shifting toward more competitive
-- away performances due to tactical evolution, VAR, and improved away support.
