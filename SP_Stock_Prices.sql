SELECT *
FROM sp_stock_prices;


-- Date with the highest trading volume
SELECT 
	date,
	SUM(volume) "Volume"
FROM sp_stock_prices
GROUP BY date
ORDER BY "Volume" DESC;


-- Two highest trading stocks on the 24/08/2015
SELECT
	symbol,
	SUM(volume)"Volume"
FROM sp_stock_prices
WHERE date IN ('2015/08/24')
GROUP BY symbol
ORDER BY "Volume" DESC
LIMIT 2;


-- Highest trading products overall
SELECT
	symbol,
	SUM(Volume) "Volume"
FROM sp_stock_prices
GROUP BY symbol
ORDER BY "Volume" DESC;


SELECT 
	symbol,
	date,
	sum(volume) "Volume"
FROM sp_stock_prices
GROUP BY symbol, date
ORDER BY "Volume" DESC


-- stock volume by date
SELECT
	date,
	SUM(volume) "Volume"
FROM sp_stock_prices
GROUP BY date
ORDER BY "Volume" ASC;


-- Caculating volatility for AMZN shares
SELECT
	date,
	(high - low) "Volatility"
FROM sp_stock_prices
WHERE symbol LIKE '%AMZN'


-- Identifying the day with the higest volatility for AMZN shares
SELECT
	date,
	(high - low) AS "Average Volatility"
FROM sp_stock_prices
WHERE symbol LIKE '%AMZN'
ORDER BY "Average Volatility" DESC;


-- Calculating the  average of the opening and closing share price in descending order
SELECT
	stock_symbol,
	ROUND(AVG(open),2) AS "Open",
	ROUND(AVG(close),2) AS "Close"
FROM sp_stock_prices
GROUP BY symbol
ORDER BY "Close" DESC;


-- Retriving information for PCLN 
SELECT
	*
FROM sp_stock_prices
WHERE symbol LIKE '%PCLN%';


-- Calculating the volatility for PCLN
SELECT
	date,
	(high - low) "Volatility"
FROM sp_stock_prices
WHERE symbol LIKE '%PCLN%';


-- Calculating the average volatility by stock
SELECT
	stock_symbol,
	ROUND(AVG(high-low),2) AS "Volatility"
FROM sp_stock_prices
GROUP BY stock_symbol
ORDER BY "Volatility" DESC;


-- Average of opening price and closing price by year
SELECT 
	symbol,
	year,
	ROUND(AVG(open),2) "Open",
	ROUND(AVG(close),2) "Close"
FROM sp_stock_prices
GROUP BY year,symbol
ORDER BY "Open" DESC


-- Changes in stock prices by year
SELECT
	year,
	symbol,
	SUM(close-open) "Price Diff"
FROM sp_stock_prices
GROUP BY year, symbol
ORDER BY "Price Diff" DESC;


-- Average volatility by stock and year
SELECT
	year,
	symbol,
	ROUND(AVG(high-low),2) "Volatility"
FROM sp_stock_prices
GROUP BY year, symbol
ORDER BY "Volatility" DESC;


-- Trading volume by year in desending order
SELECT
	year,
	SUM(volume) "Volume"
FROM sp_stock_prices
GROUP BY year
ORDER BY "Volume" DESC;


-- Trading Volume and stock by year in Desending order
SELECT
	year,
	symbol,
	SUM(volume) "Volume"
FROM sp_stock_prices
GROUP BY year,symbol
ORDER BY "Volume" DESC;


-- Trading volume by year in assending order
SELECT
	year,
	symbol,
	SUM(volume) "Volume"
FROM sp_stock_prices
GROUP BY year,symbol
ORDER BY "Volume" ASC;


-- Trading volume by week in DESC order
SELECT
	symbol,
	week_num,
	SUM(volume) "Volume"
FROM sp_stock_prices
GROUP BY symbol,week_num
ORDER BY "Volume" DESC;


-- Weekly trading volume by year
-- 2014
SELECT
	symbol,
	week_num,
	SUM(volume) "Volume"
FROM sp_stock_prices
WHERE year IN ('2014')
GROUP BY symbol,week_num
ORDER BY "Volume" DESC;

-- 2015
SELECT
	symbol,
	week_num,
	SUM(volume) "Volume"
FROM sp_stock_prices
WHERE year IN ('2015')
GROUP BY symbol,week_num
ORDER BY "Volume" DESC;

-- 2016
SELECT
	symbol,
	week_num,
	SUM(volume) "Volume"
FROM sp_stock_prices
WHERE year IN ('2016')
GROUP BY symbol,week_num
ORDER BY "Volume" DESC;

-- 2017
SELECT
	symbol,
	week_num,
	SUM(volume) "Volume"
FROM sp_stock_prices
WHERE year IN ('2017')
GROUP BY symbol,week_num
ORDER BY "Volume" DESC;


