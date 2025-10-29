Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT 
    User.user_id,
    User.first_name AS firstname,
    User.last_name AS lastname,
    COUNT(Booking.booking_id) AS total_bookings
FROM User
LEFT JOIN Booking 
    ON User.user_id = Booking.user_id
GROUP BY 
    User.user_id, 
    User.first_name, 
    User.last_name
ORDER BY 
    total_bookings DESC;


Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.


SELECT 
    Property.property_id,
    Property.name AS Property,
    COUNT(Booking.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS property_rank
FROM Property
LEFT JOIN Booking 
    ON Property.property_id = Booking.property_id
GROUP BY 
    Property.property_id, 
    Property.name
ORDER BY 
    property_rank;
