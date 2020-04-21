SELECT date as TheDate, COUNT(request_id) as RequestCount
FROM "default"."cloudfront_logs" t0
WHERE
  date BETWEEN Date '2020-04-19' AND Date '2020-04-25'
  AND SUBSTR(uri, -4) <> '.css'
  AND SUBSTR(uri, -4) <> '.ico'
GROUP BY date
ORDER BY TheDate ASC