create database Ola;

use Ola;

select *
from bookings;

create view Successful_Bookings as select * 
from bookings
where Booking_Status = 'Success';

# 1. Retrieve all successful bookings:
select * 
from Successful_Bookings;

create view ride_distance_for_each_vehicle as
select Vehicle_Type, AVG(Ride_Distance) as avg_distance
from bookings
group by Vehicle_Type;

# 2. Find the average ride distance for each vehicle type:
select * 
from  ride_distance_for_each_vehicle ;

create view cancelled_rides_by_customers as
select count(*)
from bookings
where Booking_Status = 'Cancelled by Customer'; 

# 3. Get the total number of cancelled rides by customers:
select *
from cancelled_rides_by_customers;

create view top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides 
from bookings
group by Customer_ID 
order by total_rides desc
limit 5;

# 4. List the top 5 customers who booked the highest number of rides:
select * 
from top_5_customers;

create view rides_cancelled_by_drivers_p_c_issues as
select count(*)
from bookings
where Canceled_Rides_by_Driver = 'personal & car-related issues';

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * 
from rides_cancelled_by_drivers_p_c_issues;

create view  max_min_driver_rating as
select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_ratings
from bookings 
where Vehicle_Type = 'Prime Sedan';

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * 
from max_min_driver_rating;

create view upi_payment as
select *
from bookings
where Payment_Method = 'UPI';

# 7. Retrieve all rides where payment was made using UPI:
select *
from upi_payment;

create view avg_cust_rating as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating 
from bookings
group by Vehicle_Type;

# 8. Find the average customer rating per vehicle type:
select * 
from avg_cust_rating;

create view total_successful_ride_value as
select sum(Booking_Value) as total_successful_ride_value
from bookings
where Booking_Status = 'Successful';

# 9. Calculate the total booking value of rides completed successfully:
select *
from total_successful_ride_value;


create view Incomplete_Rides_Reason  as
select Booking_ID, Incomplete_Rides_Reason 
from bookings
where Incomplete_Rides = 'Yes';

# 10. List all incomplete rides along with the reason:
select * 
from Incomplete_Rides_Reason;


