SELECT uri, COUNT(request_id) AS TotalRequests,
  (SELECT COUNT(result_type) AS Hits
   FROM "default"."cloudfront_logs" t1
   WHERE t1.uri = t0.uri
   AND t1.result_type = 'Hit'
   ) as Hits,
  (SELECT COUNT(result_type) AS Hits
   FROM "default"."cloudfront_logs" t2
   WHERE t2.uri = t0.uri
   AND t2.result_type = 'Miss'
   ) as Misses,
  (SELECT SUM(bytes) AS BytesFromMisses
   FROM "default"."cloudfront_logs" t3
   WHERE t3.uri = t0.uri
   AND t3.result_type = 'Miss'
   )as BytesFromMisses,
  (SELECT SUM(bytes) AS BytesTotal
   FROM "default"."cloudfront_logs" t4
   WHERE t4.uri = t0.uri
   )as BytesTotal,
  (SELECT COUNT(result_type) AS IncompleteDownloads
   FROM "default"."cloudfront_logs" t5
   WHERE t5.uri = t0.uri
   AND t5.status = 200 AND t5.x_edge_detailed_result_type = 'Error'
   ) as IncompleteDownloads,
  (SELECT COUNT(status) as Status200s
   FROM "default"."cloudfront_logs" t6
   WHERE t6.uri = t0.uri
   AND t6.status BETWEEN 200 and 299
   ) as Status200s
FROM "default"."cloudfront_logs" t0
WHERE
  date=Date '2020-04-20'
  AND SUBSTR(uri, -4) <> '.css'
  AND SUBSTR(uri, -4) <> '.ico'
GROUP BY uri
ORDER BY TotalRequests DESC