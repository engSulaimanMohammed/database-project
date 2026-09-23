USE SkyTrackAirline_DB;

SELECT Flight_Number, Status, Departure_Datetime
FROM FLIGHT
ORDER BY Departure_Datetime ASC;

SELECT *
FROM PASSENGER
ORDER BY Full_Name ASC;

SELECT Registration_Number, Model, Total_Seating_Capacity
FROM AIRCRAFT
ORDER BY Total_Seating_Capacity DESC;

SELECT DISTINCT Class
FROM BOOKING;

SELECT *
FROM FLIGHT
WHERE Status = 'Delayed'
   OR Status = 'Cancelled';

SELECT *
FROM PASSENGER
WHERE Nationality = 'Omani';

SELECT *
FROM AIRPORT
ORDER BY Country ASC;