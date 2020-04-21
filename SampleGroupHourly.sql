SELECT CAST(date AS varchar) || 'T' || SUBSTR(CAST(time as varchar),1,2) AS DateHour, COUNT(request_id)
FROM "default"."cloudfront_logs"
GROUP BY CAST(date AS varchar) || 'T' || SUBSTR(CAST(time as varchar),1,2)
