Primary Keys (PK):
    Each table uses a CHAR(36) field as its primary key to store UUIDs.
    This ensures global uniqueness and avoids ID collisions.

Foreign Keys (FK):
    All relationships are clearly defined:

    Property.host_id → User.user_id

    Booking.property_id → Property.property_id

    Booking.user_id → User.user_id

    Payment.booking_id → Booking.booking_id

    Review.property_id → Property.property_id

    Review.user_id → User.user_id

    Message.sender_id & recipient_id → User.user_id

Constraints:

    ENUM is used for controlled categorical data (like roles, statuses, and payment methods).

    CHECK ensures rating values stay between 1 and 5.

    UNIQUE on email avoids duplicate registrations.

    NOT NULL ensures mandatory data integrity.

Indexes:

    Created on frequently searched columns (email, role, status, location, etc.)

    Improve query performance for joins and filters.

Normalization:

    Schema satisfies Third Normal Form (3NF) — no redundancy, no transitive dependencies.