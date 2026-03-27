SELECT 
    toDate(time) AS date,
    count(DISTINCT user_id) AS dau
FROM simulator_20260220.feed_actions
WHERE time >= '2026-02-01'
  AND time < '2026-03-27'
GROUP BY date
ORDER BY date