-- create customer table

-- create table customer(customer_id	varchar(150)	primary key	,
-- customer_unique_id	varchar(150)		,
-- customer_zip_code_prefix	int		,
-- customer_city	varchar(150)		,
-- customer_state	varchar(50)		
-- );


-- create order table

-- create table order_dataset(			
-- order_id	varchar(150)	primary key	,
-- customer_id	varchar(150),
-- order_status	varchar(150)		,
-- order_purchase_timestamp	timestamp		,
-- order_approved_at	timestamp		,
-- order_delivered_carrier_date	timestamp		,
-- order_delivered_customer_date	timestamp		,
-- order_estimated_delivery_date	timestamp				
-- );


--  create order items table

-- create table order_item(			
-- order_id	varchar(150)	,
-- order_item_id	varchar(150)	,
-- product_id	varchar(150)	,
-- seller_id	varchar(150)	,
-- shipping_limit_date	timestamp	,
-- price	float	,
-- freight_value	float					
-- );


--  create Product dataset table

-- create table product(			
-- product_id	varchar(150)	,
-- product_category_name	varchar(150)	,
-- product_name_lenght	int	,
-- product_description_lenght	int	,
-- product_photos_qty	int	,
-- product_weight_g	int	,
-- product_length_cm	int	,
-- product_height_cm	int	,
-- product_width_cm	int						
-- );

--  create order_payment dataset table
-- create table order_payment(			
-- order_id	varchar(150)	,
-- payment_sequential	int	,
-- payment_type	varchar(150)	,
-- payment_installments	int	,
-- payment_value	float					
-- );

--  create saller dataset table
-- create table seller(			
-- 		seller_id	varchar(100)	,
-- seller_zip_code_prefix	int	,
-- seller_city	varchar(100)	,
-- seller_state	varchar(100)			
-- );

-- Total Order
-- select count(order_id) as Total_order from order_dataset

-- Total revanue
-- select sum(price) as Total_revanue from order_item;

-- Top 10 product_category
-- select p.product_category_name,sum(o.price) as Total_Sales from order_item as o
-- join 
-- product as p
-- on o.product_id=p.product_id
-- group by p.product_category_name,o.price
-- order by Total_Sales desc
-- limit 10;

-- Order By Satate
-- select c.customer_state,count(o.order_id) as Total_order from order_dataset as o
-- join 
-- customer as c
-- on c.customer_id=o.customer_id
-- group by c.customer_state
-- order by Total_order desc;

-- State by order
-- select c.customer_state,count(o.order_id) as Total_order from order_dataset as o
-- join 
-- customer as c
-- on c.customer_id=o.customer_id
-- group by c.customer_state
-- order by Total_order desc;

-- -- category by revanue
-- select p.product_category_name,sum(o.price) as Total_Revanue from order_item as o
-- join 
-- product as p
-- on o.product_id=p.product_id
-- group by p.product_category_name
-- order by Total_Revanue desc;

-- Top 10 customer
-- select c.customer_id,sum(oi.price) as Total_Sales from order_dataset as o
-- join 
-- customer as c
-- on o.customer_id=c.customer_id
-- join 
-- order_item as oi
-- on o.order_id=oi.order_id
-- group by c.customer_id
-- order by Total_Sales desc
-- limit 10;

-- Top 10 customer
-- select c.customer_id,sum(oi.price) as Total_Sales from order_dataset as o
-- join 
-- customer as c
-- on o.customer_id=c.customer_id
-- join 
-- order_item as oi
-- on o.order_id=oi.order_id
-- group by c.customer_id
-- order by Total_Sales desc
-- limit 10;

-- Average order Value
-- select avg(price) as Average_value from order_item;

-- order by month
-- select Extract(month from  order_purchase_timestamp) as Months,count(order_id) as Total_order from order_dataset
-- group by Months
-- order by Months asc ;

-- Highest Revenue State
-- select c.customer_state AS States,sum(oi.price) as Total_sales from order_dataset as o
-- join 
-- customer as c
-- on c.customer_id=o.customer_id
-- join 
-- order_item as oi
-- on o.order_id=oi.order_id
-- group by c.customer_state
-- order by Total_sales desc
-- limit 1;

--Total Cancelled Order
-- select count(*) AS Canclled_order from order_dataset 
-- where order_status='Canceld';



-- Intermediate Query

 -- Revanue Contirbution by Category
