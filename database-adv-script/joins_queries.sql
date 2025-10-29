-- Write a query using an INNer JOIN to retrieve all bookings and their respective users who made those bookings.

SELECT User.first_name as firstname, User.last_name as lastname, Property.name as Property, Booking.start_date, Booking.end_date FROM Booking

INNER JOIN User on Booking.user_id = User.user_id
INNER JOIN Property on Booking.property_id = Property.property_id


-- Write a query using LEFT JOIN to retrieve all properties and their reviews, Including Properties that have no reviews.

SELECT Property.name as Property, Property.created_at as created, Property.pricepernight as Price, Review.rating, Review.comment 
FROM Property 
LEFT JOIN Review on Property.property_id = Review.review_id
ORDER BY Property.created_at DESC;


-- Write a query using FULL OUTER JOIN to Retrieve all Users and all bookings, even if the user has no booking or a booking is not linked to a user.

SELECT User.first_name as firstname, User.last_name as lastname, User.phone_number, Booking.created_at as created, Booking.end_date as ended, Booking.total_price as price 
FROM User 
FULL OUTER JOIN Booking on User.user_id = Booking.user_id

