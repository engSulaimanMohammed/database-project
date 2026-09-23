USE SkyTrackAirline_DB;

INSERT INTO AIRPORT
(IATA_Code, Name, City, Country)
VALUES
('MCT', 'Muscat International Airport', 'Muscat', 'Oman'),
('DXB', 'Dubai International Airport', 'Dubai', 'United Arab Emirates'),
('DOH', 'Hamad International Airport', 'Doha', 'Qatar'),
('JED', 'King Abdulaziz International Airport', 'Jeddah', 'Saudi Arabia'),
('CAI', 'Cairo International Airport', 'Cairo', 'Egypt');



INSERT INTO AIRCRAFT
(Registration_Number, Model, Manufacturer,
 Total_Seating_Capacity, Year_of_Manufacture)
VALUES
('SK-A001', '737-800', 'Boeing', 162, 2018),
('SK-A002', 'A320neo', 'Airbus', 180, 2020),
('SK-A003', 'E190-E2', 'Embraer', 114, 2021),
('SK-A004', 'ATR 72-600', 'ATR', 72, 2019),
('SK-A005', 'CRJ900', 'Bombardier', 90, 2017),
('SK-A006', 'A220-300', 'Airbus', 145, 2022),
('SK-A007', '737 MAX 8', 'Boeing', 178, 2023),
('SK-A008', 'E195-E2', 'Embraer', 132, 2021);




INSERT INTO PASSENGER
(National_ID, Full_Name, Email, Phone,
 Nationality, Date_of_Birth)
VALUES
('OM10001', 'Sulaiman Al Hinai',
 'sulaiman.hinai@example.com',
 '+96892110001', 'Omani', '1995-04-12'),

('AE10002', 'Mohammed Al Mansoori',
 'mohammed.mansoori@example.com',
 '+97150100002', 'Emirati', '1992-07-21'),

('QA10003', 'Khalid Al Kuwari',
 'khalid.kuwari@example.com',
 '+97455100003', 'Qatari', '1998-11-08'),

('SA10004', 'Abdullah Al Qahtani',
 'abdullah.qahtani@example.com',
 '+96650100004', 'Saudi', '1990-02-18'),

('EG10005', 'Ahmed Hassan',
 'ahmed.hassan@example.com',
 '+20100100005', 'Egyptian', '1996-06-30'),

('KW10006', 'Yousef Al Sabah',
 'yousef.sabah@example.com',
 '+96555100006', 'Kuwaiti', '1994-09-14'),

('BH10007', 'Mariam Al Khalifa',
 'mariam.khalifa@example.com',
 '+97333100007', 'Bahraini', '1989-12-03'),

('JO10008', 'Omar Al Khatib',
 'omar.khatib@example.com',
 '+96279100008', 'Jordanian', '1997-03-25');


 INSERT INTO CREW_MEMBER
(Full_Name, Role, License_Number)
VALUES
('Ahmed Al Harthy', 'Pilot', 'LIC-P1001'),
('Khalid Al Balushi', 'Pilot', 'LIC-P1002'),
('Said Al Maawali', 'Co-Pilot', 'LIC-C1003'),
('Mariam Al Hinai', 'Flight Attendant', 'LIC-F1004'),
('Noor Al Riyami', 'Flight Attendant', 'LIC-F1005'),
('Yousef Al Lawati', 'Engineer', 'LIC-E1006');




INSERT INTO FLIGHT
(Flight_Number,
 Departure_Datetime,
 Arrival_Datetime,
 Status,
 Registration_Number,
 Origin_IATA_Code,
 Destination_IATA_Code)
VALUES

('SK101',
 '2026-10-01 08:00:00',
 '2026-10-01 09:15:00',
 'Scheduled',
 'SK-A001',
 'MCT',
 'DXB'),

('SK102',
 '2026-10-02 10:00:00',
 '2026-10-02 11:20:00',
 'Delayed',
 'SK-A002',
 'DXB',
 'DOH'),

('SK103',
 '2026-10-03 12:00:00',
 '2026-10-03 14:30:00',
 'Cancelled',
 'SK-A003',
 'DOH',
 'JED'),

('SK104',
 '2026-10-04 07:30:00',
 '2026-10-04 09:40:00',
 'Completed',
 'SK-A004',
 'JED',
 'CAI'),

('SK105',
 '2026-10-05 15:00:00',
 '2026-10-05 18:20:00',
 'Scheduled',
 'SK-A005',
 'CAI',
 'MCT'),

('SK106',
 '2026-10-06 18:00:00',
 '2026-10-06 19:30:00',
 'Delayed',
 'SK-A006',
 'MCT',
 'DOH'),

('SK107',
 '2026-10-07 09:00:00',
 '2026-10-07 11:45:00',
 'Completed',
 'SK-A007',
 'DXB',
 'JED'),

('SK108',
 '2026-10-08 13:30:00',
 '2026-10-08 16:20:00',
 'Scheduled',
 'SK-A008',
 'DOH',
 'CAI');




 INSERT INTO BOOKING
(National_ID,
 Flight_Number,
 Seat_Number,
 Class,
 Price_Paid,
 Booking_Date)
VALUES

('OM10001', 'SK101', '12A',
 'Economy', 120.00, '2026-09-20'),

('AE10002', 'SK101', '3B',
 'Business', 280.00, '2026-09-20'),

('QA10003', 'SK101', '1A',
 'First', 450.00, '2026-09-20'),

('SA10004', 'SK102', '14C',
 'Economy', 135.00, '2026-09-21'),

('EG10005', 'SK102', '5A',
 'Business', 310.00, '2026-09-21'),

('KW10006', 'SK103', '16D',
 'Economy', 150.00, '2026-09-21'),

('BH10007', 'SK104', '2C',
 'First', 520.00, '2026-09-22'),

('JO10008', 'SK105', '8B',
 'Business', 295.00, '2026-09-22'),

('OM10001', 'SK106', '18A',
 'Economy', 140.00, '2026-09-23'),

('QA10003', 'SK107', '4D',
 'Business', 325.00, '2026-09-23');



 INSERT INTO FLIGHTCREW
(Flight_Number, License_Number)
VALUES

/* SK101 */
('SK101', 'LIC-P1001'),
('SK101', 'LIC-F1004'),
('SK101', 'LIC-C1003'),

/* SK102 */
('SK102', 'LIC-P1002'),
('SK102', 'LIC-F1005'),
('SK102', 'LIC-E1006'),

/* SK103 */
('SK103', 'LIC-P1001'),
('SK103', 'LIC-F1004'),

/* SK104 */
('SK104', 'LIC-P1002'),
('SK104', 'LIC-F1005'),

/* SK105 */
('SK105', 'LIC-P1001'),
('SK105', 'LIC-F1004'),

/* SK106 */
('SK106', 'LIC-P1002'),
('SK106', 'LIC-F1005'),

/* SK107 */
('SK107', 'LIC-P1001'),
('SK107', 'LIC-F1005'),
('SK107', 'LIC-E1006'),

/* SK108 */
('SK108', 'LIC-P1002'),
('SK108', 'LIC-F1004'),
('SK108', 'LIC-C1003');




SELECT * FROM AIRPORT;
SELECT * FROM AIRCRAFT;
SELECT * FROM PASSENGER;
SELECT * FROM CREW_MEMBER;
SELECT * FROM FLIGHT;
SELECT * FROM BOOKING;
SELECT * FROM FLIGHTCREW;


