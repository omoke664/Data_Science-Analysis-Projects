SELECT * FROM sales 
LIMIT 5;


-- sales performance

SELECT
	SUM(quantity * price) AS total_sales,
	SUM(quantity) AS total_quantity,
	COUNT(sale_reference) AS total_transactions,
	ROUND(SUM(quantity * price)/ COUNT(sale_reference),2) AS average_basket_value
FROM sales
JOIN products ON sales.product_id = products.product_id;
,
/*
Total Revenue: 15,749,301.65
Total Quantity: 60,077
Total Transactions: 20,000
Average Basket Value: 787.47
*/

-- Revenue over time
-- Over the years
SELECT
	EXTRACT(YEAR FROM sale_date) AS years,
	SUM(price * quantity) AS revenue,
	LAG(SUM(price * quantity)) OVER(
		ORDER BY EXTRACT(YEAR FROM sale_date)
	) AS previous_year_revenue,
	ROUND((SUM(price * quantity) - LAG(SUM(price * quantity)) OVER(
		ORDER BY EXTRACT(YEAR FROM sale_date)
	) )* 100.00 / LAG(SUM(price * quantity)) OVER(
		ORDER BY EXTRACT(YEAR FROM sale_date)
	),2) AS percent_change,
	SUM(quantity) AS total_quantity,
	COUNT(sale_reference) AS total_transactions,
	ROUND(SUM(price * quantity) / COUNT(sale_reference),2) AS average_basket_value
	
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY EXTRACT(YEAR FROM sale_date)
ORDER BY years;

/* 
Revenue Growth Over Time
- 2021: The Peak
Following a solid performance in 2020, revenue saw its most significant year-over-year increase, growing by 1.21%. 
This positive trend corresponded with the highest average basket value of 802.23, indicating that customers were spending more per transaction.
- 2022-2023: The Decline
Revenue experienced two consecutive years of decline. In 2022, it dropeed by 1.49%,
followed by a more substantial decrease of 2.68% in 2023- the largest single-year drop in the period.
This decline aligns with a continuous decrease in the average basket value, which fell to its lowest point (778.93) in 2023,
suggesting customers were buying less or cheaper items per visit. 2022 and 2023 are the only years with the total quantity falling below 
the 10,000 mark apart from 2020.
-2024: The recovery:
This year marked a strong turnaround, with revenue rebouding by 2.37%. This was likely driven 
by an increase in both total quantity sold and total transactions, even though the average basket value only saw a slight increase.
-2025: A minor dip
The year 2025 saw a very slight decrease of 0.29%. 
This minor dip, after a significant rebound, suggests that sales are either stabilizing or experiencing a minor, controllable dip.
*/

-- Revenue by Month
SELECT
	EXTRACT(YEAR FROM sale_date) AS years,
	TO_CHAR(sale_date, 'Month') AS months,
	SUM(price * quantity) AS revenue,
	SUM(quantity) AS total_quantity,
	COUNT(*) AS sale_transactions,
	ROUND(SUM(price * quantity) / COUNT(*),2) AS average_basket_value
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY EXTRACT(YEAR FROM sale_date), TO_CHAR(sale_date, 'Month')
ORDER BY years ASC;

/*
January: In both 2020 and 2022, January started the year strong with revenue and average basket values.
However, the performance in January 2023 and 2024 was significantly lower.
The rebound in January 2025 shows a positive trend.
March: 2021 was the most successful month, with the highest revenue (249,551.68) and the highest average basket value (860.52)
April: Shows a consistent pattern of lower revenue compared to March and May across all years, suggesting a post-Q1 slump.
Summer Months (June, July, August): Sales performance during the summer is highly variable.
June: shows a positive trend, with revenue in 2024, and 2025 being the highest of the group, which could indicate a growing summer season.
July: revenue was strong in 2020 and 2024 but dropped in other years.
August revenue was low in 2020 and 2023, but saw significant peaks in 2022 and 2024.

Holiday Season (November & December): The data shows a mixed trend for the holiday season.
November: had a high revenue in 2020 but was the lowest-performing month of 2022. it rebounded significantly in 2023, reaching the highest revenue in the entire data.
December consistently ranks as one of the best-performing months each year, with high revenues and transaction numbers, as expected due to holiday shopping.
Weekend Performance: The performance on weekends is inconsistent and generally lower than mid-week. Friday and Saturday revenue tends to fluctuate, with Friday showing a notable drop in 2024 and 2025. 
Sunday had the lowest sales in 2020 but bouned back to become the third-best day in 2022.
Monday & Tuesday: Monday is a strong start to the week for sales, often ranking in the top three days for revenue. Tuesday performance is consistent but generally ranks below Monday, Wednesday, and Thursday

*/

