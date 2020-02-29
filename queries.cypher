MATCH (:Country {name: "United Kingdom"}) -[:IN]- (uk:City)
MATCH (:Country {name: "India"}) -[:IN]- (other:City)
MATCH route = (uk) -[:IN]- (:Airport) -[:FLIGHT*1..2]-> (:Airport) -[:IN]- (other)
RETURN route ORDER BY length(route) LIMIT 10;

MATCH (:City {name: "Sheffield"}) -[:IN]- (:Airport) -[:FLIGHT]-> (:Airport) -[:IN]- (city:City) -[:IN]- (country:Country) 
WITH country, collect(city) as cities
RETURN country.name as country, size(cities) as number_of_cities
ORDER BY size(cities) DESC LIMIT 6;