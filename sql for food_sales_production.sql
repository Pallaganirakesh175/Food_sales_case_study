select Product_Name,sum(Total_Sales_Amount) as produc_sales_amount from food_product_sales_data.sales group by Product_Name order by produc_sales_amount desc; 
select Region,sum(Total_Sales_Amount) as region_revenue from food_product_sales_data.sales group by region;  
select Country,sum(Total_Sales_Amount) as country_revenue from food_product_sales_data.sales group by country order by country desc; 
SELECT Sales_Channel,sum(Total_Sales_Amount) as sales_channel FROM food_product_sales_data.sales group by Sales_Channel;
SELECT  case 
			when "Discount_Applied" = 0 then 'No discount'
			when "Discount_Applied" between 0.01 and 10 then 'Low discount(0-10%)'
			when "Discount_Applied" between 10 and 20 then 'medium discount(10-20%)'
			else 'high discount'
			end as discount_category,
				Profit_Loss,discount_applied from food_product_sales_data.sales group by discount_category;

select case 
			when "order_time" between '06:00:00' and '11:59:00' then 'morning'
            when "order_time" between '12:00:00' and '17:59:59' then 'afternoon'
            when "order_time" between '18:00:00' and '23:59:59' then 'night'
            else 'mid night'
            end as Time_of_the_day,
			Order_Time from food_product_sales_data.sales;
select Region,max(total_sales_amount) from food_product_sales_data.sales group by Region;
select category,sum(profit_loss) from food_product_sales_data.sales group by category;

select count(distinct product_name) as distinct1 from food_product_sales_data.sales;
select sum(Total_sales_amount) from food_product_sales_data.sales;
select country,avg(total_sales_amount) from food_product_sales_data.sales group by country order by avg(total_sales_amount) desc limit 1;
select product_name,total_sales_amount as top_selling_product from food_product_sales_data.sales group by product_name order by top_selling_product desc limit 1;
select date_,total_sales_amount from food_product_sales_data.sales order by date_ desc;
select country,Product_Name,Total_Sales_Amount from food_product_sales_data.sales group by country,Product_Name; 

select * from(
select product_name,country,sum(total_sales_amount) as total_sales,
			rank() over(partition by country order by sum(Total_Sales_amount) desc) as ranked
            from food_product_sales_data.sales 
            group by Product_Name,Country) ranked
            where ranked <=3;
 

select product_name,stddev(daily_sales) as std_dev
					from (select 
					product_name,
                    date_,
                    sum(total_sales_amount) as daily_sales
                    from food_product_sales_data.sales
                    group by Product_Name,Date_)
                    as table1 
                    group by product_name
                    order by std_dev desc;
 
 select min(date_) as early, max(date_) as latest from food_product_sales_data.sales;

select country,count(Quantity_Sold1) as orde_placed from food_product_sales_data.sales group by country order by orde_placed desc;			

SELECT country, COUNT(*) AS total_orders
FROM food_product_sales_data.sales
GROUP BY country
ORDER BY total_orders DESC;

select distinct(product_name) from food_product_sales_data.sales;	

select Category,sum(Quantity_Sold1) as sum_quantity from food_product_sales_data.sales group by category;

select product_name,avg(total_sales_amount) as avg_product from food_product_sales_data.sales group by product_name order by avg_product desc;
            
 select date_,Order_Time,Quantity_Sold1,Product_Name as highest from food_product_sales_data.sales order by Quantity_Sold1 desc;  
 
select region,sum(Total_Sales_Amount) as total_region from food_product_sales_data.sales group by region order by total_region desc limit 5;

--- Which country has the most diverse product portfolio 
select count(distinct Product_Name)as product,country from food_product_sales_data.sales group by country order by product ;

---Calculate month-over-month percentage change in total sales.
with cte as(
			Select date_,sum(Total_Sales_Amount) as total_sales
            from food_product_sales_data.sales group by date_ 
			)
select date_,total_sales,round(lag(total_sales) over (order by Date_),2) as lagfunc,
		total_sales - lag(total_sales) over(order by date_)/lag(total_sales) over(order by date_)*100 as subraction
        from cte

What is the total number of records (orders) in the dataset?
select count(*) from food_product_sales_data.sales

Which product was sold the most by quantity?
select product_name,sum(quantity_sold1) as highre from food_product_sales_data.sales group by product_name order by highre desc limit 1;
 
How many distinct countries are there in the dataset?
select count(distinct country) from food_product_sales_data.sales

What is the average quantity sold per order for each country?
select country,round(avg(quantity_sold1),2) as avg_quantity from food_product_sales_data.sales group by country order by avg_quantity 

What are the top 3 categories by total profit/loss?
select category,max(profit_loss) from food_product_sales_data.sales group by category limit 3;

----What are the top 3 categories by total revenue?
select category,sum(total_sales_amount) as top_revenue from food_product_sales_data.sales group by category order by top_revenue

Show the daily average sales for the most recent 7 days in the dataset.
select date_,avg(total_sales_amount) as avg_sales from food_product_sales_data.sales group by date_ order by date_ desc limit 7

Which product shows consistent month-over-month growth in sales? (at least 3 consecutive months)

with cte as (
			select Product_Name,Date_,sum(Total_Sales_Amount) as total_sales
            from food_product_sales_data.sales 
            group by Product_Name,date_
			),
			ascending as(
						select product_name,date_,total_sales,
						lag(total_sales,1) over(partition by product_name order by date_) as prev_sales1,
						lag(total_sales,2) over(partition by product_name order by date_) as prev_sales2
						from cte
						) 
			select distinct Product_Name,date_ from ascending where total_sales>prev_sales1 and prev_sales1>prev_sales2;
            
 
--What is the cumulative revenue by country over time

Select country,date_,sum(total_sales_amount) over(partition by country order by date_) as cumulative,date_
 from food_product_sales_data.sales 

select * from food_product_sales_data.sales 




Select * from food_product_sales_data.sales















            
            


            
            
            



            
    

        
        


        