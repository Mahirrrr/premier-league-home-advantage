# Premier League Home Advantage Analysis

**Has home advantage declined in the Premier League? Did COVID prove that fans actually matter?**

This project analyzes 8 seasons of Premier League data (2017-18 through 2024-25) using SQL in Google BigQuery to investigate how home advantage has changed over time — with a particular focus on the impact of COVID-19 and empty stadiums.

## Key Findings

**1. Home advantage dropped during COVID — and hasn't fully recovered.**

When fans were banned from stadiums in 2019-20 and 2020-21, home win rates fell from ~45% to ~42%. Even after fans returned, the rate has stayed lower than pre-COVID levels, suggesting a permanent shift in the game.

**2. Away teams score more when stadiums are empty.**

The average goal advantage for home teams shrank during COVID seasons, supporting the idea that hostile crowds genuinely intimidate visiting players and influence referee decisions.

**3. Elite teams don't need home advantage — mid-table teams do.**

Manchester City performed almost equally well home and away across all 8 seasons. Meanwhile, clubs like Arsenal and Tottenham showed a much larger gap, suggesting their fans play a bigger role in results.

**4. The best home team almost always wins the league.**

Ranking teams by home wins each season, the #1 home team finishes as champion or runner-up in nearly every season analyzed.

**5. Some teams bounced back harder when fans returned.**

Comparing COVID-era home wins to post-COVID, certain clubs saw massive improvement when supporters came back, while others actually got worse — pointing to squad quality mattering more than atmosphere for some teams.

## SQL Concepts Demonstrated

| Query | Concept | File |
|-------|---------|------|
| Home advantage by season | `GROUP BY`, aggregation | [01_home_advantage_by_season.sql](01_home_advantage_by_season.sql) |
| Team home dependence | `HAVING`, `AVG` | [02_team_home_dependence.sql](02_team_home_dependence.sql) |
| Home rank vs final position | `RANK()` window function | [03_home_rank_vs_final_position.sql](03_home_rank_vs_final_position.sql) |
| COVID impact on away goals | CTE, `CASE` statement | [04_covid_away_goals.sql](04_covid_away_goals.sql) |
| Fan return bounce back | Subqueries, `JOIN` | [05_fan_return_bounce_back.sql](05_fan_return_bounce_back.sql) |
| Rolling average trend | CTE + window function | [06_rolling_average_trend.sql](06_rolling_average_trend.sql) |

## Data

The dataset contains home and away performance splits for all 20 Premier League teams across 8 seasons (160 rows total). Key fields include wins, draws, losses, goals scored, and goals conceded — broken out by home and away.

**Source:** Football-Data.co.uk, premierleague.com official records

**File:** [epl_team_seasons.csv](epl_team_seasons.csv)

| Column | Description |
|--------|-------------|
| season | Premier League season (e.g., 2023-24) |
| team | Club name |
| home_played | Home matches played (always 19) |
| home_wins | Home wins |
| home_draws | Home draws |
| home_losses | Home losses |
| home_goals_for | Goals scored at home |
| home_goals_against | Goals conceded at home |
| away_played | Away matches played (always 19) |
| away_wins | Away wins |
| away_draws | Away draws |
| away_losses | Away losses |
| away_goals_for | Goals scored away |
| away_goals_against | Goals conceded away |
| total_points | Final season points total |
| final_position | Final league position |

## Tools Used

- **Google BigQuery** (Sandbox) — SQL querying and analysis
- **Premier League / Football-Data.co.uk** — Data source

## Screenshots

### Query 1: Home Advantage by Season
![Home Advantage by Season](Q1%20Premier%20League%20Stats%20by%20Season.png)

### Query 2: Team Home Dependence
![Team Home Dependence](Q2%20Team%20Home%20Dependence%20Sheet.png)

### Query 3: Home Rank vs Final Position
![Home Rank vs Final Position](Q3%20Home%20Rank%20vs%20Final%20Position.png)

### Query 4: COVID Impact on Away Goals
![COVID Away Goals](Q4%20Covid%20Away%20Goals.png)

### Query 5: Post-COVID Home Wins Improvement
![Fan Return Bounce Back](Q5%20Post%20Covid%20Home%20Wins%20Improvement%20by%20Team.png)

### Query 6: Rolling Average Trend
![Rolling Average Trend](Q6%20Rolling%20Average%20Trend.png)

## About

Built by Mahir Abdullah as part of a Business Analytics & AI portfolio. This project demonstrates SQL proficiency across aggregation, window functions, CTEs, subqueries, and joins — applied to a real-world dataset to answer a genuine analytical question.

## Context: Why This Matters

Home advantage is one of the most studied phenomena in sports analytics. Understanding its drivers has real implications for:
- **Club operations** — scheduling, ticket pricing, stadium investment decisions
- **Betting markets** — home advantage is baked into odds calculations
- **Sports broadcasting** — narrative building around home/away form
- **Team management** — tactical preparation differs for home vs away matches

The COVID-19 pandemic created a natural experiment: what happens when you remove fans entirely? This analysis quantifies that impact using 8 seasons of Premier League data.
