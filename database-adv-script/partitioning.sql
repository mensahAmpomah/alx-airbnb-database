DROP TABLE IF EXISTS Booking CASCADE;


--------------------------------------------------------------
Create Partitioned Booking Table
--------------------------------------------------------------
-- Partitioning strategy: RANGE partitioning by start_date
-- This divides data into partitions based on year ranges

CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (start_date);


--------------------------------------------------------------
Create Partitions
--------------------------------------------------------------
-- Partition data by year for improved query performance
-- (Adjust date ranges as needed based on your dataset)

CREATE TABLE booking_2023 PARTITION OF Booking
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF Booking
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF Booking
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


--------------------------------------------------------------
Test Query Performance (Before and After Partitioning)
--------------------------------------------------------------
-- Measure query speed using EXPLAIN ANALYZE

-- Before partitioning (on non-partitioned table)
-- EXPLAIN ANALYZE SELECT * FROM old_booking WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';

-- After partitioning (on partitioned Booking table)
EXPLAIN ANALYZE
SELECT 
    booking_id,
    user_id,
    property_id,
    start_date,
    end_date,
    total_price
FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';