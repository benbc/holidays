MATCH (:Country {name: "United Kingdom"}) -[:IN]- (uk:Town)
MATCH (:Country {name: "India"}) -[:IN]- (other:Town)
MATCH route = (uk) -[:FLIGHT*1..2]-> (other)
RETURN route ORDER BY length(route) LIMIT 10;

MATCH (:Town {name: "Sheffield"}) -[:FLIGHT]-> (town:Town) -[:IN]- (country:Country) 
WITH country, collect(town) as towns RETURN country.name as country, size(towns) as number_of_towns ORDER BY size(towns) DESC LIMIT 6;
