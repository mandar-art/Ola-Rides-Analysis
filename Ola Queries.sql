CREATE DATABASE OLA;
USE OLA;

SELECT * FROM BOOKINGS;
SELECT COUNT(*) AS 'TOTAL_BOOKINGS' FROM BOOKINGS;     #TOTAL: 103024

SELECT BOOKING_STATUS, COUNT(*) AS 'TOTAL_RIDES' FROM BOOKINGS
group by 1 order by 2 DESC;

SELECT BOOKING_STATUS, sum(booking_value) AS 'TOTAL_RIDES' FROM BOOKINGS
group by 1 order by 2 DESC;

-- Q1 Retrive all successful bookings
CREATE VIEW SUCCESS AS 
SELECT * FROM BOOKINGS WHERE BOOKING_STATUS = 'SUCCESS';

SELECT * FROM SUCCESS;                            

-- Q2. Total Incomplete rides out of successful rides
SELECT * FROM SUCCESS WHERE INCOMPLETE_RIDES = 'YES';
SELECT COUNT(*) FROM SUCCESS WHERE INCOMPLETE_RIDES = 'YES';    #INCOMPLETE: 3926

-- And reason wise count of incomplete rides
SELECT INCOMPLETE_RIDES_REASON, COUNT(*) AS '_COUNT'
FROM SUCCESS WHERE INCOMPLETE_RIDES = 'YES' 
group by 1 order by 2 DESC;

-- Time wise count of incomplete rides
SELECT Hour, COUNT(*) AS '_COUNT'
FROM SUCCESS WHERE INCOMPLETE_RIDES = 'YES' 
group by 1 order by 2 DESC;

-- Booking value of incomplete rides
SELECT SUM(BOOKING_VALUE) FROM SUCCESS WHERE INCOMPLETE_RIDES = 'YES';    #22,50,482

-- Q3. Retrieve Successful and Complete rides
CREATE VIEW COMPLETE AS
SELECT * FROM SUCCESS WHERE INCOMPLETE_RIDES = 'NO';

SELECT * FROM COMPLETE;

-- Total booking value of complete and successful rides
SELECT SUM(BOOKING_VALUE) FROM COMPLETE;          #3,28,29,985

-- Avg ride distance
SELECT avg(ride_distance) FROM COMPLETE;          #22.82

-- Q4 Find the average ride distance for each vehicle type
SELECT VEHICLE_TYPE, AVG(RIDE_DISTANCE) AS 'AVG_DISTANCE' FROM BOOKINGS
group by 1 order by 2 DESC;

-- Q5 Get the total number of canceled rides
CREATE VIEW CANCELLED AS
SELECT * FROM BOOKINGS WHERE BOOKING_STATUS IN ('Canceled by Driver', 'Canceled by Customer', 'Drive Not Found');

select * from cancelled;

-- Time wise count
select HOUR, COUNT(*) FROM CANCELLED group by 1;

-- Count by each reason
SELECT Canceled_Rides_by_Customer, COUNT(*) FROM CANCELLED group by 1 order by 2 DESC LIMIT 5 OFFSET 1;
SELECT Canceled_Rides_by_DRIVER, COUNT(*) FROM CANCELLED group by 1 order by 2 DESC LIMIT 4 OFFSET 1;

-- Booking value by each reason
SELECT SUM(BOOKING_VALUE) FROM CANCELLED;      #1,59,54,328
SELECT Canceled_Rides_by_Customer, SUM(BOOKING_VALUE) FROM CANCELLED group by 1 order by 2 DESC LIMIT 5 OFFSET 1;
SELECT Canceled_Rides_by_DRIVER, SUM(BOOKING_VALUE) FROM CANCELLED group by 1 order by 2 DESC LIMIT 4 OFFSET 1;

-- Q6 list the top 5 customer who booked the highest number of rides;
SELECT CUSTOMER_ID, COUNT(*) AS 'TOTAL_RIDES' FROM BOOKINGS
group by 1 order by 2 DESC LIMIT 5;

-- list the top 5 customer who CANCELLED the highest number of rides;
SELECT CUSTOMER_ID, COUNT(*) AS 'TOTAL_RIDES' FROM CANCELLED WHERE BOOKING_STATUS = 'Canceled by Customer' 
group by 1 order by 2 DESC LIMIT 5;
-- list the top 5 customer whose rides CANCELLED by driver;
SELECT CUSTOMER_ID, COUNT(*) AS 'TOTAL_RIDES' FROM CANCELLED WHERE BOOKING_STATUS = 'Canceled by Driver' 
group by 1 order by 2 DESC LIMIT 5;

-- Q7. Vehicle type wise Rating
SELECT VEHICLE_TYPE, ROUND(AVG(CUSTOMER_RATING), 2) AS 'AVG_RAT', 
MAX(CUSTOMER_RATING) AS 'MAX_RAT', MIN(CUSTOMER_RATING) AS 'MIN_RAT' FROM SUCCESS group by 1 order by 2 DESC;

SELECT VEHICLE_TYPE, ROUND(AVG(DRIVER_RATINGS), 2) AS 'AVG_RAT', 
MAX(DRIVER_RATINGS) AS 'MAX_RAT', MIN(DRIVER_RATINGS) AS 'MIN_RAT' FROM SUCCESS group by 1 order by 2 DESC;

-- Q8. Payment method distributiom
SELECT PAYMENT_METHOD, SUM(BOOKING_VALUE) AS 'AMOUNT' FROM SUCCESS group by 1 order by 2 DESC;

SELECT PAYMENT_METHOD, ROUND(SUM(BOOKING_VALUE)*100/ (SELECT SUM(BOOKING_VALUE) FROM SUCCESS), 2) AS
'DISTRIBUTION'
FROM SUCCESS group by 1 order by 2 DESC;

-- Q9 Vehicle wise booking value
SELECT VEHICLE_TYPE, count(*) as 'Total_rides', sum(booking_value) as 'Total_amount', 
avg(booking_value) as 'Avg_amount' FROM SUCCESS group by 1 order by 3 DESC;