# SkyTrack Airline System

## Project Description

SkyTrack Airline System is a database project designed to manage the core operations of a regional airline.

The system manages:

- Airports
- Aircraft
- Flights
- Passengers
- Bookings
- Crew Members
- Flight Crew Assignments

## ERD Summary

The main entities in the system are:

- Airport
- Aircraft
- Flight
- Passenger
- Crew Member

Each flight is assigned to one aircraft.

Each flight has:

- One origin airport
- One destination airport

Passenger and Flight are connected through Booking.

Booking stores:

- Seat Number
- Class
- Price Paid
- Booking Date

Crew Member and Flight have a many-to-many relationship.

The FlightCrew table is used to manage this relationship.

## Mapping Decisions

The Airport IATA Code is used to identify each airport.

The Aircraft Registration Number is used to identify each aircraft.

The Flight Number is used to identify each flight.

The Passenger National ID is used to identify each passenger.

The Crew Member License Number is used to identify each crew member.

The Flight table contains:

- Registration Number
- Origin IATA Code
- Destination IATA Code

Booking connects Passenger and Flight.

FlightCrew connects Crew Member and Flight.

## Errors Faced

No INSERT or DELETE errors were documented in the final version of the project.

## WHERE vs HAVING

WHERE is used to filter rows before GROUP BY.

HAVING is used to filter groups after GROUP BY.

## Most Useful Query

The complete flight summary query was the most useful query because it combines the most important flight information in one result.

It displays:

- Flight Number
- Origin City
- Destination City
- Aircraft Model
- Aircraft Manufacturer
- Total Passengers
- Total Crew
- Total Revenue
