# cloudfront_report_queries

Collection of Cloudfront access log Presto queries to get similar result as the reporting tool in the console

# Why

Context:

https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/reports.html

Cloudfront reports (Popular Objects, Cache Statistics) are not offered via API currently and has to be queried from S3 bucket containing Cloudfront access log.

Access log can be enabled following this step:

https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html

Athena table and query can be setup following this step:

https://docs.aws.amazon.com/athena/latest/ug/cloudfront-logs.html

However, it can be difficult for beginners in SQL/Presto to get the same result as the reporting UI. This repository contains a collection of SQL queries that I use in order to produce similar result.

*Note*: these queries have not been tested in the advanced partitioned setup:

https://aws.amazon.com/blogs/big-data/analyze-your-amazon-cloudfront-access-logs-at-scale/


# List

- PopularObjects01.sql : Get popular objects except CSS and ICO files, for a particular day

- TotalRequests01.sql : Get daily total requests for objects except CSS and ICO files, between two given dates

- PercentageViewerByResultType.sql : Get percentage of result type (Hit, Miss, Error) except CSS and ICO files, between two given dates

- SampleGroupHourly : An example of how to group by hour - maybe not the fastest way but it seems to work