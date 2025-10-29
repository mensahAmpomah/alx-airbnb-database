This query uses INNER JOIN to retrieve data only where there are matches between:

Booking.user_id → User.user_id

Booking.property_id → Property.property_id

Result:
A list of all bookings showing which user booked which property and the booking period.


This query uses a LEFT JOIN to include:

All properties, even if they have no reviews.

Result:
A list of all properties and their reviews. For properties without reviews, the review columns (rating, comment) will show NULL.


This query uses a FULL OUTER JOIN to include:

All users (even if they haven’t made a booking)

All bookings (even if not linked to any user)

Result:
A combined view showing all users and all bookings, regardless of their relationship.

