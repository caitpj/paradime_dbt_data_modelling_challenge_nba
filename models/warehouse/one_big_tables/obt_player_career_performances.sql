with
    career_fact_table as (select * from {{ ref('fct_player_career_performances') }}),
    dim_seasons as (select * from {{ ref('dim_seasons') }}),
    dim_teams as (select * from {{ ref('dim_teams') }}),
    dim_players as (select * from {{ ref('dim_players') }})

select
    player_id,
    first_name,
    last_name,
    dim_players.full_name,
    display_last_comma_first,
    display_fi_last,
    player_slug,
    birthdate,
    school,
    country,
    last_affiliation,
    height,
    weight,
    height_inches,
    bmi,
    bmi_category,
    seasons_played,
    jersey,
    position,
    roster_status,
    games_played_current_season_flag,
    playercode,
    first_year_played,
    last_year_played,
    g_league_has_played,
    nba_has_played,
    draft_year,
    draft_round,
    draft_number,
    greatest_75_member,
    nominal_salary_earnings,
    nominal_salary_earnings_rank,
    inflation_adjusted_salary_earnings,
    inflation_adjusted_salary_earnings_rank,
    most_common_team_id,
    most_common.full_name as most_common_team_full_name,
    most_common.team_name_abbreviation as most_common_team_name_abbreviation,
    most_common.nickname as most_common_team_nickname,
    most_common.city as most_common_team_city,
    most_common.state as most_common_team_state,
    most_common.year_founded as most_common_team_year_founded,
    most_recent_team_id,
    most_recent.full_name as most_recent_team_full_name,
    most_recent.team_name_abbreviation as most_recent_team_name_abbreviation,
    most_recent.nickname as most_recent_team_nickname,
    most_recent.city as most_recent_team_city,
    most_recent.state as most_recent_team_state,
    most_recent.year_founded as most_recent_team_year_founded,
    games_played,
    win_probability,
    avg_mins_played,
    avg_field_goals_made,
    avg_field_goals_attempted,
    avg_field_goal_pct,
    avg_three_point_made,
    avg_three_point_attempted,
    avg_three_point_pct,
    avg_free_throws_made,
    avg_free_throws_attempted,
    avg_free_throw_pct,
    avg_offensive_rebounds,
    avg_defensive_rebounds,
    avg_total_rebounds,
    avg_assists,
    avg_turnovers,
    avg_steals,
    avg_blocks,
    avg_personal_fouls,
    avg_points,
    avg_plus_minus
from career_fact_table
inner join dim_players using (player_id)
inner join
    dim_teams most_common on career_fact_table.most_common_team_id = most_common.team_id
inner join
    dim_teams most_recent on career_fact_table.most_recent_team_id = most_recent.team_id