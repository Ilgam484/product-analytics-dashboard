WITH first_visits AS (
    SELECT
        user_id,
        min(toDate(time)) AS start_date
    FROM simulator_20260220.feed_actions
    WHERE source = 'ads'
    GROUP BY user_id
    HAVING start_date >= today() - 20
),
user_activity AS (
    SELECT DISTINCT
        user_id,
        toDate(time) AS activity_date
    FROM simulator_20260220.feed_actions
)

SELECT
    fv.start_date,
    dateDiff('day', fv.start_date, ua.activity_date) AS retention_day,
    count(DISTINCT fv.user_id) AS users
FROM first_visits fv
JOIN user_activity ua USING (user_id)
WHERE ua.activity_date >= fv.start_date
GROUP BY
    fv.start_date,
    retention_day
ORDER BY
    fv.start_date,
    retention_day