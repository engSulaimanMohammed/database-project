USE SkyTrackAirline_DB;

SELECT
    F.Flight_Number,
    O.Name AS Origin_Airport,
    D.Name AS Destination_Airport,
    A.Model,
    COUNT(B.National_ID) AS Total_Passengers
FROM FLIGHT F
JOIN AIRPORT O
    ON F.Origin_IATA_Code = O.IATA_Code
JOIN AIRPORT D
    ON F.Destination_IATA_Code = D.IATA_Code
JOIN AIRCRAFT A
    ON F.Registration_Number = A.Registration_Number
LEFT JOIN BOOKING B
    ON F.Flight_Number = B.Flight_Number
GROUP BY
    F.Flight_Number,
    O.Name,
    D.Name,
    A.Model;


SELECT
    P.Full_Name
FROM PASSENGER P
LEFT JOIN BOOKING B
    ON P.National_ID = B.National_ID
WHERE B.National_ID IS NULL;


SELECT
    F.Flight_Number,
    SUM(B.Price_Paid) AS Total_Revenue
FROM FLIGHT F
JOIN BOOKING B
    ON F.Flight_Number = B.Flight_Number
GROUP BY F.Flight_Number
HAVING SUM(B.Price_Paid) > 500
ORDER BY Total_Revenue DESC;


SELECT
    C.Full_Name,
    COUNT(FC.Flight_Number) AS Total_Flights
FROM CREW_MEMBER C
JOIN FLIGHTCREW FC
    ON C.License_Number = FC.License_Number
GROUP BY
    C.License_Number,
    C.Full_Name
HAVING COUNT(FC.Flight_Number) > 1;


SELECT
    F.Flight_Number,
    AVG(B.Price_Paid) AS Average_Price
FROM FLIGHT F
JOIN BOOKING B
    ON F.Flight_Number = B.Flight_Number
GROUP BY F.Flight_Number
HAVING AVG(B.Price_Paid) >
(
    SELECT AVG(Price_Paid)
    FROM BOOKING
);


SELECT TOP 1
    F.Flight_Number,
    O.Name AS Origin_Airport,
    D.Name AS Destination_Airport,
    COUNT(B.National_ID) AS Total_Bookings
FROM FLIGHT F
JOIN AIRPORT O
    ON F.Origin_IATA_Code = O.IATA_Code
JOIN AIRPORT D
    ON F.Destination_IATA_Code = D.IATA_Code
JOIN BOOKING B
    ON F.Flight_Number = B.Flight_Number
GROUP BY
    F.Flight_Number,
    O.Name,
    D.Name
ORDER BY Total_Bookings DESC;


SELECT
    Class,
    SUM(Price_Paid) AS Total_Revenue,
    COUNT(*) AS Number_Of_Bookings,
    AVG(Price_Paid) AS Average_Price,
    MAX(Price_Paid) AS Highest_Price,
    MIN(Price_Paid) AS Lowest_Price
FROM BOOKING
GROUP BY Class;


SELECT
    P.Full_Name,
    F.Flight_Number,
    B.Booking_Date
FROM PASSENGER P
JOIN BOOKING B
    ON P.National_ID = B.National_ID
JOIN FLIGHT F
    ON B.Flight_Number = F.Flight_Number
WHERE F.Status = 'Cancelled';


SELECT
    F.Flight_Number,
    COUNT(FC.License_Number) AS Total_Crew,
    F.Departure_Datetime
FROM FLIGHT F
JOIN FLIGHTCREW FC
    ON F.Flight_Number = FC.Flight_Number
JOIN CREW_MEMBER C
    ON FC.License_Number = C.License_Number
GROUP BY
    F.Flight_Number,
    F.Departure_Datetime
HAVING
    SUM(CASE WHEN C.Role = 'Pilot' THEN 1 ELSE 0 END) >= 1
    AND
    SUM(CASE WHEN C.Role = 'Flight Attendant' THEN 1 ELSE 0 END) >= 1;


SELECT
    F.Flight_Number,
    O.City AS Origin_City,
    D.City AS Destination_City,
    A.Model,
    A.Manufacturer,
    ISNULL(B.Total_Passengers, 0) AS Total_Passengers,
    ISNULL(C.Total_Crew, 0) AS Total_Crew,
    ISNULL(B.Total_Revenue, 0) AS Total_Revenue
FROM FLIGHT F
JOIN AIRPORT O
    ON F.Origin_IATA_Code = O.IATA_Code
JOIN AIRPORT D
    ON F.Destination_IATA_Code = D.IATA_Code
JOIN AIRCRAFT A
    ON F.Registration_Number = A.Registration_Number
LEFT JOIN
(
    SELECT
        Flight_Number,
        COUNT(*) AS Total_Passengers,
        SUM(Price_Paid) AS Total_Revenue
    FROM BOOKING
    GROUP BY Flight_Number
) B
    ON F.Flight_Number = B.Flight_Number
LEFT JOIN
(
    SELECT
        Flight_Number,
        COUNT(*) AS Total_Crew
    FROM FLIGHTCREW
    GROUP BY Flight_Number
) C
    ON F.Flight_Number = C.Flight_Number
ORDER BY Total_Revenue DESC;