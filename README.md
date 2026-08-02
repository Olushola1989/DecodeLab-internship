# DecodeLab-internship

# Retail Orders Dataset — Data Cleaning Project

## Overview
This project involved cleaning a raw retail orders dataset (1,201 rows, 14 columns) using two approaches for comparison and skill-building: **Microsoft Excel** (manual/formula-based cleaning) and **Power BI (Power Query)** (repeatable, step-based cleaning). The same raw dataset was cleaned independently in both tools to demonstrate the workflow and outcome in each.

## Dataset
- **Rows:** 1,201
- **Columns:** 14 — OrderID, Date, CustomerID, Product, Quantity, UnitPrice, ShippingAddress, PaymentMethod, OrderStatus, TrackingNumber, ItemsInCart, CouponCode, ReferralSource, TotalPrice
- **Source:** Raw sales/orders data (dirty)

## Tools Used
- Microsoft Excel (filters, conditional formatting, COUNTIF, COUNTBLANK, Tables)
- Power BI Desktop — Power Query Editor (Column Quality/Distribution view, Replace Values, Data Type conversion, Group By)

## Cleaning Steps Performed

1. **Initial data profiling**
   - Checked row/column counts
   - Identified blank/missing values per column

2. **Duplicate check**
   - Verified OrderID uniqueness (COUNTIF in Excel; Column Quality distinct/unique counts in Power Query)
   - Result: **No duplicate OrderIDs found** (1,000 distinct = 1,000 unique)

3. **Data type correction**
   - Confirmed numeric columns (Quantity, UnitPrice) were already stored as numbers
   - Converted **Date** column from Int64 (serial number) to proper Date format in Power Query

4. **Missing value handling**
   - **OrderStatus:** 1 blank identified — investigated for context clues; no true blank found on recheck
   - **CouponCode:** 309 blanks (~26%) — replaced with `"None"` to explicitly indicate no coupon was applied, rather than treating as missing/error data

5. **Numeric sanity checks**
   - Sorted Quantity and UnitPrice ascending to check for negative or zero values
   - Result: **No negative or zero values found**

6. **Date range validation**
   - Sorted Date ascending/descending to confirm realistic range
   - Result: **1/1/2023 – 6/30/2025**, no invalid or out-of-range dates

7. **Categorical consistency check**
   - Reviewed unique values in PaymentMethod, OrderStatus, ReferralSource, CouponCode, and Product for typos, inconsistent casing, or near-duplicate categories
   - Result: **All categorical columns consistent**, no fixes required

## Outcome
The cleaned dataset is free of duplicates, missing values (except intentionally labeled "None" coupon codes), invalid numeric entries, and inconsistent categorical text — ready for downstream analysis and dashboarding in Power BI.

## Files in This Repository
- `dataset_raw.xlsx` — original uncleaned dataset
- `dataset_cleaned.xlsx` — cleaned dataset (Excel)
- Power BI file (`.pbix`) with Power Query cleaning steps applied

## Author
Shobowale Olushola Samuel
DecodeLab Data Analytics Project
[LinkedIn](https://linkedin.com/in/olushola-shobowale-9a1456110)