-- Revenue by Days of The Week
SELECT
	EXTRACT(YEAR FROM sale_date) AS years,
	TO_CHAR(sale_date, 'Day') AS day_of_week,
	SUM(price * quantity) AS revenue,
	SUM(quantity) AS total_quantity,
	COUNT(*) AS sale_transactions,
	ROUND(SUM(price * quantity) / COUNT(*),2) AS average_basket_value
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY years, day_of_week, EXTRACT(DOW FROM sale_date)
ORDER BY years, EXTRACT(DOW FROM sale_date);

/*
Mid-week Dominance: (Wednesday & Thursday) Sales peak in the middle of the week. Wednesday and Thursday frequently show the highest revenue and transactions across most years.
*/




-- CUSTOMER INSIGHTS -- 

-- total customers
SELECT
	COUNT(DISTINCT customer_id) AS total_customers
FROM customers;


-- Unique Customers Over Time
-- by day
SELECT
	sale_date::DATE AS sale_day,
	COUNT(DISTINCT customer_id) AS total_customers
FROM sales
GROUP BY sale_day
ORDER BY sale_day; 


-- Histogram for daily customers
WITH daily_customers AS(
SELECT
	sale_date::DATE AS sale_day,
	COUNT(DISTINCT customer_id) AS total_customers
FROM sales
GROUP BY sale_day
ORDER BY sale_day
)
SELECT
	DISTINCT total_customers,
	COUNT(sale_day) AS total_days
FROM daily_customers
GROUP BY DISTINCT total_customers
ORDER BY total_customers;
/* 
The company seems to average between 2-21 unique customers  a day
with the majority of days seems to be having be having between 5-13 different customers a day. 
*/

-- By Week
SELECT
	EXTRACT(YEAR FROM sale_date) AS years,
	EXTRACT(WEEK FROM sale_date) AS weeks,
	COUNT(DISTINCT customer_id) AS unique_customers
FROM sales
GROUP BY years, weeks
ORDER BY years, weeks ASC; 

/* 
The company seems to have betweenKey Trends and Insights
Overall Stability: The number of unique customers per week remains relatively stable across all years, generally fluctuating between 40 and 80. This indicates a consistent level of customer engagement and loyalty, with no major drop-offs.

Seasonal Peaks: There are noticeable seasonal trends in customer activity.

Mid-Year Peaks: Most years show peaks in customer count around Week 12 and Week 25-30, which correspond to the end of Q1 and the middle of the summer, respectively.

Holiday Peaks: The data also shows significant spikes in unique customers towards the end of the year, specifically in Weeks 45 through 52. This is likely due to increased holiday shopping activity.

Highest and Lowest Weeks:

The highest number of unique customers was recorded in 2024, Week 1, with a total of 87. This is an exceptionally strong start to the year compared to previous years.

The lowest customer count occurred in 2021, Week 53, and 2020, Week 1, at 29 and 38, respectively. These low points are likely due to the last week of the year being a short week in some cases, and the start of a new calendar year.


Year-by-Year Comparison
- 2020: Had a relatively low start but a strong finish in the last few weeks of the year.
- 2021: Showed a more consistent trend, but with some notable fluctuations, including the lowest point in the dataset.
- 2023: Also had a strong recovery in the latter half of the year.
- 2024 and 2025: These years show an overall higher baseline of weekly customers, particularly in the early parts of the year, 
	which is a very positive sign for customer acquisition and engagement.
*/



-- Most common payment methods
SELECT
	method_of_payment,
	COUNT(*) AS total_transactions
FROM sales
GROUP BY method_of_payment
ORDER BY total_transactions DESC;


/*
"Cash"	5101
"Debit Card"	5077
"Credit Card"	4971
"Mobile Payment"	4851

- Cash is the most frequently used payment method, with a slight lead over decit and credit cards.
- Cards Dominance: When combined, card payments (debit and credit) account for a significant portion of all transactions, 
	demonstrating their widespread use among the customer base.
- Growing Mobile Payments: Mobile payments, while currently the least used of the four methods, are a strong fourth, 
	showing that  a sizeable segment of the customers are embracing digital wallets
*/

