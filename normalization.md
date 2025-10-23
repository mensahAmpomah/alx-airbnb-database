Normalize Your Database Design.

User

user_id:  UUID (PK, Indexed)  Unique identifier for each user
first_name: VARCHAR  User’s first name 
last_name:  VARCHAR  User’s last name 
email: VARCHAR (UNIQUE)  User’s email address 
password_hash: VARCHAR  Hashed password 
phone_number : VARCHAR (NULL)  User’s phone number 
role:  ENUM (guest, host, admin)  Defines user role 
created_at : TIMESTAMP  Record creation time 

Property 

property_id: UUID (PK, Indexed)  Unique property identifier 
host_id: UUID (FK → User.user_id)  Owner of the property 
name: VARCHAR  Property name 
description: TEXT Description of the property 
location: VARCHAR  Property location 
pricepernight: DECIMAL  Price per night 
created_at: TIMESTAMP  Record creation time 
updated_at: TIMESTAMP Record update time 

Booking

booking_id: UUID (PK, Indexed) Unique booking identifier
property_id: UUID (FK → Property.property_id) Booked property 
user_id: UUID (FK → User.user_id)  Guest who made the booking 
start_date:  DATE  Start date of the booking 
end_date:  DATE  End date of the booking 
total_price:  DECIMAL  Total booking cost 
status: ENUM (pending, confirmed, canceled)  Booking status 
created_at:  TIMESTAMP  Record creation time 

Payment

payment_id: UUID (PK, Indexed)  Unique payment identifier 
booking_id: UUID (FK → Booking.booking_id) Associated booking 
amount: DECIMAL  Payment amount 
payment_date: TIMESTAMP  Date of payment 
payment_method: ENUM (credit_card, paypal, stripe) Method used for payment 

Review

review_id: UUID (PK, Indexed). Unique review identifier 
property_id: UUID (FK → Property.property_id). Reviewed property.
user_id: UUID (FK → User.user_id). Reviewer 
rating: INTEGER (1–5).Rating given 
comment: TEXT. Review comment 
created_at: TIMESTAMP. Record creation time

Message

message_id: UUID (PK, Indexed). Unique message identifier 
sender_id: UUID (FK → User.user_id). Message sender 
recipient_id: UUID (FK → User.user_id). Message receiver 
message_body: TEXT. Message content
sent_at: TIMESTAMP. Message timestamp 