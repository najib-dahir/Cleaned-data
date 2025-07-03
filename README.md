🧹 Cleaned Layoffs Dataset using MySQL
This project contains a cleaned version of a layoffs dataset. The original raw data required significant processing to make it usable for analysis.
Using MySQL, I performed a full data cleaning process that included:

✅ Cleaning Process
Removing duplicates using ROW_NUMBER() and Common Table Expressions (CTEs)

Trimming and standardizing text values such as company names, industries, and countries

Fixing inconsistent formats in the date column and converting them to proper DATE format

Handling null values, including deletion of rows with completely missing layoff data

Dropping unnecessary columns to simplify the dataset

This process took three full days and helped me gain deep insights into real-world data cleaning practices.

📈 What You Can Do with This Dataset
Now that the dataset is cleaned and structured properly, you can:

.Perform exploratory data analysis (EDA)

.Visualize layoffs by industry, company, country, or time period

.Identify trends and patterns in layoff activity

.Train machine learning models to predict layoffs

.Use it as a clean input for business dashboards or SQL practice

🛠 Tools Used
MySQL for all data cleaning steps

SQL techniques like CTEs, ROW_NUMBER(), TRIM(), UPDATE, and DELETE

Feel free to clone, analyze, or expand upon this dataset. If you'd like a version in .csv format, just let me know and I can help convert it!

