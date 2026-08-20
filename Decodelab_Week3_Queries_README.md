Executive Summary: Retail Orders SQL Analysis
Project 3 — SQL Data Analysis | DecodeLabs Data Analytics Internship
1. Problem Statement
Building on the cleaned retail orders dataset from Project 2, the business needed answers extracted directly from a relational database — filtering, grouping, and aggregating 1,200 orders to identify which products drive the most revenue and where performance varies. The core question: which products should the business prioritize, and how do order volume and order value each contribute to that decision?
2. Methodology
Environment: imported the cleaned dataset (CSV export) into MySQL Workbench as a table named orders.
Validation: confirmed successful import via SELECT COUNT(*) (1,200 rows) and SHOW TABLES.
Filtering: used WHERE to isolate single-category subsets (e.g., all Chair orders).
Sorting: used ORDER BY to rank filtered and grouped results (e.g., highest-value orders first).
Grouping: used GROUP BY to bucket all 1,200 orders into their 7 product categories.
Aggregation: applied COUNT(), SUM(), and AVG() to calculate order volume, total revenue, and average order value per product.
Post-aggregation filtering: used HAVING to isolate only product categories exceeding a $180,000 revenue threshold — a filter that cannot be expressed with WHERE since it depends on an aggregated value.
3. Key Findings
Data Validation
Table imported successfully with all 1,200 rows and 14 columns intact.
Category Filtering (WHERE + ORDER BY)
Isolating Chair orders and sorting by TotalPrice confirmed the highest single Chair order was $3,384.90 (5 units at $676.98/unit) — consistent with the outlier pattern identified in Project 2's Python/pandas analysis.
Revenue by Product (GROUP BY + Aggregations)
Product
Total Orders
Total Revenue
Avg Order Value

Chair
178
$195,620.11
$1,098.99

Printer
181
$195,612.61
$1,080.73

Laptop
173
$192,126.56
$1,110.56

Tablet
179
$186,568.95
$1,042.28

Monitor
163
$175,651.41
$1,077.62

Desk
170
$167,459.93
$985.06

Phone
156
$151,722.39
$972.58


Chair generates the most total revenue ($195,620.11), narrowly ahead of Printer, despite having 3 fewer orders — driven by a higher average order value.
Laptop has the highest average order value ($1,110.56) of any product, even though it isn't the top revenue earner — a sign of strong per-order value that could be leveraged.
Phone has both the lowest order count and lowest revenue, making it the weakest-performing category.
High-Performing Segment (HAVING)
Filtering for products with total revenue above $180,000 narrows the list to 4 top performers: Chair, Printer, Laptop, and Tablet — together representing the core of the business's revenue.
4. Recommendations
Prioritize Chair, Printer, Laptop, and Tablet in marketing and inventory planning — these 4 products (of 7 total) generate the strongest revenue and clear the $180K threshold.
Investigate Laptop's premium positioning — its high average order value relative to order count suggests customers are willing to pay more per Laptop order; consider whether this reflects bundling, upselling, or higher unit prices worth replicating elsewhere.
Reassess Phone's strategy — as the lowest performer on both volume and revenue, determine whether this reflects pricing, demand, or a genuine underperformance worth addressing.
Chair vs. Printer is a near-tie in revenue ($195,620 vs. $195,613) — a small increase in either product's average order value or order count could shift category leadership; worth monitoring month over month.

Prepared by Shobowale Olushola Samuel — DecodeLabs Data Analytics Internship, Project 3
