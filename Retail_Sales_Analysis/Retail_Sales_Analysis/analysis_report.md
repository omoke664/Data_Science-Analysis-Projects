# Retail & Warehouse Sales Analysis Report

---

## ⚠️ Data Completeness Disclaimer

**Important:**
- The dataset does **not** contain a full 12 months of data for any year.
- Example: 2018 has only January and February; 2020 has only January, March, July, and September; 2017 and 2019 are also missing months.
- **Yearly totals and trends are based on partial-year data.** Apparent drops or spikes may reflect missing months, not actual business performance.
- All analyses, visualizations, and forecasts should be interpreted with this limitation in mind.

---

## 1. Overall Sales Performance (2017–2020)

### Total Sales by Year *(Partial-Year Data)*

| Year | Total Sales      |
|------|-----------------|
| 2017 | $3,703,850.20   |
| 2018 | $826,997.01     |
| 2019 | $5,470,951.54   |
| 2020 | $2,087,391.63   |

### Year-over-Year (YoY) Growth *(Partial-Year Data)*

| Year | YoY Growth (%)  |
|------|-----------------|
| 2017 |      —          |
| 2018 |   -77.7%        |
| 2019 |  +561.5%        |
| 2020 |   -61.8%        |

#### Key Takeaways
- **Yearly sales figures are not directly comparable** due to missing months in each year.
- Apparent drops (e.g., 2018) or spikes (e.g., 2019) may be due to incomplete data, not actual business changes.
- **Interpret all annual trends with caution.**

#### Business Implications
- The business experienced extreme volatility in reported sales, but this is likely driven by data coverage gaps rather than true performance swings.
- Further diagnostic analysis and forecasting should focus on monthly or quarterly trends, not annual totals.

---

## 2. Channel & Product Performance

### Channel Breakdown

| Channel           | Total Sales     | Contribution (%) |
|-------------------|----------------|-----------------|
| Retail Sales      | $2,153,459.39  | 17.8%           |
| Retail Transfers  | $2,133,329.71  | 17.6%           |
| Warehouse Sales   | $7,802,401.28  | 64.5%           |

- **Warehouse sales** are the dominant channel, accounting for nearly two-thirds of total sales.
- **Retail sales** and **retail transfers** each contribute about 18%.
- **Note:** These figures are also based on partial-year data and should not be interpreted as full-year performance.

### Top 10 Products by Total Sales

| Rank | Product Description                  | Total Sales   |
|------|--------------------------------------|--------------|
| 1    | CORONA EXTRA LOOSE NR - 12OZ         | $352,574.83  |
| 2    | CORONA EXTRA 2/12 NR - 12OZ          | $266,992.08  |
| 3    | HEINEKEN LOOSE NR - 12OZ             | $206,675.17  |
| 4    | HEINEKEN 2/12 NR - 12OZ              | $169,564.90  |
| 5    | MILLER LITE 30PK CAN - 12OZ          | $162,971.40  |
| 6    | CORONA EXTRA 4/6 NR - 12OZ           | $140,151.32  |
| 7    | MODELO ESPECIAL 24 LOOSE NR - 12OZ   | $126,634.80  |
| 8    | BUD LIGHT 30PK CAN                   | $120,735.97  |
| 9    | HEINEKEN 4/6 NR - 12OZ               | $110,962.92  |
| 10   | CORONA EXTRA 18PK NR - 12OZ          | $100,913.44  |

### Top 10 Suppliers by Total Sales

| Rank | Supplier                    | Total Sales   |
|------|-----------------------------|--------------|
| 1    | CROWN IMPORTS               | $1,819,141.93|
| 2    | MILLER BREWING COMPANY      | $1,597,808.94| 
| 3    | ANHEUSER BUSCH INC          | $1,549,362.68|
| 4    | HEINEKEN USA                | $940,796.79  |
| 5    | E & J GALLO WINERY          | $528,656.13  |
| 6    | DIAGEO NORTH AMERICA INC    | $459,921.54  |
| 7    | CONSTELLATION BRANDS        | $380,826.10  |
| 8    | BOSTON BEER CORPORATION     | $271,825.23  |
| 9    | THE WINE GROUP              | $200,316.64  |
| 10   | JIM BEAM BRANDS CO          | $199,336.22  |

