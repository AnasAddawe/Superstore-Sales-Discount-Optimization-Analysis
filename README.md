[ssse.md](https://github.com/user-attachments/files/27854332/ssse.md)
# Superstore Sales \& Discount Optimization Analysis

**Tool:** MySQL | **Dataset:** Sample Superstore (9,994 transactions, 2014–2017)

\---

## Project Background

Superstore is a fictional U.S. retail company selling furniture, office supplies, and technology products. As a data analyst, I was tasked with investigating why the company's profit margins remain low despite strong revenue — and whether the discounting strategy is a key driver.

This analysis focuses on identifying discount leakage, unprofitable products, customer behaviour patterns, and revenue trends to produce actionable recommendations for improving profitability.

\---

## Key Finding

> \*\*885 orders were placed with discounts above 40%. Together they erased $98,327 in profit and gave away $232,980 in revenue through discounting alone — with zero net return.\*\*
><img width="822" height="256" alt="image" src="https://github.com/user-attachments/assets/c93b2d30-b9cb-42b0-a3af-86fac2afac7d" />


This single finding anchors the entire analysis: aggressive discounting is not driving loyalty or volume gains that offset the margin loss. It is simply destroying profit.

\---

## Questions Explored

1. Which orders with high discounts came closest to breaking even?
2. Which individual product transactions are operating at a loss?
3. How much revenue is being given away in discounts, by sub-category?
4. Are certain regions receiving disproportionately high discount rates?
5. What is the total financial damage of discounts above 40%?
6. How does monthly revenue trend over time — are there seasonal peaks?
7. How frequently does the average customer place orders?
8. What share of revenue comes from repeat buyers vs. one-time buyers?
9. Which products generate the highest cumulative net profit?
10. Which high-revenue products are yielding zero or negative profit due to discounting?
11. At exactly which discount threshold does profitability collapse?

\---

## Summary of Findings

**Discount Impact**

* Orders discounted above 40% generated a collective loss of $98,327 across 885 transactions
* $232,980 in potential revenue was surrendered through discounting with no profitable return
* The "Discount Trap" analysis revealed multiple products exceeding $5,000 in revenue that still produced negative net profit — driven by average discount rates well above 20%
<img width="734" height="336" alt="Näyttökuva 2026-05-16 150933" src="https://github.com/user-attachments/assets/7812da4b-978b-4483-8c1d-c6f8576372ea" />

**By Sub-Category**

* Certain sub-categories absorb disproportionate discount costs relative to their sales contribution
* Tables, Bookcases, and Machines consistently appear in loss-making territory regardless of sales volume

**By Region**

* Discount rates vary across regions, suggesting inconsistent pricing policies rather than a deliberate strategy

**Customer Behaviour**

* The majority of revenue is driven by repeat buyers, yet one-time buyers represent a significant untapped retention opportunity

**Revenue Trends**

* Monthly revenue shows clear seasonal patterns, with spikes in Q4 — useful for inventory and promotional planning

\---

## Recommendations

1. **Cap discounts at 20%** — the data shows profitability deteriorates sharply beyond this threshold. A hard cap would protect margins without meaningfully impacting volume
2. **Review the Tables and Bookcases pricing structure** — these sub-categories lose money even before heavy discounting is applied, suggesting a cost or pricing problem independent of discount policy
3. **Introduce a repeat buyer programme** — repeat customers drive the bulk of profitable revenue; incentivising second purchases from one-time buyers is a low-cost margin lever
4. **Audit regional discount authority** — the regional variance in average discount rates suggests discounting decisions are decentralised and inconsistent; standardising approval thresholds would reduce unnecessary margin giveaway

\---

## File Structure

```
/superstore-discount-analysis
  README.md
  /queries
    ProjectDiscount.sql
  /screenshots
    query\_results/
```

\---

## About

**Anas Addawe** — International Business \& Marketing student transitioning into data analytics. Skilled in SQL, Power BI, and Excel.

Connect on [LinkedIn](https://www.linkedin.com/in/addaweanas/) | 

