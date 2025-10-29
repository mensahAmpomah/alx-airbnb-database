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


1.

→ Finds all properties that have an average rating greater than 4.0.

The outer query:
→ Selects details (name, pricepernight, created_at) from the Property table only for those properties found in the inner subquery.

Result:
A list of properties with an average review rating above 4.0.

This is a correlated subquery because the inner query depends on the outer query’s user_id.


counts how many bookings that specific user has made.

The outer query only returns users where that count is greater than 3.

Result:
A list of users who have made more than three bookings.