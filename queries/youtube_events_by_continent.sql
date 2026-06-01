-- YouTube Events Rate by Continent
-- Dataset: data-analytics-mate.DA
-- Description: Calculates the percentage of page_title events containing
--              "YouTube" among all recorded events, segmented by continent.

WITH session_info AS (

  -- Step 1: Count YouTube-related and total page_title events per session
  SELECT
    ga_session_id,
    COUNT(CASE WHEN ep.value.string_value LIKE '%YouTube%'
               THEN ep.value.string_value END) AS youtube_events_cnt,
    COUNT(ep.value.string_value)               AS total_events_cnt
  FROM `data-analytics-mate.DA.event_params`,
  UNNEST(event_params) AS ep
  WHERE ep.key = 'page_title'
  GROUP BY ga_session_id
)

-- Step 2: Aggregate by continent and calculate YouTube events percentage
SELECT
  sp.continent,
  SUM(si.youtube_events_cnt) / SUM(si.total_events_cnt) * 100 AS youtube_events_percent
FROM session_info AS si
JOIN `DA.session_params` AS sp
  USING (ga_session_id)
GROUP BY sp.continent
