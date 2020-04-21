SELECT date as TheDate, 

  CAST(
   (SELECT COUNT(request_id)
   FROM "default"."cloudfront_logs" t1
   WHERE t1.date = t0.date AND t1.result_type = 'Hit')
   AS DOUBLE)
  /
  CAST(
   (SELECT COUNT(request_id)
   FROM "default"."cloudfront_logs" t1a
   WHERE t1a.date = t0.date)
  AS DOUBLE) AS HitsPercent,

  CAST(
   (SELECT COUNT(request_id)
   FROM "default"."cloudfront_logs" t2
   WHERE t2.date = t0.date AND t2.result_type = 'Miss')
  AS DOUBLE)
  /
  CAST(
   (SELECT COUNT(request_id)
   FROM "default"."cloudfront_logs" t2a
   WHERE t2a.date = t0.date)
  AS DOUBLE) AS MissesPercent,

  CAST(
   (SELECT COUNT(request_id)
   FROM "default"."cloudfront_logs" t3
   WHERE t3.date = t0.date AND t3.result_type = 'Error')
  AS DOUBLE)
  /
  CAST(
   (SELECT COUNT(request_id)
   FROM "default"."cloudfront_logs" t3a
   WHERE t3a.date = t0.date)
  AS DOUBLE) AS ErrorsPercent

FROM "default"."cloudfront_logs" t0
WHERE
  date BETWEEN Date '2020-04-19' AND Date '2020-04-25'
  AND SUBSTR(uri, -4) <> '.css'
  AND SUBSTR(uri, -4) <> '.ico'
GROUP BY date
ORDER BY TheDate ASC