-- Average Transaction value between different payment methods
SELECT
	method_of_payment,
	ROUND(AVG(price * quantity),2) AS average_transaction_revenue
FROM sales AS s
JOIN products AS p
	ON s.product_id = p.product_id
GROUP BY method_of_payment
ORDER BY average_transaction_revenue DESC;

/*
- The results show that there isn't a significant difference in the average value of transactions across different payment methods.
- Cash: $797.76
- Debit Card: $790.29
- Credit Card: $786.42
- Mobile Payment: $774.76
- This analysis confirms that all payment methods are used for similar value purchaes. 
	This is a good operational metric that shows consistency in customer behavior, regardless of how they choose to pay.
*/


-- Sales by Town and State
SELECT
	state,
	COUNT(*) AS total_transactions,
	SUM(price * quantity) AS total_revenue
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY state
ORDER BY total_revenue DESC;

/*
Based on the analysis, the top 10 states in terms of revenue are:
Rank	State	Total Transactions	Total Revenue
1	Wisconsin		449				$364,357.07
2	Indiana			449				$358,420.13
3	Kentucky		460				$358,329.38
4	Minnesota		430				$347,722.76
5	Oklahoma		414				$339,625.60
6	Oregon			425				$338,385.25
7	North Dakota	408				$337,412.62
8	North Carolina	409				$336,691.64
9	Tennessee		418				$336,514.14
10	Nevada			409				$332,909.16

Key Insights:
- Top Performers: The top three states- Wisconsin, Indiana, and Kentucky- are clearly the most valuable markets,
	contributing the highest total revenue.
- Transaction vs. Revenue: While the number of transactions is a strong indicator of a state's sales,
	it's not the only factor. For example, Kentucky has the highest number of transactions in the top 10, but ranks third in revenue,
	suggesting a slightly lower average basket value compared to Wisconsin and Indiana.
- Lowerst Performers: On the other end of the spectrum, Virginia has the lowest total revenue, followed by California and Vermont.
	This suggests that these regions may require additional marketing or operational focus to improve sales.
- National Distribution: The data shows that sales are normaly distributed across many states,
	but there is a clear concentration of top-tier revenue in the Midwest and South
*/

-- Distribution of male and female customers across different states
SELECT
	state,
	gender,
	COUNT(customer_id) AS total_customers
FROM customers
GROUP BY state, gender
ORDER BY state, total_customers DESC; 

/*
The analysis shows the breakdown of male and female customers for each state. 
	While some states have a more balanced mix, others show a higher concentration of one gender over the other
- States with a higher male concentration: Notable examples include 
		* Alaska (9 male, 5 female)
		* California (7 male, 3 female)
		* Rhode Island (11 male, 2 female) 
- States with a Higher Female Concentration
		* Colarado (11 female, 5 male)
		* Delaware (7 female, 4 male)
		* Virginia (10 female, 6 male)
Overall, the total customer base is nearly evenly split, with 253 male customers and 247 female customers.

States with the Highest Customer Concentration
- Here are the top 10 States with the highest customer concentration

Rank	State		Total Customers
1		Arizona			17
2		West Virginia	16
3		Colorado		16
4		Virginia		16
5		Ohio			16
6		Kentucky		15
7		New Mexico		15
8		Alaska			14
9		Nevada			14
10		North Carolina	14

- Arizona has the highest number of customer with 17, followed by a group of states with 16 customers each.
*/

-- Top Spenders
SELECT
	customer_id,
	SUM(quantity * price) AS total_revenue,
	COUNT(*) AS total_transactions
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY customer_id 
ORDER BY total_revenue DESC;

