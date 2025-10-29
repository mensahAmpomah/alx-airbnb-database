CREATE INDEX idx_user_user_id ON "User"(user_id);

-- Indexes on Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Indexes on Property table
CREATE INDEX idx_property_property_id ON Property(property_id);
CREATE INDEX idx_property_created_at ON Property(created_at);

-- Indexes on Review table
CREATE INDEX idx_review_property_id ON Review(property_id);