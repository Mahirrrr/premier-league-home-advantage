# Premier League Home Advantage Analysis ⚽

**Do fans actually make a difference? Does playing at Old Trafford or Anfield still mean something or is home advantage dying?**

As a United fan, I feel that Old Trafford isn't the fortress it used to be. So I wanted to see for myself out if home advantage is a real thing in the Premier League, or has it been fading? I used SQL in Google BigQuery to dig through 8 seasons of data (2017-18 through 2024-25) and see what the numbers actually say specifically around COVID when stadiums were completely empty.

## What I Found

**1. Home advantage has dropped — and hasn't come back.**

Home win rates fell from ~46% to ~42% during COVID when fans were banned. Even after fans returned, it hasn't recovered to pre-COVID levels.

**2. Empty stadiums = more away goals.**

The home goal advantage shrank during COVID seasons. Without 50,000 hostile fans screaming at you, away teams were clearly less intimidated. 

**3. Man City don't need fans. Mid-table teams do.**

City's home vs away gap is just 0.3 wins and so basically they dominate everywhere. Meanwhile clubs like Burnley (gap of 3.0) and Newcastle rely heavily on their home crowd. Elite squads are elite regardless of venue.

**4. Best home team = league champion (almost every time).**

In nearly every season I looked at, the team with the most home wins either won the league or finished runner-up. Building a fortress at home still wins titles.

**5. Some teams genuinely need their fans.**

After COVID, some clubs saw a huge improvement at home when supporters came back. Others actually got worse which suggests it's about squad quality, not just atmosphere.

**6. MY TEAM**

Man United's home advantage gap is 2.1 wins which is mid-range, not elite. In 2024-25, United won just 6 HOME GAMES and finished SIXTEENTH.... Compare that to Liverpool who won 15 at home and walked the league. Old Trafford used to be a place teams feared. The data says that's not really the case anymore unfortunately. (But hey Carrick Ball is still unbeaten at home as of March 16th, 2025)

## SQL Concepts Used

| Query | What It Does | Concept | File |
|-------|-------------|---------|------|
| Q1 | Home vs away win % over time | `GROUP BY`, aggregation | [01_home_advantage_by_season.sql](01_home_advantage_by_season.sql) |
| Q2 | Which teams depend on home crowd most | `HAVING`, `AVG` | [02_team_home_dependence.sql](02_team_home_dependence.sql) |
| Q3 | Does best home team win the league? | `RANK()` window function | [03_home_rank_vs_final_position.sql](03_home_rank_vs_final_position.sql) |
| Q4 | Did away teams score more without fans? | CTE, `CASE` | [04_covid_away_goals.sql](04_covid_away_goals.sql) |
| Q5 | Which teams bounced back with fans | Subqueries, `JOIN` | [05_fan_return_bounce_back.sql](05_fan_return_bounce_back.sql) |
| Q6 | Long-term trend smoothed out | CTE + window function | [06_rolling_average_trend.sql](06_rolling_average_trend.sql) |

## The Data

160 rows covering all 20 Premier League teams across 8 seasons ~ home and away splits for wins, draws, losses, goals scored, and goals conceded.

**Source:** [Football-Data.co.uk](https://football-data.co.uk/), [premierleague.com](https://www.premierleague.com/en)

**File:** [epl_team_seasons.csv](epl_team_seasons.csv)

| Column | What It Is |
|--------|-----------|
| season | e.g., 2023-24 |
| team | Club name |
| home_played | Home matches (always 19) |
| home_wins / home_draws / home_losses | Home results |
| home_goals_for / home_goals_against | Home goals |
| away_played | Away matches (always 19) |
| away_wins / away_draws / away_losses | Away results |
| away_goals_for / away_goals_against | Away goals |
| total_points | Season points total |
| final_position | Where they finished |

## Tools

- **Google BigQuery** (Sandbox, free) — SQL querying
- **Premier League / Football-Data.co.uk** — Data source

## Screenshots

### Query 1: Home Win % vs Away Win % by Season
![Home vs Away Win Percentage](screenshots/Q1%20Home%20vs%20Away%20Win%20Percentage.png)

🟢 Green = Home Win % | 🔵 Blue = Away Win %

*Home advantage has steadily declined since 2018-19, with away win rates rising to close the gap*

### Query 2: Which Teams Rely on Home Advantage Most?
![Team Home Dependence](screenshots/Q2%20Team%20Home%20Dependence%20Sheet.png)

*Columns: Team | Seasons | Avg Home Wins | Avg Away Wins | Home Advantage Gap | Avg Home Goals | Avg Away Goals*

*Man City's gap is just 0.3, while Burnley's is 3.0*

### Query 3: Home Rank vs Final League Position
![Home Rank vs Final Position](screenshots/Q3%20Home%20Rank%20vs%20Final%20Position.png)

*Columns: Season | Team | Home Wins | Home Goals | Home Rank | Final Position*

*The #1 home team almost always finishes as champion*

### Query 4: COVID Impact on Home Goal Advantage
![Home Goal Advantage](screenshots/Q4%20Home%20Goal%20Advantage%20by%20Season.png)

🔵 Blue = Home goal advantage (home goals minus away goals)

*The advantage shrinks from 2019-20 onward when fans were removed, going negative in 2022-23 and 2023-24*

### Query 5: Which Teams Bounced Back When Fans Returned?
![Fan Return Bounce Back](screenshots/Q5%20Post%20Covid%20Home%20Wins%20Improvement%20by%20Team.png)

🔵 Blue = COVID home wins | 🟣 Purple = Post-COVID home wins | 🟢 Green = Improvement

*Positive green bars mean the team was better with fans back, negative means worse*

### Query 6: Long-Term Trend with Rolling Average
![Rolling Average Trend](screenshots/Q6%20Home%20Win%20Pct%20and%20Rolling%20Average.png)

🟢 Green = Home Win % | 🔵 Blue = Rolling Average

*The smoothed trend shows a clear long-term decline in home advantage across the Premier League*

## Why This Matters

Home advantage is one of the most talked about things in football. Whether it's pundits saying "they're a different team at home" or fans arguing that the 12th man makes the difference I wanted to see if the data backs it up.

COVID gave us the perfect experiment: what happens when you take the fans away completely? Turns out they matter more than most people think but maybe not as much as having a good squad.

## About

Built by Mahir Abdullah 
