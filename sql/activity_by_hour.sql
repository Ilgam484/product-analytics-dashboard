SELECT 
    toStartOfInterval(time, INTERVAL 10 minute) AS ts,
    count(*) AS events
FROM simulator_20260220.feed_actions
WHERE time >= '2026-03-27 00:00:00'
  AND time < '2026-03-28 00:00:00'
GROUP BY ts
ORDER BY ts