-- select p.product_category_name as Category,sum(o.price) as Total_revanue,sum(o.price)*100/sum(o.price)as contribution from order_item as o
-- join
-- product as p
-- on o.product_id=p.product_id
-- group by p.product_category_name
-- order by Total_revanue desc
-- ;

-- Average Deliver time and Date
-- select avg(order_delivered_customer_date-order_purchase_timestamp) as Average_Deliver_time from order_dataset ;

--State with Highest Delivery delays
-- select c.customer_state , (o.order_delivered_customer_date-o.order_purchase_timestamp) as Delivery_Time
-- from order_dataset as o
-- join customer as c
-- on o.customer_id=c.customer_id
-- group by c.customer_state,Delivery_Time
-- order by Delivery_Time desc
-- limit 1;

-- Top Sellar by Revenue
-- select s.seller_id,s.seller_city,s.seller_state,sum(o.price) as Total_Revenue from order_item  as o
-- join seller as s
-- on o.seller_id=s.seller_id
-- group by s.seller_id,s.seller_city,s.seller_state
-- order by Total_Revenue desc
-- limit 1;

-- Customer with multiplay order
-- select c.customer_id 
-- from customer as c
-- join order_dataset as o
-- on o.customer_id=o.customer_id
-- group by c.customer_id
-- having count(o.order_id)>1
-- ;


-- -- -- Product newer sold
-- select p.product_id from order_item  as o
-- join product as p
-- on o.product_id=p.product_id
-- group by p.product_id,o.product_id
-- having p.product_id!=o.product_id;

--  Montlye Revenue
-- select Extract(month from o.order_purchase_timestamp)as Months,sum(price) as Total_Revenue from order_item  as oi
-- join order_dataset as o
-- on o.order_id=oi.order_id
-- group by Months
-- order by Months asc;

 -- Customer segmention
-- select c.customer_id,sum(price) as Total_Revenue,case when price>=50 then 'Hiegh' when price<50 then 'low perfomece' 
-- end from order_item  as oi
-- join order_dataset as o
-- on o.order_id=oi.order_id
-- join customer as c
-- on o.customer_id=c.customer_id
-- group by c.customer_id,oi.price;

-- Rank category by  revenue
-- select p.product_category_name,sum(o.price) as Total_revenue,dense_rank()over()
-- from product as p 
-- join 
-- order_item as o
-- on o.product_id=p.product_id
-- group by p.product_category_name
-- order by Total_revenue desc;

-- Rank category by  revenue
-- select Extract(month from order_purchase_timestamp) as months,sum(oi.price) as Total_revenue,
-- sum(sum(price))over(order by Extract(month from order_purchase_timestamp)) as 
-- Running_Total
-- from order_item as oi
-- join 
-- order_dataset as o
-- on o.order_id=oi.order_id
-- group by months
-- order by months asc;

-- Runnig Revenue Total
-- select Extract(month from order_purchase_timestamp) as months,sum(oi.price) as Total_revenue,
-- sum(sum(price))over(order by Extract(month from order_purchase_timestamp)) as 
-- Running_Total
-- from order_item as oi
-- join 
-- order_dataset as o
-- on o.order_id=oi.order_id
-- group by months
-- order by months asc;


-- -- State above average
-- select p.customer_state,oi.price from customer as p
-- join
-- order_dataset as o
-- on o.customer_id=p.customer_id
-- join 
-- order_item as oi
-- on o.order_id=oi.order_id
-- group by p.customer_state,oi.price
-- having oi.price>(select avg(price)
-- from order_item)
-- order by p.customer_state desc;

-- Revenue Share
-- select p.product_category_name,oi.price,
-- sum(oi.price)*100.0/sum(sum(oi.price))over() as Revenue_share
-- from product as p
-- join 
-- order_item as oi
-- on oi.product_id=p.product_id
-- group by p.product_category_name,oi.price
-- order by oi.price desc;

-- identify high risk sellers
-- select s.seller_id,count(o.order_id) as Total_order, case 
-- when count(o.order_id)<50 then 'High Risk'
-- when count(o.order_id)<200 then 'Medium Risk' 
-- else 'low risk' 
-- end
-- from seller as s
-- join 
-- order_item as o
-- on s.seller_id=o.seller_id
-- group by s.seller_id;

-- Delever performance Ranking
-- select avg(order_delivered_customer_date-order_purchase_timestamp) as avg_delivery,
-- rank()over(order by avg(order_delivered_customer_date-order_purchase_timestamp) desc)
-- from order_dataset
-- ;