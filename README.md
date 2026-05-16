# Superstore-Sales-Discount-Optimization-Analysis
Superstore Sales & Discount Optimization Analysis
Tool: MySQL | Dataset: Sample Superstore (9,994 transactions, 2014–2017)
---
Project Background
Superstore is a fictional U.S. retail company selling furniture, office supplies, and technology products. As a data analyst, I was tasked with investigating why the company's profit margins remain low despite strong revenue — and whether the discounting strategy is a key driver.
This analysis focuses on identifying discount leakage, unprofitable products, customer behaviour patterns, and revenue trends to produce actionable recommendations for improving profitability.
---
Key Finding
> **885 orders were placed with discounts above 40%. Together they erased $98,327 in profit and gave away $232,980 in revenue through discounting alone — with zero net return.**
This single finding anchors the entire analysis: aggressive discounting is not driving loyalty or volume gains that offset the margin loss. It is simply destroying profit.
---
Questions Explored
Which orders with high discounts came closest to breaking even?
Which individual product transactions are operating at a loss?
How much revenue is being given away in discounts, by sub-category?
Are certain regions receiving disproportionately high discount rates?
What is the total financial damage of discounts above 40%?
How does monthly revenue trend over time — are there seasonal peaks?
How frequently does the average customer place orders?
What share of revenue comes from repeat buyers vs. one-time buyers?
Which products generate the highest cumulative net profit?
Which high-revenue products are yielding zero or negative profit due to discounting?
At exactly which discount threshold does profitability collapse?
---
Summary of Findings
Discount Impact
Orders discounted above 40% generated a collective loss of $98,327 across 885 transactions
$232,980 in potential revenue was surrendered through discounting with no profitable return
The "Discount Trap" analysis revealed multiple products exceeding $5,000 in revenue that still produced negative net profit — driven by average discount rates well above 20%
By Sub-Category
Certain sub-categories absorb disproportionate discount costs relative to their sales contribution
Tables, Bookcases, and Machines consistently appear in loss-making territory regardless of sales volume
By Region
Discount rates vary across regions, suggesting inconsistent pricing policies rather than a deliberate strategy
Customer Behaviour
The majority of revenue is driven by repeat buyers, yet one-time buyers represent a significant untapped retention opportunity
Revenue Trends
Monthly revenue shows clear seasonal patterns, with spikes in Q4 — useful for inventory and promotional planning
---
Recommendations
Cap discounts at 20% — the data shows profitability deteriorates sharply beyond this threshold. A hard cap would protect margins without meaningfully impacting volume
Review the Tables and Bookcases pricing structure — these sub-categories lose money even before heavy discounting is applied, suggesting a cost or pricing problem independent of discount policy
Introduce a repeat buyer programme — repeat customers drive the bulk of profitable revenue; incentivising second purchases from one-time buyers is a low-cost margin lever
Audit regional discount authority — the regional variance in average discount rates suggests discounting decisions are decentralised and inconsistent; standardising approval thresholds would reduce unnecessary margin giveaway
---
File Structure
```
/superstore-discount-analysis
  README.md
  /queries
    ProjectDiscount.sql
  /screenshots
    query_results/
```
---
About
Anas Addawe — International Business & Marketing student transitioning into data analytics. Skilled in SQL, Power BI, and Excel.
Connect on LinkedIn | 