#### Key Takeaways
- **Warehouse sales** are the primary revenue driver, suggesting a strong B2B or bulk sales focus.
- The top products are dominated by major beer brands, especially Corona and Heineken.
- The top suppliers are large, well-known beverage companies, with CROWN IMPORTS leading by a significant margin.
- Retail channels, while smaller, still represent a substantial portion of total sales and should not be overlooked in channel strategy.
- **Note:** All product and supplier rankings are based on partial-year data.

---

## 3. Monthly Seasonality & Product Category Trends

### Monthly Sales by Product Type

| Month | BEER      | DUNNAGE   | KEGS     | LIQUOR    | NON-ALCOHOL | REF    | STR_SUPPLIES | WINE      |
|-------|-----------|-----------|----------|-----------|-------------|--------|--------------|-----------|
| 1     | 785,317.02| -15,956.0 | 14,838.0 | 182,088.92| 8,603.46    | 120.43 | 1,030.26     | 297,734.79|
| 2     | 488,747.50| -9,121.0  | 9,156.0  | 122,068.00| 5,290.89    | 92.87  | 926.01       | 206,732.31|
| 3     | 608,271.04| -7,974.0  | 8,210.0  | 156,641.06| 7,407.91    | 55.03  | 882.48       | 232,846.95|
| 4     | 288,673.04| -5,522.0  | 5,217.0  | 64,694.11 | 3,044.39    | 38.62  | 384.85       | 106,707.48|
| 5     | 374,398.25| -5,529.0  | 5,860.0  | 72,474.61 | 3,728.14    | 45.40  | 458.85       | 115,365.87|
| 6     | 731,335.62| -11,599.0 | 11,594.0 | 142,665.71| 7,503.52    | 114.23 | 1,061.74     | 211,812.72|
| 7     |1,122,069.36| -13,674.0 | 12,679.0 | 215,016.60|12,368.44    | 145.74 | 1,666.39     | 308,749.43|
| 8     | 736,547.34| -11,059.0 | 11,430.0 | 138,903.15| 7,284.47    | 67.49  | 956.48       | 212,336.34|
| 9     | 974,105.96| -13,284.0 | 12,966.0 | 199,725.68| 9,067.43    | 105.16 | 1,392.92     | 305,494.75|
|10     | 634,002.83| -12,247.0 | 11,172.0 | 144,090.70| 5,995.45    | 81.73  | 900.91       | 229,663.47|
|11     | 620,398.09| -10,458.0 | 10,474.0 | 155,762.91| 6,281.57    |115.64  | 1,424.03     | 256,403.62|
|12     | 304,304.99| -4,884.0  | 4,834.0  | 98,201.96 | 3,390.61    | 70.21  | 1,357.64     | 154,253.81|

#### Key Takeaways
- **Beer** sales show strong peaks in July and September, suggesting summer seasonality.
- **Wine** sales are highest in January, July, September, and November–December, indicating possible holiday and summer demand.
- **Liquor** sales are highest in July and January, with a secondary peak in September and November.
- **Dunnage** (negative values) may represent returns or adjustments and should be investigated further.
- **Non-alcohol** and other categories are much smaller contributors but show minor peaks in summer and winter months.
- **Note:** Monthly trends may also be affected by missing months in some years.

#### Business Implications
- There are clear seasonal patterns, especially for beer and wine, which can inform inventory and marketing strategies.
- Planning for increased demand in summer and holiday months can help optimize stock and promotions.
- Investigate negative dunnage values to ensure data quality and understand their business meaning.

---

## 4. Diagnostic Analysis: Root-Cause Investigations

### Top Products and Suppliers by Year *(Partial-Year Data)*

**2017**
- Top Products: CORONA EXTRA LOOSE NR - 12OZ ($102,777.91), CORONA EXTRA 2/12 NR - 12OZ ($80,124.67), HEINEKEN LOOSE NR - 12OZ ($62,900.12), CORONA EXTRA 4/6 NR - 12OZ ($55,081.16), MILLER LITE 30PK CAN - 12OZ ($51,518.97)
- Top Suppliers: CROWN IMPORTS ($525,283.96), MILLER BREWING COMPANY ($516,172.18), ANHEUSER BUSCH INC ($470,500.23), HEINEKEN USA ($290,688.01), E & J GALLO WINERY ($170,546.86)

