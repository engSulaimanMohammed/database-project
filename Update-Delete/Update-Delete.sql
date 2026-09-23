USE SkyTrackAirline_DB;


/*UPDATE*/

UPDATE FLIGHT
SET Status = 'Completed'
WHERE Flight_Number = 'SK101';


UPDATE FLIGHT
SET Status = 'Cancelled'
WHERE Flight_Number = 'SK102';


UPDATE BOOKING
SET Price_Paid = Price_Paid * 1.10
WHERE Class = 'Economy';


UPDATE PASSENGER
SET Phone = '+96899112233'
WHERE National_ID = 'OM10001';


UPDATE CREW_MEMBER
SET Role = 'Engineer'
WHERE License_Number = 'LIC-C1003';



/* DELETE 1  Delete one cancelled flight */

SELECT *
FROM FLIGHT
WHERE Flight_Number = 'SK103';


DELETE FROM FLIGHT
WHERE Flight_Number = 'SK103';



/* DELETE 2 Delete one booking linked to a cancelled flight  */

SELECT *
FROM BOOKING
WHERE Flight_Number = 'SK102'
AND National_ID = 'SA10004';


DELETE FROM BOOKING
WHERE Flight_Number = 'SK102'
AND National_ID = 'SA10004';



/*  DELETE 3 Try to delete a passenger with existing bookings */

SELECT *
FROM PASSENGER
WHERE National_ID = 'OM10001';


SELECT *
FROM BOOKING
WHERE National_ID = 'OM10001';


DELETE FROM PASSENGER
WHERE National_ID = 'OM10001';






/*  DISPLAY DAT  */

SELECT * FROM AIRPORT;
SELECT * FROM AIRCRAFT;
SELECT * FROM PASSENGER;
SELECT * FROM CREW_MEMBER;
SELECT * FROM FLIGHT;
SELECT * FROM BOOKING;
SELECT * FROM FLIGHTCREW;