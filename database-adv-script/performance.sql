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
 Performance Analysis (Expected Issues)
--------------------------------------------------------------
-- • Sequential scans on large tables (Booking, Property, Payment)
-- • Multiple JOINs increasing cost and memory usage
-- • No WHERE clause, returning too many rows
-- • Missing indexes on frequently joined columns


--------------------------------------------------------------
Optimized Query (After Refactoring)
--------------------------------------------------------------
-- Optimization Techniques:
-- • Used WHERE clause to limit data range
-- • Selected only necessary columns
-- • Relied on indexed columns (user_id, property_id, booking_id)
-- • Reduced redundant joins

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
WHERE b.created_at >= '2024-01-01';