**2018**
- Top Products: CORONA EXTRA LOOSE NR - 12OZ ($21,459.63), CORONA EXTRA 2/12 NR - 12OZ ($17,681.50), HEINEKEN LOOSE NR - 12OZ ($14,296.67), MILLER LITE 30PK CAN - 12OZ ($11,091.56), CORONA EXTRA 4/6 NR - 12OZ ($9,857.21)
- Top Suppliers: MILLER BREWING COMPANY ($114,209.49), CROWN IMPORTS ($106,155.10), ANHEUSER BUSCH INC ($97,579.18), HEINEKEN USA ($61,558.13), E & J GALLO WINERY ($37,779.49)

**2019**
- Top Products: CORONA EXTRA LOOSE NR - 12OZ ($166,318.79), CORONA EXTRA 2/12 NR - 12OZ ($124,787.87), HEINEKEN LOOSE NR - 12OZ ($95,100.62), HEINEKEN 2/12 NR - 12OZ ($80,642.29), MILLER LITE 30PK CAN - 12OZ ($71,516.47)
- Top Suppliers: CROWN IMPORTS ($864,524.94), MILLER BREWING COMPANY ($712,063.68), ANHEUSER BUSCH INC ($707,480.17), HEINEKEN USA ($425,893.39), E & J GALLO WINERY ($235,307.30)

**2020**
- Top Products: CORONA EXTRA LOOSE NR - 12OZ ($62,018.50), CORONA EXTRA 2/12 NR - 12OZ ($44,398.04), HEINEKEN LOOSE NR - 12OZ ($34,377.76), HEINEKEN 2/12 NR - 12OZ ($30,696.63), MILLER LITE 30PK CAN - 12OZ ($28,844.40)
- Top Suppliers: CROWN IMPORTS ($323,177.93), ANHEUSER BUSCH INC ($273,803.10), MILLER BREWING COMPANY ($255,363.59), HEINEKEN USA ($162,657.26), E & J GALLO WINERY ($85,022.48)

### Channel Share (%) for Top 10 Products

| Product Description                  | Retail Sales (%) | Retail Transfers (%) | Warehouse Sales (%) |
|--------------------------------------|------------------|---------------------|---------------------|
| BUD LIGHT 30PK CAN                   | 10.2             | 10.0                | 79.8                |
| CORONA EXTRA 18PK NR - 12OZ          | 0.4              | 0.2                 | 99.4                |
| CORONA EXTRA 2/12 NR - 12OZ          | 3.7              | 3.5                 | 92.9                |
| CORONA EXTRA 4/6 NR - 12OZ           | 5.4              | 5.3                 | 89.3                |
| CORONA EXTRA LOOSE NR - 12OZ         | 7.1              | 6.9                 | 86.0                |
| HEINEKEN 2/12 NR - 12OZ              | 4.5              | 4.3                 | 91.2                |
| HEINEKEN 4/6 NR - 12OZ               | 5.2              | 5.2                 | 89.6                |
| HEINEKEN LOOSE NR - 12OZ             | 8.6              | 8.2                 | 83.2                |
| MILLER LITE 30PK CAN - 12OZ          | 8.9              | 8.6                 | 82.5                |
| MODELO ESPECIAL 24 LOOSE NR - 12OZ   | 3.8              | 3.8                 | 92.4                |

#### Key Takeaways
- The 2018 sales drop and 2019 spike affected all top products and suppliers, with sales for each dropping sharply in 2018 and rebounding in 2019.
- The same core products and suppliers dominate each year, but their sales volumes fluctuate dramatically with overall trends.
- For the top 10 products, the vast majority of sales (80–99%) occur through the warehouse channel, confirming the importance of B2B/bulk sales.
- Retail and retail transfer channels are much smaller for these products, but still represent a non-trivial share for some items (e.g., BUD LIGHT 30PK CAN).
- **Note:** All year-to-year comparisons are affected by missing months.

#### Business Implications
- The volatility in sales is not due to a shift in product or supplier mix, but rather a broad-based change affecting all major products and suppliers.
- The dominance of warehouse sales for top products suggests that strategies to stabilize or grow this channel could have the greatest impact on overall performance.
- Further investigation into external factors (e.g., market disruptions, supply chain issues) is warranted to explain the 2018 and 2020 declines.
- **Note:** All diagnostic findings are based on partial-year data. 