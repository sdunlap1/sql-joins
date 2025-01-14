-- write your queries here

-- 1. 
-- Join the two tables so that every column and record appears, 
-- regardless of if there is not an owner_id 
SELECT * FROM owners o FULL OUTER JOIN vehicles v ON o.id = v.owner_id;

-- 2.
-- Count the number of cars for each owner. Display the owners 
-- first_name , last_name and count of vehicles. The first_name
-- should be ordered in ascending order.
SELECT first_name, last_name, COUNT(owner_id) 
FROM owners o JOIN vehicles v ON o.id = v.owner_id 
GROUP BY (first_name, last_name)  ORDER BY first_name;

-- 3.
-- Count the number of cars for each owner and display the average price
-- for each of the cars as integers. Display the owners first_name , last_name,
-- average price and count of vehicles. The first_name should be ordered in
-- descending order. Only display results with more than one vehicle and an 
-- average price greater than 10000.
SELECT first_name, last_name,
  COUNT(*) AS vehicle_count,
  ROUND(AVG(price))::INT AS average_price
FROM owners JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.id HAVING COUNT(*) > 1 AND AVG(price) > 10000
ORDER BY first_name DESC;

