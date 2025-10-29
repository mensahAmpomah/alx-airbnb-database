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
    p.property_id,
    p.name AS property,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rownum
FROM Property p
LEFT JOIN Booking b
    ON p.property_id = b.property_id
GROUP BY
    p.property_id,
    p.name
ORDER BY
    property_rownum;
