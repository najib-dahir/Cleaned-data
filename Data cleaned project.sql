select*from layoffs;
-- now when we are data cleaning we usually follow a few steps
-- 1. check for duplicates and remove any
-- 2. standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. remove any columns and rows that are not necessary - few ways

create table layoffs_staging -- THE reason we created this new table is to work with it and don't lose our original raw of data
Like layoffs;

select*from layoffs_staging;

Insert layoffs_staging
select*from layoffs;

select*,
ROW_NUMBER() over(partition by company,location,industry,
total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;
with duplicate_cte as
(
select*,
ROW_NUMBER() over(partition by company,location,industry,
total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
select*
from duplicate_cte
where row_num>1;

select* from
layoffs_staging
where company='casper';

with duplicate_cte as
(
select*,
ROW_NUMBER() over(partition by company,location,industry,
total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
select*
from duplicate_cte
where row_num>1;
CREATE TABLE `layoffs_staging2` (
  `company` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `industry` text DEFAULT NULL,
  `total_laid_off` int(11) DEFAULT NULL,
  `percentage_laid_off` text DEFAULT NULL,
  `date` text DEFAULT NULL,
  `stage` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `funds_raised_millions` int(11) DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

select*from
layoffs_staging2;

insert into layoffs_staging2
select*,
ROW_NUMBER() over(partition by company,location,industry,
total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;

select*from
layoffs_staging2
where row_num> 1;

DELETE
from
layoffs_staging2
where row_num> 1;

select*from
layoffs_staging2
where row_num> 1;

-- Standardizing-- this is finding issues in ur data and then fixing it
select distinct(trim(company)) -- the keyword distinct ensures that the query returns only unique values in the specified columns
from layoffs_staging2;
select company, Trim(company)
from layoffs_staging2;
UPDATE layoffs_staging2
SET company= Trim(company);
select distinct(industry)
from layoffs_staging2;

update layoffs_staging2
set industry='crypto'
where industry like'crypto%';

select distinct country, Trim(trailing '.' from country)
from layoffs_staging2
order by 1;
update layoffs_staging2
set country='united states'
where country like'united state';

select `date`,
str_to_date(`date`,'%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date`= str_to_date(`date`,'%m/%d/%Y');

ALTER table layoffs_staging2   -- ALTER IS USED TO MODIFY DATA TYPES
MODIFY column `date` DATE;

-- REMOVING AND FIXING NULL VALUES AND MISSING VALUES
select*from 
layoffs_staging2
WHERE total_laid_off is null
and percentage_laid_off is null;

select*from layoffs_staging2
where company='Airbnb';

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT*from layoffs_staging2;

ALTER TABLE layoffs_staging2  -- DELETING UNNECESSARY COLOMNS USE KEYWORDS LIKE ALTER AND DROP alter to call the table and drop to delete it
DROP column row_num;

















