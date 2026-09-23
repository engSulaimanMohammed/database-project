USE SkyTrackAirline_DB;

SELECT
    F.Flight_Number,
    O.Name AS Origin_Airport,
    D.Name AS Destination_Airport
FROM FLIGHT F
JOIN AIRPORT O
    ON F.Origin_IATA_Code = O.IATA_Code
JOIN AIRPORT D
    ON F.Destination_IATA_Code = D.IATA_Code;

SELECT
    B.Flight_Number,
    B.Seat_Number,
    B.Class,
    B.Price_Paid,
    P.Full_Name
FROM BOOKING B
JOIN PASSENGER P
    ON B.National_ID = P.National_ID;

SELECT
    C.Full_Name,
    C.Role
FROM CREW_MEMBER C
JOIN FLIGHTCREW FC
    ON C.License_Number = FC.License_Number
JOIN FLIGHT F
    ON FC.Flight_Number = F.Flight_Number
WHERE F.Flight_Number = 'SK101';

SELECT
    F.Flight_Number,
    A.Model
FROM FLIGHT F
JOIN AIRCRAFT A
    ON F.Registration_Number = A.Registration_Number
WHERE F.Status = 'Completed';

SELECT
    P.Full_Name,
    COUNT(B.Flight_Number) AS Total_Bookings
FROM PASSENGER P
LEFT JOIN BOOKING B
    ON P.National_ID = B.National_ID
GROUP BY P.National_ID, P.Full_Name
ORDER BY Total_Bookings DESC;

SELECT
    Class,
    SUM(Price_Paid) AS Total_Revenue
FROM BOOKING
GROUP BY Class;

SELECT
    A.Registration_Number,
    A.Model,
    COUNT(F.Flight_Number) AS Total_Flights
FROM AIRCRAFT A
LEFT JOIN FLIGHT F
    ON A.Registration_Number = F.Registration_Number
GROUP BY A.Registration_Number, A.Model;

SELECT
    F.Flight_Number,
    COUNT(B.National_ID) AS Total_Bookings
FROM FLIGHT F
JOIN BOOKING B
    ON F.Flight_Number = B.Flight_Number
GROUP BY F.Flight_Number
HAVING COUNT(B.National_ID) > 1;

SELECT
    P.Full_Name,
    F.Flight_Number,
    O.Name AS Origin_Airport,
    D.Name AS Destination_Airport,
    B.Class,
    B.Price_Paid
FROM BOOKING B
JOIN PASSENGER P
    ON B.National_ID = P.National_ID
JOIN FLIGHT F
    ON B.Flight_Number = F.Flight_Number
JOIN AIRPORT O
    ON F.Origin_IATA_Code = O.IATA_Code
JOIN AIRPORT D
    ON F.Destination_IATA_Code = D.IATA_Code;