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

-- Query 2: Retrieve all properties and their reviews
EXPLAIN ANALYZE
SELECT 
    p.name AS property,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;

-- Query 3: Retrieve properties ordered by creation date
EXPLAIN ANALYZE
SELECT 
    name,
    pricepernight,
    created_at
FROM Property
ORDER BY created_at DESC;


-- User table
CREATE INDEX idx_user_user_id ON "User"(user_id);

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Property table
CREATE INDEX idx_property_property_id ON Property(property_id);
CREATE INDEX idx_property_created_at ON Property(created_at);

-- Review table
CREATE INDEX idx_review_property_id ON Review(property_id);