/*

Rank	Customer ID	Total Revenue	Total Transactions
1			99		$53,415.21			57
2			331		$52,093.46			60
3			8		$51,232.54			56
4			296		$50,189.39			53
5			178		$50,022.88			49
6			196		$48,737.51			57
7			317		$48,588.36			57
8			17		$46,646.53			56
9			329		$46,481.42			43
10			477		$45,932.86			50

Key Findings
- Top Customer: Customer ID 99 is the top spender, with over $53,000 in total revenue.
- High-value Transactions: The top 10 customers consistently generate high revenue across a relatively small number of transactions
	(ranging from 43 to 60). This suggests that these customers are making large purchases rather than many small ones.
- Average Revenue per Customer: These top spenders highlight a significant segment of the customer base.

Rank	Customer ID	Total Revenue	Total Transactions
1			20		$15,831.41			28
2			165		$15,904.82			29
3			197		$16,155.88			29
4			385		$16,521.94			23
5			127		$16,549.27			28
6			330		$17,528.58			29
7			129		$18,294.18			31
8			388		$18,696.21			29
9			280		$18,804.88			24
10			96		$18,964.24			26

- Significant Spending Gap: The lowest-spending customer, ID 20, has a total revenue of just over $15,800,
	which is about 70% less than the lowest-spending customer in the top 10 group (45,832.86).
	This highlights a major difference between the most and least valuable customers.
- Low Transaction Volume: Customers in this group also have a lower number of transactions, averaging around 27 per person. 
	This is less than half the average transaction count for the top 10 customers, which was around 53.
- Potential for growth: Identifying these customers can help cretae targeted campaigns to re-engage them or incentivize them to increase their spending.
*/


-- Average Revenue Per Customer
SELECT 
	ROUND(SUM(quantity * price)/ COUNT(DISTINCT s.customer_id),2) AS average_revenue_per_customer
FROM sales AS s
JOIN products AS p ON s.product_id = p.product_id;

/*
- The Average revenue per customer is $31,498.60. This figure could serve as a benchmark to identify the highest and lowest value customers.
- Top Spenders vs. The Average: The top 10 customers are all high-value individuals, with each spending significantly more than the average.
- Observation: The top-spending customer spent approximately 70% more than the average. This group of customers represents a key demographic for targeted loyalty and retention programs.

- Bottom Spenders vs. The Average: On the other end of the spectrm, the lowest-spending customers fall well below the average revenue mark.
- The lowest-spending customer spent approximately 50% less than the average. The low transaction count for this group also indicates a significant difference in purchasing habits compared to the top spenders.
- This segmentation provides valuable information for creating distinct marketing strategies- one for nurturing your high-value customers and another for re-engaging lower-value ones.

Customers Above and Below Average Spending
- There are 241 customers who spent more than the average revenue with 259 customers spending less than the average revenue.
- This indicates a slightly larger portion of the custmer base falling below the average spending mark providing an opportunity
	to develop marketing and sales strategies aimed at increasing the value of these lower-spending customers.
*/ 


/*Products performance Analysis*/

-- Total Number of Products
SELECT 
	COUNT(DISTINCT product_id) AS total_products
FROM products;


-- Top 10 Products (By Revenue)
SELECT 
	product_name,
	SUM(quantity * price) AS revenue
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

-- Bottom 10 Products (By Revenue)
SELECT 
	product_name,
	SUM(quantity * price) AS revenue
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY product_name
ORDER BY revenue
LIMIT 10;


-- Top 10 Products by Quantity
SELECT 
	product_name,
	SUM(quantity) AS total_quantity
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY product_name
ORDER BY total_quantity DESC
LIMIT 10; 

-- Bottom 10 Products by Quantity
SELECT 
	product_name,
	SUM(quantity) AS total_quantity
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY product_name
ORDER BY total_quantity
LIMIT 10;  

