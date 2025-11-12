# Shopeasy: Retail Sales & Inventory Optimization Analysis

This project is a comprehensive analysis of the Shopeasy retail chain's 2024 sales and inventory data. The goal is to identify key performance drivers, visualize KPIs, and provide actionable insights to solve challenges related to fluctuating sales, inventory overstocking, and lost revenue.

The analysis proves a strong link between low inventory levels (stock-outs) and direct-lost sales, providing a clear path for optimization.

## 📊 Power BI Dashboard Showcase

The final interactive dashboard provides a 360-degree view of Shopeasy's performance. It monitors top-level KPIs and allows for deep-dives into product, store, and seasonal trends.

**<img width="1530" height="853" alt="Screenshot 2025-11-11 215714" src="https://github.com/user-attachments/assets/942f49cf-60c0-4d3e-99f2-fc3617a27401" />**

*Key insights from the dashboard include:*
* **Total Sales:** 767.95M
* **Total Units Sold:** 732K
* A strong visual correlation showing that sales drop significantly when inventory levels are "low," confirming that stock-outs are a primary source of lost revenue.

---

## Problem Scenario

The Shopeasy management team needed to address several key issues:
* Fluctuating sales and inaccurate forecasting.
* Inventory overstocking, which ties up capital.
* Lost revenue due to seasonal demand changes and stock-outs.

This project focuses on the **Phase 1 (Data Analyst)** role to explore the data and build a BI dashboard to answer critical business questions.

---

## 🛠️ Project Workflow

This project follows a 3-stage analytics workflow:

1.  **Data Processing (Python & Jupyter Notebook)**
    * Loaded the raw `.csv` dataset into a pandas DataFrame.
    * Checked for null values (found none) and standardized column names.
    * Engineered new features, including `seasons` (from the `date`) and `inventory_used` (categorical bins), to enable deeper analysis.

2.  **Database Storage & Analysis (MySQL)**
    * Used `SQLAlchemy` and `mysql-connector-python` to export the cleaned DataFrame into a MySQL database (`shopeasy_updated`).
    * Wrote complex SQL queries to answer key business questions from the central database.

3.  **Visualization (Power BI)**
    * Connected Power BI directly to the MySQL database.
    * Built an interactive dashboard to visualize KPIs, trends, and the answers to the business questions.

---

## 🔍 Key Analytical Questions Answered (SQL)

The analysis in MySQL was structured to answer the company's most pressing questions:

* What are the top-performing stores and product categories?
* How do sales vary by city, month, and season?
* Which products are most often overstocked or understocked (using an `Inventory_to_Sales_Ratio`)?
* How do discounts and promotions affect total sales?
* Which city has the highest average transaction value?
* Which products show consistent growth or decline?
* What is the correlation between temperature, holidays, and sales?

---

## 💡 Key Findings & Recommendations

1.  **Finding:** There is a direct, negative impact of "low" inventory on sales. The dashboard confirms that stock-outs are a primary source of lost revenue.
    * **Recommendation:** Prioritize maintaining a "medium" stock level for high-performing products. Use the "low" inventory category as a critical alert to trigger re-ordering.

2.  **Finding:** The `Inventory_to_Sales_Ratio` (calculated in SQL) is highly effective at identifying inventory inefficiencies.
    * **Recommendation:** Automate reports for "Top 10 Overstocked Products" (to be discounted) and "Top 10 At-Risk Products" (to be re-stocked).

3.  **Finding:** Sales performance varies significantly by city and store.
    * **Recommendation:** Adopt a localized inventory strategy. Managers should use the Power BI dashboard's filters to make stocking decisions based on their specific store's demand.

---

## 🔧 Tools Used

* **Data Processing:** Python (Pandas, NumPy)
* **Database:** MySQL
* **Data-DB Connection:** SQLAlchemy, mysql-connector-python
* **IDE:** Jupyter Notebook
* **Business Intelligence:** Power BI

---

## 📄 License

This project is licensed under the MIT License.
