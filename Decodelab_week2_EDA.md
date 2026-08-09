# Executive Summary: Retail Orders EDA
**Project 2 — Exploratory Data Analysis | DecodeLabs Data Analytics Internship**

## 1. Problem Statement
The business needed to understand the underlying patterns, trends, and data quality of its retail orders dataset (1,200 orders, 14 fields) before it could be used for dashboarding or predictive modeling. The core question: **What does this data actually tell us about order value, product performance, and revenue behavior — and can it be trusted?**

## 2. Methodology
- **Data profiling:** Checked structure (1,200 rows, 14 columns), data types, and missing values using `df.info()` and `df.isnull().sum()`.
- **Data forensics:** Identified 309 missing CouponCode values (25.75%) and resolved them by explicitly labeling as `"None"` rather than dropping rows — preserving the signal that no coupon was used.
- **Descriptive statistics:** Calculated mean, median, and standard deviation for all numeric fields (Quantity, UnitPrice, ItemsInCart, TotalPrice) using `df.describe()`.
- **Distribution analysis:** Visualized TotalPrice with a histogram and boxplot to assess skew and outliers.
- **Outlier detection:** Applied the IQR method (1.5× IQR rule) to TotalPrice and UnitPrice.
- **Trend analysis:** Reviewed category distributions (Product, PaymentMethod, OrderStatus) and monthly revenue over time.
- **Correlation analysis:** Computed a Pearson correlation matrix and heatmap across all numeric fields.

## 3. Key Findings

**Data Quality**
- CouponCode was the only field with missing values (309 of 1,200 rows) — now resolved.
- No duplicate OrderIDs; no negative or zero values in Quantity or UnitPrice.

**Central Tendency**
- TotalPrice: mean ($1,053.97) is notably higher than median ($823.62) — indicating a right-skewed distribution.
- Quantity, UnitPrice, and ItemsInCart are all fairly symmetric (mean ≈ median).

**Outliers**
- 8 orders identified as statistical outliers in TotalPrice (range: $3,334–$3,456), confirmed visually via boxplot.
- All 8 outliers share **Quantity = 5** (the dataset maximum) and **UnitPrice > $660** — these are legitimate large-basket, high-value orders, not data errors.
- UnitPrice alone showed **zero outliers**, confirming the anomaly is driven by the *combination* of quantity and price, not price alone.

**Trends**
- Product, PaymentMethod, and OrderStatus categories are all evenly distributed — no single category dominates (e.g., Printer 181 orders vs. Phone 156; a spread of just 25 orders across 7 products).
- Monthly revenue fluctuates between ~$29K and ~$53K, with **June 2025 the strongest month** ($53,047).

**Relationships**
- UnitPrice has the strongest correlation with TotalPrice (r = 0.72), followed by Quantity (r = 0.62).
- ItemsInCart shows a weaker relationship with TotalPrice (r = 0.39).
- Quantity and UnitPrice are essentially uncorrelated (r = 0.015) — customers buying more items are not systematically buying pricier ones, suggesting realistic, unbiased purchasing behavior.

## 4. Recommendations
1. **Treat the 8 high-value orders as a VIP/bulk-purchase segment** rather than excluding them — they represent legitimate revenue concentration worth targeting with retention or loyalty offers.
2. **Use median, not mean, when reporting "typical order value"** in dashboards, since the right-skewed distribution makes the mean misleading for day-to-day business reporting.
3. **Investigate the June 2025 revenue peak** to identify what drove it (seasonality, promotion, or campaign) and consider replicating the conditions.
4. **Since UnitPrice drives TotalPrice more than Quantity does**, pricing strategy and premium product promotion may have more revenue impact than encouraging bulk purchases alone.
5. **CouponCode blanks (~26% of orders) represent a large "no discount used" segment** — worth a follow-up analysis on whether coupon usage correlates with order value or customer retention.

---
*Prepared by Shobowale Olushola Samuel — DecodeLabs Data Analytics Internship, Project 2*
