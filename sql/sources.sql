SELECT 
    toDate(time) AS date,
    source,
    count(DISTINCT user_id) AS dau
FROM simulator_20260220.feed_actions
WHERE time >= '2026-02-01'
  AND time < '2026-03-27'
GROUP BY date, source
ORDER BY date, source