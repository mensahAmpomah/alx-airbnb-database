SELECT 
    p.property_id,
    p.name AS property,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM Property p
LEFT JOIN Booking b
    ON p.property_id = b.property_id
GROUP BY 
    p.property_id,
    p.name
ORDER BY 
    property_rank;


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