/*
-- Top & Bottom Revenue Performerse

- High Revenue Concentration
The top product "Area Force", generated $233k in revenue. The top 10 products account for a significant portion of the total sales.
The top 10 products seem to be the "Cash Cows" and hence must be prioritized for inventory, marketing and pricing to maximize profits.

- Revenue Gap
The difference between the top product ($233k) and the 10th-ranked product ($189k) is relatively small (~$43k),
indicating healthy competition among top performers. 
Revenue performance is broad at the top, suggesting less reliance on a single product.

- Bottom Performers
The bottom products, "Maintain Throw", generated only "$7,427.85".
The bottom 10 products are "Underperformers". They occupy shelf space and inventory resources for minimal return. 
Further investigation is needed to determine if they should be discontinued or heavily marketed.

--- Quantity vs. Revenue Discrepancy
"Area Force" - #1 (Highest Revenue) Quantity Rank #7
- This product is a high-value/ high-demand item. it is a perfect performer,
	successfully generating both high revenue and high sales volume.
"Score Truth" Revenue - #6  Quantity - #9
- Another strong performer showing excellent balance between price and demand.
"Concern Call"  Revenue - #2  Quantity #10
- An overall top-tier product in both metrics.
"Trial Space" Bottom 10 Revenue (#5)  #2 (High Quantity)
- This is a low-margin/high-volume item.
	It's likely a cheap, commodity products. it sells extremly well but contributes minimally to overall revenue.
	Caution should be taken to avoid spending too much time/money marketing this.

"House In"  #8 Bottom Revenue #4 (High Quantity)
- Similar to "Trial Space", this product is high-volume but low-revenue. 
	This highlights a need to investigate its pricing or unit cost to ensure the volume is profitable.

"Particularly Mr"  Not in Top 10 Revenue   #1 Highest Quantity
- This product is the absolute volume leader but fails to make the top 10 revenue list. This confirms it
	is solid at a very low price, contributing to a low Average Basket Value.

-------Summary-------
High-Volume, Low-Revenue Products ("Trial Space," "House In," "Particularly Mr"): 
These products are excellent for driving traffic and transaction count. 
Investigation is required if they can be bundled with higher-margin items or if a slight price increase will not significantly deter customers.

Product Discontinuation: 
Products in the bottom 10 revenue list and bottom 10 quantity list (e.g., "Election Process") are candidates for discontinuation. 
They offer no clear benefit to the business and tie up resources.

Pricing Review: 
The disparity suggests that the Unit Price varies wildly across the catalog. 
A deeper dive is needed to see if products that sell well in quantity are appropriately priced to optimize revenue.

*/
SELECT
	product_name,
	COUNT(DISTINCT state) AS total_states
FROM sales 
LEFT JOIN products ON sales.product_id = products.product_id
GROUP BY product_name
ORDER BY total_states DESC;


/*
-- Analysis of Product Sales Reach
Top Tier  49 states  24 Products e.g., "Area Force", "Concern Call", "House In" etc.
- These are the Most Widely Distributed Products and represent core items with near-universal demand.
- Their distribution network is nearly flawless, reaching 49 out of 50 states.

Second-Tier 48 states  29 products ("Hit Suffer", "Score Truth", "Same Follow")
- This large group of products is only slightly behind the top-tier, missing just one state. 
- This suggests one minor gap in distribution or a very specific population not purchasing these items.

Wider Spread 47 States 20 products ("High Magazine", "Trial Space", "Maybe Push")
- These products have a marginally smaller reach, missing three states

Lowest Reach 39-42 states "Responsibility Almost" (39), "Election Process" (40), "Beyond Data" (42), "Offer Stuff" (42)
- These products have the most significant gaps in distribution or demand.
- "Responsibility Almost" is the least widely purchased products, missing 11 states.

*/

SELECT DISTINCT state
FROM sales
WHERE state NOT IN (
    SELECT DISTINCT T1.state
    FROM sales AS T1
    LEFT JOIN products ON T1.product_id = products.product_id
    WHERE products.product_name = 'Responsibility Almost'
);



/* Departmental Performance Analysis*/
SELECT
	department_name,
	SUM(quantity * price) AS total_revenue,
	SUM(quantity) AS total_quantity,
	COUNT(DISTINCT employees.employee_id) AS total_employees,
	SUM(quantity * price) / COUNT(*) AS average_basket_value,
	COUNT(*) AS total_transactions,
	SUM(price * quantity) / COUNT(DISTINCT employees.employee_id) AS revenue_per_employee,
	SUM(quantity) / COUNT(DISTINCT employees.employee_id) AS quantity_per_employee
FROM sales
JOIN products ON sales.product_id = products.product_id
JOIN employees ON sales.employee_id = employees.employee_id
JOIN departments ON employees.department_id = departments.department_id
GROUP BY department_name
ORDER BY total_revenue DESC; 


