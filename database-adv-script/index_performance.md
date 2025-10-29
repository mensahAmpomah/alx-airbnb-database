Query 1 – Retrieve All Bookings with User and Property Info
EXPLAIN ANALYZE
SELECT 
    u.first_name,
    u.last_name,
    p.name AS property,
    b.start_date,
    b.end_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id;

Query 2 – Retrieve All Properties and Their Reviews
EXPLAIN ANALYZE
SELECT 
    p.name AS property,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;

Query 3 – Retrieve All Properties Ordered by Creation Date
EXPLAIN ANALYZE
SELECT 
    name,
    pricepernight,
    created_at
FROM Property
ORDER BY created_at DESC;