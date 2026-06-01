-- Session Engagement Rate by Device
-- Dataset: data-analytics-mate.DA
-- Description: Calculates the share of engaged sessions (session_engaged = 1)
--              among all sessions with a non-null value, segmented by device type.

WITH session_info AS (

  -- Step 1: Extract session_engaged value from nested event_params field
  SELECT
    ga_session_id,
    params.value.string_value AS sessions_engaged
  FROM `data-analytics-mate.DA.event_params`,
  UNNEST(event_params) AS params
  WHERE params.key = 'session_engaged'

)

-- Step 2: Calculate engagement rate per device type
SELECT
  device,
  COUNT(CASE WHEN session_info.sessions_engaged = '1' THEN 1 END) /
  COUNT(session_info.sessions_engaged) * 100 AS session_engaged_percent
FROM session_info
JOIN data-analytics-mate.DA.session_params AS sp
  ON session_info.ga_session_id = sp.ga_session_id
GROUP BY device