/* Overall Departmental Contribution 
Department			Total Revenue (List Price)	Total Quantity	Total Transactions
Home & Garden		$3.16M							12,117			3,990
Health & Beauty		$3.15M							11,991			3,992
Clothing			$2.11M							8,164			2,725
Sports & Outdoors	$2.09M							7,958			2,658

Core Revenue Drivers
- The store's primary engine are "Home & Garden" ($3.16M) and "Health & Beauty" ($3.15M)
- They are nearly identical in performance, requiring three employees each and accounting for the highest revenue and transactions.

Mid-Volume Tier
- "Clothing" ($2.11M) and "Sports & Outdoors" ($2.09M) form the next tier.
- They generate roughly two-thirds of the revenue of the top performers, aligning with their lowr employee count (two each).

Specialty / Low-Volume Tier
- "Automotive", "Electornics" and "Grocery" all cluster around the $1 million mark.
- These departments are single-employee operations, indicating they deal in more focused, specialized, or fewer transactions.

--- Operational Efficiency (Per-Employee Metrics)
- This is the most remarkable aspect of the data, showing near-perfect, uniform productivity across the entire store.
- Automotive (Rev/Emp: $1,076,415) (Qty/Emp:4,095)
The single-employee department is the most efficient, setting the bar for list-price value and volume moved per person.
- Clothing (Rev/Emp: $1,053,649) (Qty/Emp: 4,082)
The two employees in this department achieve performance metrics nearly identical to those with three employees, confirming high individual output.

- Overall Consistency
- Revenue per Employee:All departments range from $1,023,073 to $1,076,415
- Quantity per EmployeeAll departments range from 3,860 to 4,095
- Near-Perfect Uniformity: The extremely tight clustering of Revenue Per employee and Quantity per Employee is an exceptional finding.
	This suggests standardized training and job roles enforce a highly consistent level of performance across the entire store.

--- Transaction Value and Product Focus
Department		Average Basket Value (ABV)		Total Transactions	Interpretation
Electronics 			$811.32						1,314			Drives the largest individual transaction value.
																	Its single employee is focused on high-price, high-impact sales, making it a critical source of premium revenue.
Grocery					$769.16						1,364			Has the lowest ABV, which is logical as Grocery is often comprised of smaller, lower-price items, requiring high volume to match other departments' revenue.

Core Departments		$789-$793					~4,000			The top-tier and single-employee departments (Home & Garden, Health & Beauty, Automotive) have a highly consistent ABV of around $790, representing the store's typical transaction size.
*/


-- Employee Performance Analysis (Sales Reps)
SELECT
	name,
	SUM(price * quantity) AS total_revenue,
	SUM(quantity) AS total_quantity,
	SUM(price * quantity) / COUNT(*) AS average_basket_value,
	COUNT(*) total_transactions,
	COUNT(DISTINCT state) AS total_states
FROM sales
JOIN products ON sales.product_id = products.product_id
JOIN employees ON sales.employee_id = employees.employee_id
GROUP BY name
ORDER BY total_revenue DESC;


/*
---- Overall Performance & Consistency
- Top-Tier Performance: The highest revenue earner, Jerry Martin, generated $1.09 million.
- Bottom-Tier Performance: The lowest earner, Mason Hardy, generated $998.6 thousand.
- Minimal Variance: The entire sales team operates within an extremly narrow band of performance,
	with less than a 9% difference in total revenue between top and bottom employee.
	Every employee is a high-achiever, generating near $1 million in annual list-price revenue.
- Top Reach: Every employee has recorded sales in all 50 states, confirming uniform geographical responsibility and success in achieving national reach.

Key Takeaways:
High-Volume is Standard: All employees manage to sell between 3,781 and 4,129 units. The ability to move high quantity is not a differentiator; it's the baseline expectation.

Focus on ABV: The only significant performance variation is in Average Basket Value (ABV).

Employees with higher ABV (like Jordan Palmer and Christopher Salazar) are excelling at upselling or being strategically placed in high-value departments (like Electronics).

Employees with lower ABV (like Teresa Martin and Alicia Johnson) should be analyzed to see if they can be trained to increase the value of each transaction.

Strategic Recommendations for Management 
- Replicate Best Practices: Analyze the sales techniques and product mix of Jordan Palmer (highest ABV) and Jerry Martin (highest Total Revenue) to create a training module focused on maximizing transaction value.

- Reward System: Since total revenue and quantity are so similar, consider making Average Basket Value a primary metric for performance bonuses, as it highlights superior skill in value-driven selling.

- Cross-Departmental Analysis: The consistency in revenue per employee (∼$1M) confirms the high efficiency found in the departmental analysis. This team is a highly standardized, high-performing asset.


