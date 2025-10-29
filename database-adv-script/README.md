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


2.
The COUNT(Booking.booking_id) function counts the total number of bookings per user.

GROUP BY groups the results by each user.

A LEFT JOIN is used so users with zero bookings still appear in the results.

ORDER BY total_bookings DESC sorts users by who booked the most.

Result:
A ranked list of all users and how many bookings each has made.


COUNT(Booking.booking_id) counts the total number of bookings per property.

RANK() OVER (ORDER BY COUNT(...) DESC) assigns a rank:

The property with the highest number of bookings is ranked 1.

If two properties have the same booking count, they receive the same rank (ties are allowed).

GROUP BY ensures the count is done per property.

The outer ORDER BY sorts the results by ranking.