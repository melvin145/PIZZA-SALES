---Retrieve the total number of orders placed.

---SELECT COUNT(order_id) AS Total_orders FROM Pizza_sales.orders

---Calculate the total revenue generated from pizza sales.

/*SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),2) as Total_sales
FROM
    `Pizza_sales.order_details` as order_details
  JOIN
    `Pizza_sales.pizzas` as pizzas
    ON
      order_details.pizza_id=pizzas.pizza_id
      */

---Identify the highest-priced pizza.

/*
SELECT
  pizza_types.string_field_1 as expensive_pizza,
  pizza.price
  FROM
  `Pizza_sales.pizza_types` as pizza_types
  JOIN
  `Pizza_sales.pizzas` as pizza
  ON
  pizza.pizza_type_id=pizza_types.string_field_0
  order by
  pizza.price desc  limit 1
  */

 
---Identify the most common pizza size ordered.
/*
SELECT
   pizzas.size,count(order_details.order_details_id) as order_details
FROM
   `Pizza_sales.pizzas` as pizzas
  JOIN
    `Pizza_sales.order_details` as order_details
    ON
      pizzas.pizza_id = order_details.pizza_id
    group by
      pizzas.size
      */


---List the top 5 most ordered pizza types along with their quantities.

/*SELECT 
    pizzas_types.string_field_1,COUNT(order_details.order_details_id) as total_order,SUM(order_details.quantity) as total_quantity
FROM
  `Pizza_sales.pizzas` as pizzas
JOIN
  `Pizza_sales.pizza_types` as pizzas_types
ON
  pizzas.pizza_type_id = pizzas_types.string_field_0
JOIN
  `Pizza_sales.order_details` as order_details
ON
  pizzas.pizza_id = order_details.pizza_id
GROUP BY
    pizzas_types.string_field_1
ORDER BY
    total_quantity
     DESC limit 5 */


----Join the necessary tables to find the total quantity of each pizza  ordered.

/*
SELECT
    pizza_types.string_field_2,SUM(order_details.quantity) as total_quantity
FROM
    `Pizza_sales.pizza_types` as pizza_types
JOIN
    `Pizza_sales.pizzas` as pizzas
  ON
    pizza_types.string_field_0=pizzas.pizza_type_id
  JOIN
      `Pizza_sales.order_details` as order_details
    ON
      pizzas.pizza_id=order_details.pizza_id
GROUP BY
    pizza_types.string_field_2
ORDER BY
    total_quantity DESC LIMIT 5
    */
---Join relevant tables to find the category-wise distribution of pizzas.
/*SELECT
   string_field_2,count(string_field_1) from `Pizza_sales.pizza_types`
   group by
   string_field_2*/


---Group the orders by date and calculate the average number of pizzas ordered per day.

/*SELECT ROUND(AVG(quantity),0) as average_pizza_ordered
FROM

(SELECT
  orders.date,SUM(order_details.quantity) as quantity
FROM
  `Pizza_sales.orders` as orders
  JOIN
  `Pizza_sales.order_details` as order_details
  ON 
    orders.order_id = order_details.order_id
GROUP BY
  orders.date
) as order_quantity*/

---Calculate the percentage contribution of each pizza type to total revenue.

/*SELECT
  pizza_types.string_field_2 ,
  ROUND
  (SUM(order_details.quantity * pizzas.price) /  (SELECT ROUND(SUM(order_details.quantity * pizzas.price),2)     as    total_sales
    FROM
    `Pizza_sales.order_details` as
    order_details
    JOIN
    `Pizza_sales.pizzas` as pizzas
    ON
    pizzas.pizza_id = order_details.pizza_id
  )*100,2)AS REVENUE
FROM
  `Pizza_sales.pizza_types` as pizza_types
  JOIN
  `Pizza_sales.pizzas` as pizzas
  ON
  pizza_types.string_field_0 =pizzas.pizza_type_id
  JOIN
  `Pizza_sales.order_details` as order_details
  ON
    pizzas.pizza_id=order_details.pizza_id
  GROUP BY
    pizza_types.string_field_2
  ORDER BY
  REVENUE DESC
  */

---Analyze the cumulative revenue generated over time.

/*SELECT order_date,sum(revenue) over(order by order_date) as cum_revenue
FROM
(
SELECT
    orders.date as order_date,sum(order_details.quantity * pizzas.price) as revenue
FROM
    `Pizza_sales.orders` as orders
  JOIN
    `Pizza_sales.order_details` as order_details
  ON
    orders.order_id = order_details.order_id
  JOIN
    `Pizza_sales.pizzas` as pizzas
  ON
    order_details.pizza_id = pizzas.pizza_id
  GROUP BY
    orders.date) as sales*/
