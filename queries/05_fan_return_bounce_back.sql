-- ============================================================
-- QUERY 5: Which Teams Bounced Back When Fans Returned?
-- Question: After COVID, which teams improved most at home with fans back?
-- Concepts: Subqueries, JOIN, calculated difference
-- ============================================================

SELECT 
  covid.team,
  covid.covid_home_wins,
  post.post_covid_home_wins,
  post.post_covid_home_wins - covid.covid_home_wins AS improvement
FROM (
  SELECT team, SUM(home_wins) AS covid_home_wins
  FROM `premier_league.team_seasons`
  WHERE season IN ('2019-20', '2020-21')
  GROUP BY team
) covid
JOIN (
  SELECT team, SUM(home_wins) AS post_covid_home_wins
  FROM `premier_league.teams_seasons`
  WHERE season IN ('2021-22', '2022-23')
  GROUP BY team
) post
ON covid.team = post.team
ORDER BY improvement DESC;

-- FINDING: Some teams saw significant home improvement when fans returned,
-- suggesting their supporters play a measurable role in performance.
-- Teams with negative improvement actually performed worse with fans back,
-- indicating other factors (squad quality, management) matter more for them.
