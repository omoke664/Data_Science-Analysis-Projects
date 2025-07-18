# Retail & Warehouse Sales Data Analysis Plan (Revised)

This plan follows the structured framework and question list from `Analysis Questions.txt` to guide the analysis of `Warehouse_and_Retail_Sales.csv`.

---

## 1. Business Problem & Project Goal

**Business Problem:**
A beverage distributor seeks to understand the key drivers of sales across retail, warehouse, and transfer channels to optimize revenue, inventory, and supplier relationships.

**Project Goal:**
Analyze 2017-2020 sales data to identify trends, insights, and opportunities, culminating in actionable recommendations.

**Core Business Questions & KPIs:**
| Business Question                | KPI Examples                                 |
|----------------------------------|----------------------------------------------|
| Revenue optimization             | Total Sales, YoY Growth, Channel Share       |
| Channel strategy                 | Sales by Channel, Channel Growth Rate        |
| Supplier management              | Sales by Supplier, Supplier Churn            |
| Inventory efficiency             | Inventory Turnover, Stockout Rate            |
| 2020 disruption analysis         | 2020 vs. 2019 Sales Change, Channel Shifts   |

---

## 2. Descriptive Analysis – What Happened?

**A. Overall Sales Performance**
- Efficiently load and preview the data (use `chunksize` for large files)
- Identify column names and data types
- Engineer `TOTAL SALES` per transaction
- Calculate total sales per year (2017–2020)
- Visualize and interpret sales trends (line chart, YoY growth)

**B. Channel & Product Performance**
- Calculate and visualize sales by channel (bar/pie chart)
- Identify top 10 products and suppliers by total sales

---

## 3. Diagnostic Analysis – Why Did It Happen?

- Investigate causes of sales drops/increases (e.g., 2018 drop, 2019 spike)
- Analyze monthly and seasonal sales patterns (overall and by product type)
- Examine channel-specific product behavior (e.g., top products by channel)
- Provide narrative explanations for each finding

---

## 4. Predictive & Prescriptive Analysis – What Will Happen & What Should We Do?

**A. Sales Forecasting (Predictive)**
- Forecast sales for the next year/quarter (by channel, item type, supplier)
- Visualize forecasts with uncertainty bands
- Comment on model choice and performance

**B. Strategic Recommendations (Prescriptive)**
- Channel strategy: Which channels to prioritize for which products?
- Supplier management: Which suppliers to grow or monitor?
- Inventory/product strategy: What to stock and when?
- Package insights as dashboards, scorecards, and alerts

---

## 5. Implementation Roadmap

**Phase 1: Foundation (Descriptive)**
- Build executive dashboard with key metrics
- Establish baseline benchmarks

**Phase 2: Insights (Diagnostic)**
- Conduct root-cause analysis
- Develop supplier and channel scorecards

**Phase 3: Prediction (Predictive)**
- Build forecasting models
- Develop early warning and scenario planning tools

---

**Next Steps:**
1. Load and preview the dataset.
2. Address each section above in order, using modular code and clear documentation.
3. Summarize key takeaways and next steps at the end of each phase. 