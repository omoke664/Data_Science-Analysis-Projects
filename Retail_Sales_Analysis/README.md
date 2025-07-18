# Retail & Warehouse Sales Analysis

## Project Overview
This project analyzes retail and warehouse sales data for a beverage distributor, aiming to uncover key trends, drivers, and actionable recommendations for revenue optimization, channel strategy, supplier management, and inventory efficiency. The analysis follows a structured, business-driven framework and is fully documented in a modular, reproducible workflow.

## Data Sources
- `Warehouse_and_Retail_Sales.csv`: Main sales dataset (2017–2020, partial months)
- `Analysis Questions.txt`: Structured analysis framework and business questions

## Analysis Phases
1. **Business Problem Definition**
   - Restate/refine business questions and define KPIs
2. **Descriptive Analysis**
   - Data loading, cleaning, feature engineering
   - Sales trends, channel/product/supplier performance
3. **Diagnostic Analysis**
   - Root-cause investigations (e.g., volatility, channel/product/supplier breakdowns)
4. **Predictive Analysis**
   - Time-series forecasting (monthly level)
   - Model commentary and business implications
5. **Implementation Roadmap**
   - Actionable recommendations and packaging (dashboard, scorecards, alerts)

## Data Completeness Disclaimer
> **Important:** The dataset does **not** contain a full 12 months of data for any year. All annual totals and trends are based on partial-year data. Interpret all results, especially year-over-year comparisons, with caution.

## Requirements
- Python 3.8+
- See `requirements.txt` for all dependencies (pandas, numpy, matplotlib, plotly, statsmodels, prophet, jupyter, etc.)

## Usage Instructions
1. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```
2. **Launch Jupyter Notebook:**
   ```bash
   jupyter notebook
   ```
3. **Run the analysis workflow:**
   - Use the provided notebook and `wrangle_sales_data` function for consistent data cleaning.
   - Follow the analysis steps as outlined in the `analysis_report.md`.

## Reporting Structure
- **`analysis_report.md`**: Master report with all findings, tables, charts, and business interpretations, structured by analysis phase.
- All code is modular and annotated for clarity and reproducibility.

## Interpreting Results
- All findings, especially annual trends, should be interpreted in light of the data completeness disclaimer.
- Monthly and product/channel-level trends are more reliable than annual summaries.

## Contact
For questions or collaboration, please contact the project owner. 