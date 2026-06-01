# SQL Nested Fields | BigQuery

## About
Two SQL queries practicing nested fields and UNNEST function 
in BigQuery. Both analyze event-level data segmented by 
device and geography.

## Tools
SQL, Google BigQuery, CTEs, UNNEST, CASE WHEN

## Dataset
`data-analytics-mate.DA`

## Queries

### Session Engagement by Device
Calculates the share of engaged sessions (`session_engaged = 1`)
among all non-null values, segmented by device type.
→ [session_engagement_by_device.sql](queries/session_engagement_by_device.sql)

### YouTube Events by Continent
Calculates the percentage of `page_title` events containing
"YouTube" among all recorded events, segmented by continent.
→ [youtube_events_by_continent.sql](queries/youtube_events_by_continent.sql)
