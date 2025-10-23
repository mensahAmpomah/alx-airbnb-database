Inserting Data into user table.


INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
(UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashedpassword1', '+233201234567', 'guest', NOW()),


Inserting data into Booking table.


INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
(UUID(),
    (SELECT property_id FROM Property WHERE name = 'Ocean View Apartment'),
    (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
    '2025-11-10', '2025-11-15', 400.00, 'confirmed', NOW()),


Inserting into Payment table

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
(UUID(),
    (SELECT booking_id FROM Booking WHERE status = 'confirmed'),
    400.00, NOW(), 'credit_card');


Inserting into Review table 

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
(UUID(),
    (SELECT property_id FROM Property WHERE name = 'Ocean View Apartment'),
    (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
    5, 'Amazing stay! The view was breathtaking.', NOW()),

(UUID(),
    (SELECT property_id FROM Property WHERE name = 'Mountain Retreat'),
    (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
    4, 'Nice place, very relaxing but the road was a bit rough.', NOW());


Inserting data into Message table .......


INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
(UUID(),
    (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
    (SELECT user_id FROM User WHERE email = 'sarah.smith@example.com'),
    'Hi Sarah, I’d like to confirm my stay at your Ocean View Apartment.', NOW()),

(UUID(),
    (SELECT user_id FROM User WHERE email = 'sarah.smith@example.com'),
    (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
    'Sure John, your booking has been confirmed. Looking forward to hosting you!', )