Step 1: Monitor Query Performance

Used SQL performance analysis tools to inspect execution times and detect bottlenecks:

Example Commands:
sql
PostgreSQL
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    b.start_date,
    b.end_date
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2024-01-01' AND '2024-06-30';

MySQL alternative
SHOW PROFILE FOR QUERY 1;


Step 2: Identify Bottlenecks

Query	  	   
Bookings with user and property joins		
Review and property join	
Frequent user lookup		

Issue Detected
Full table scan on Booking
No index on user_id
No index on property_id

Observations.
Repeated sequential scans
Filtering by start_date was slow	
High join cost


Suggested Changes

To improve query performance:

Add Indexes

CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);


Adjust Schema

Partition the Booking table by start_date to limit scan range.

Ensure foreign key columns (user_id, property_id) are indexed.

Refactor Queries

Replace SELECT * with explicit columns.

Use appropriate date filtering and limit results when possible.