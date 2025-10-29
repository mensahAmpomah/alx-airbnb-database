Added a WHERE clause
Limited data retrieval to recent bookings only:

WHERE b.created_at >= '2024-01-01'


Created indexes
Improved lookup speed by creating indexes on frequently joined and filtered columns:

Booking.user_id

Booking.property_id

Payment.booking_id

Property.property_id

Reduced the number of selected columns
Selected only columns needed for output to reduce memory use.

Verified improvements using EXPLAIN ANALYZE
Confirmed use of Index Scans and lower query cost.

Optimized Query (After Refactoring)
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
WHERE b.created_at >= '2024-01-01';