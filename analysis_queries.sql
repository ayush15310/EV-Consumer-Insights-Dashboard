/*PROJECT : EV Market Strategy & Infrastructure Analytics*/

CREATE DATABASE EV_ANALYTICS;
USE EV_ANALYTICS;

select * from consumer_behavior;

select count(*) as total_respondants from consumer_behavior;
select  
      range_anxiety_level,
      will_buy_ev,
      count(*) as total_consumers
from consumer_behavior
group by range_anxiety_level, will_buy_ev;

select 
      city_type,
	  home_charging_possible,
      count(*) as total_consumers,
      round(avg(annual_income_usd),2) as avg_income,
      round(avg(daily_commute_km),2) as avg_commute
from consumer_behavior
group by city_type,home_charging_possible
order by city_type,home_charging_possible;

select * from ev_trends;
select count(*) as total_trends from ev_trends;


SELECT 
    c.Buyer_ID,
    c.Annual_Income_USD,
    t.ev_brand,
    t.ev_model,
    t.effective_price_usd,
    t.top_concern_before_buying
FROM consumer_behavior c
INNER JOIN ev_trends t 
    ON CAST(SUBSTRING(c.Buyer_ID, 3) AS UNSIGNED) = CAST(SUBSTRING(t.record_id, 3) AS UNSIGNED);
    
SELECT 
    t.ev_brand,
    COUNT(*) AS total_purchases,
    ROUND(AVG(c.Annual_Income_USD), 2) AS avg_buyer_income,
    ROUND(AVG(t.effective_price_usd), 2) AS avg_car_price,
    -- Calculates how many times their annual salary the car costs
    ROUND(AVG(t.effective_price_usd / c.Annual_Income_USD), 2) AS price_to_income_ratio
FROM consumer_behavior c
INNER JOIN ev_trends t 
    ON CAST(SUBSTRING(c.Buyer_ID, 3) AS UNSIGNED) = CAST(SUBSTRING(t.record_id, 3) AS UNSIGNED)
GROUP BY t.ev_brand
ORDER BY price_to_income_ratio DESC;


SELECT 
    c.Buyer_ID,
    c.Age,
    c.Gender,
    c.Annual_Income_USD,
    c.Daily_Commute_km,
    c.Range_Anxiety_Level,
    c.Home_Charging_Possible,
    t.ev_brand,
    t.ev_model,
    t.effective_price_usd,
    t.range_km,
    t.top_concern_before_buying
FROM consumer_behavior c
INNER JOIN ev_trends t 
    ON CAST(SUBSTRING(c.Buyer_ID, 3) AS UNSIGNED) = CAST(SUBSTRING(t.record_id, 3) AS UNSIGNED);
    
