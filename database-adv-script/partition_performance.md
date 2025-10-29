Implementation Steps

1. Dropped existing `Booking` table.  
2. Recreated it with **RANGE partitioning** on the `start_date` column.  
3. Created partitions for each year:
   - `booking_2023`
   - `booking_2024`
   - `booking_2025`
4. Tested query performance using `EXPLAIN ANALYZE` before and after partitioning.

---

 Test Query


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