Initial Query (Before Optimization)
--------------------------------------------------------------
-- Retrieve all bookings along with user details, property details,
-- and payment details.

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.pricepernight,
    pay.amount,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id;


--------------------------------------------------------------
Performance Analysis (Identified Issues)
--------------------------------------------------------------
-- • Sequential scans on Booking, Property, and Payment tables
-- • No WHERE clause — retrieves too many rows
-- • Missing indexes on frequently joined columns
-- • High query cost and execution time


--------------------------------------------------------------
Optimized Query (After Refactoring)
--------------------------------------------------------------
-- Optimization Steps:
--   • Added WHERE clause with multiple conditions (using AND)
--   • Used indexed columns in joins
--   • Selected only relevant columns

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.created_at >= '2024-01-01'
AND pay.amount > 0;
