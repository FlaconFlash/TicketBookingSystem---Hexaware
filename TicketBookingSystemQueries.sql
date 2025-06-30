create database TicketBookingApplication
use TicketBookingApplication



--creating venue table 
create table Venue(
venue_id int primary key ,
venue_name varchar(40),
address varchar(80)
)
select * from Venue
--creating customer table
create table CustomersTable(
customer_id int primary key,
customer_name varchar(20),
email varchar(30),
phone_number varchar(12)
)

--creating event table 
create table EventsTable(
event_id int primary key,
event_name varchar(20),
event_date date,
event_time time,
venue_id int,
total_seats int,
available_seats int,
ticket_price decimal,
event_type varchar(20) check (event_type IN ('Movie', 'Sports', 'Concert'))
foreign key (venue_id) references Venue
)
--creating booking table 
create table BookingsTable(
booking_id int primary key,
customer_id int,
event_id int,
num_tickets int,
total_cost int ,
booking_date date,
foreign key (customer_id) references CustomersTable(customer_id),
foreign key (event_id) references EventsTable(event_id)
)
---------------------------------------------------------------------------------------------------------
---day2 assignment

--1.Write a SQL query to insert at least 10 sample records into each table.
INSERT INTO Venue VALUES
(1, 'Skyline Arena', '123 Maple Ave, New York, USA'),
(2, 'Star Dome', '89 Moonlight Blvd, LA, USA'),
(3, 'Harmony Hall', '77 Rhythm Road, Nashville, USA'),
(4, 'Neon Grounds', '404 Tech Lane, Tokyo, Japan'),
(5, 'Cricket Oval', '50 Boundary Rd, Mumbai, India'),
(6, 'Sunset Theatre', '66 West Ave, Austin, USA'),
(7, 'Stadium X', '800 Main Blvd, Berlin, Germany'),
(8, 'Royal Opera House', '1 Aria Street, London, UK'),
(9, 'Palace Grounds', '22 Majesty Blvd, Bangalore, India'),
(10, 'Open Sky Amphitheatre', '777 Canyon Rd, Denver, USA');




INSERT INTO CustomersTable VALUES
(1, 'Vishal', 'vishal@example.com', '9876543210'),
(2, 'Aanya', 'aanya@example.com', '9123456789'),
(3, 'Kabir', 'kabir@example.com', '9090909090'),
(4, 'Meera', 'meera@example.com', '9345612345'),
(5, 'Tanmay', 'tanmay@example.com', '9789123456'),
(6, 'Neha', 'neha@example.com', '8899776655'),
(7, 'Arjun', 'arjun@example.com', '9988776655'),
(8, 'Sara', 'sara@example.com', '9786234511'),
(9, 'Ravi', 'ravi@example.com', '9456123789'),
(10, 'Priya', 'priya@example.com', '9678123450');




INSERT INTO EventsTable VALUES
(1, 'Jazz Night', '2025-06-10', '19:00:00', 1, 200, 150, 100.00, 'Concert'),
(2, 'Football Finals', '2025-07-15', '18:30:00', 2, 500, 300, 250.00, 'Sports'),
(3, 'Classic Movie', '2025-07-20', '21:00:00', 3, 150, 150, 80.00, 'Movie'),
(4, 'Symphony Gala', '2024-09-12', '20:00:00', 4, 300, 280, 150.00, 'Concert'),
(5, 'Basketball Clash', '2024-10-01', '19:30:00', 5, 400, 390, 220.00, 'Sports'),
(6, 'Indie Film Fest', '2025-11-18', '20:15:00', 6, 250, 245, 90.00, 'Movie'),
(7, 'Rock Mania', '2025-08-01', '20:00:00', 7, 500, 400, 175.00, 'Concert'),
(8, 'Cricket League', '2025-08-21', '17:30:00', 5, 700, 700, 300.00, 'Sports'),  -- No bookings
(9, 'Opera Night', '2025-09-07', '18:45:00', 8, 320, 290, 190.00, 'Concert'),
(10,'Open Air Cinema', '2025-08-12', '20:45:00', 10, 200, 180, 120.00, 'Movie');




INSERT INTO BookingsTable VALUES
(101, 1, 1, 2, 200.00, '2025-06-01'),
(102, 2, 1, 3, 300.00, '2025-06-05'),
(103, 3, 2, 4, 1000.00, '2025-07-10'),
(104, 4, 2, 5, 1250.00, '2025-07-11'),
(105, 5, 4, 1, 150.00, '2024-09-10'),
(106, 1, 5, 2, 440.00, '2024-10-01'),
(107, 6, 7, 3, 525.00, '2025-08-01'),
(108, 7, 9, 2, 380.00, '2025-09-07'),
(109, 8, 10, 1, 120.00, '2025-08-12'),
(110, 9, 6, 2, 180.00, '2025-11-18');



--2. Write a SQL query to list all Events.
select * from EventsTable

--3. Write a SQL query to select events with available tickets.
select * from EventsTable 
where available_seats != 0

--4. Write a SQL query to select events name partial match with ‘cup’
select * from EventsTable
where event_name like '%cup%'

--5. Write a SQL query to select events with ticket price range is between 1000 to 2500
select * from EventsTable
where ticket_price between 100 and 250

--6. Write a SQL query to retrieve events with dates falling within a specific range.
select * from EventsTable
where event_date > '2025-08-25'

--7. Write a SQL query to retrieve events with available tickets that also have "Concert" in their name.
select *
from EventsTable
where 
available_seats != 0 and event_name like '%Match%'

--8. Write a SQL query to retrieve users in batches of 5, starting from the 6th user.


--9. Write a SQL query to retrieve bookings details contains booked no of ticket more than 4.
select * from BookingsTable 
where num_tickets >= 4

--10. Write a SQL query to retrieve customer information whose phone number end with ‘000’
select * from CustomersTable
where phone_number like '%789'

--11. Write a SQL query to retrieve the events in order whose seat capacity more than 15000.
select * from EventsTable
where total_seats > 300
order by total_seats

--12. Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’
select * from EventsTable
where event_name not like 'c%' and
event_name not like 'f%' and
event_name not like 't%'


--------------------------------------------------------------------------------------------------------

--Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:

--1. Write a SQL query to List Events and Their Average Ticket Prices
select event_name,avg(ticket_price) as avg_price
from EventsTable
group by event_name

select event_type,avg(ticket_price) as avg_price
from EventsTable
group by event_type

--2. Write a SQL query to Calculate the Total Revenue Generated by Events
select sum(total_cost) as TotalRevenue
from BookingsTable

select * from BookingsTable

--3. Write a SQL query to find the event with the highest ticket sales.
select top 1 *
from BookingsTable
order by num_tickets desc


--4. Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event.
select b.customer_id,b.num_tickets,e.event_name
from BookingsTable as b
join EventsTable as e
on b.event_id = e.event_id

select sum(b.num_tickets),e.event_type
from BookingsTable as b
join EventsTable as e
on b.event_id = e.event_id
group by e.event_type

--5. Write a SQL query to Find Events with No Ticket Sales.
select event_name
from EventsTable
where available_seats = total_seats

--6.6. Write a SQL query to Find the User Who Has Booked the Most Tickets.
select top 1 c.customer_name , b.num_tickets
from CustomersTable as c 
join BookingsTable as b 
on c.customer_id = b.customer_id
order by b.num_tickets desc

--7. Write a SQL query to List Events and the total number of tickets sold for each month.
select e.event_name,count(b.num_tickets) over (partition by month(booking_date))
from EventsTable as e
join BookingsTable as b
on e.event_id = b.event_id

--8. Write a SQL query to calculate the average Ticket Price for Events in Each Venue.
select avg(e.ticket_price) as avg_price, v.venue_name
from EventsTable as e 
join Venue as v
on e.venue_id = v.venue_id
group by v.venue_name

--9. Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type
select e.event_type,sum(b.num_tickets) as tot_ticket_count
from EventsTable as e 
join BookingsTable as b
on e.event_id = b.event_id
group by e.event_type

--10. Write a SQL query to calculate the total Revenue Generated by Events in Each Year. booking+event
select event_id, sum(total_cost) as totalRevenue
from BookingsTable
group by event_id,year(booking_date)
order by totalRevenue desc

--11. Write a SQL query to list users who have booked tickets for multiple events. cus+book+eve
select c.customer_id,count(distinct b.event_id) 
from CustomersTable as c 
join BookingsTable as b 
on c.customer_id = b.customer_id
group by c.customer_id
having count(distinct b.event_id) >1

--12. Write a SQL query to calculate the Total Revenue Generated by Events for Each User.
--booking+events+cutomers
select c.customer_id,e.event_name,sum(b.total_cost) as TotalRevenue
from BookingsTable as b 
join EventsTable as e 
on b.event_id = e.event_id
join CustomersTable as c 
on c.customer_id = b.customer_id
group by c.customer_id,event_name

--13. Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue.
select v.venue_name,avg(e.ticket_price),e.event_type
from EventsTable as e
 join Venue as v
on e.venue_id = v.venue_id
group by v.venue_name,e.event_type

--14. Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30 days

--customer+booking
select c.customer_id,sum(b.num_tickets) as TotalNumOfTickets
from CustomersTable as c 
join BookingsTable as b
on c.customer_id = b.customer_id 
where booking_date >=  dateadd(day,-30,Getdate())
group by c.customer_id



----------------------------------------------------------------------------------------------------------------------
--16/06/2025
--extra subquery questions

--given the eventType(Movies) and Get the CustomerId for that Category from Bookings table
select customer_id
from BookingsTable 
where event_id in 
(select event_id from EventsTable where event_type = 'Movie')

--given the categoryName(Movies and Sports) and Get the customer_id for that Bookings table
select customer_name from CustomersTable
where customer_id in 
(select customer_id from BookingsTable
where event_id in
(select event_id from EventsTable where event_type in ('Movie' ,'Sports')))

--find total tickets ordered for a specific event, given the eventName('Football Match')
select num_tickets from BookingsTable
where event_id =
(select event_id from EventsTable where event_name = 'Football Finals')

--find the Highest ticket ordered for each event
select event_name from EventsTable
where event_id = 
(select top 1 event_id from BookingsTable
order by num_tickets desc)

--find recent orderdate for specific eventname 
select top 1 booking_date from BookingsTable
where event_id = 
(select event_id from EventsTable
where event_name = 'Football Finals')
order by booking_date desc

-----------------------------------------------------------------------------------------------------------------------------

--Tasks 4: Subquery and its types
--1. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery.
select venue_id,venue_name,
(select avg(e.ticket_price) 
from EventsTable as e
where e.venue_id = v.venue_id)
from Venue as v

--2. Find Events with More Than 50% of Tickets Sold using subquery.
select event_name
from EventsTable e
where (
    select sum(num_tickets)
    from BookingsTable b
    where b.event_id = e.event_id
) > total_seats / 2

--3. Calculate the Total Number of Tickets Sold for Each Event
select e.event_id, e.event_name,
       (select sum(b.num_tickets)
        from BookingsTable b
        where b.event_id = e.event_id) as total_sold
from EventsTable e

--4. Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery.
select * from CustomersTable c
where not exists (
    select * from BookingsTable b
    where b.customer_id = c.customer_id
)

--5. List Events with No Ticket Sales Using a NOT IN Subquery.
select * from EventsTable
where event_id not in (
    select distinct event_id from BookingsTable)

--6. Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause.
select event_type, sum(total_tickets_sold) as total_sold
from (
    select e.event_type, 
           (select sum(b.num_tickets)
            from BookingsTable b
            where b.event_id = e.event_id) as total_tickets_sold
    from EventsTable e ) as event_sales
group by event_type

--7. Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause.
select event_name from EventsTable
where ticket_price > (
    select avg(ticket_price) from EventsTable
)
--8. Calculate the Total Revenue Generated by Events for Each User Using a Correlated Subquery.
select c.customer_name,
       (select sum(b.num_tickets * e.ticket_price)
        from BookingsTable b
        join EventsTable e on b.event_id = e.event_id
        where b.customer_id = c.customer_id) as total_revenue
from CustomersTable c
--9. List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause.
select * from CustomersTable
where customer_id in (
    select b.customer_id
    from BookingsTable b
    join EventsTable e on b.event_id = e.event_id
    where e.venue_id = 1 
)
--10. Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with GROUP BY.
select event_type, sum(total_tickets) as tickets_sold
from (
    select e.event_type,
           (select sum(b.num_tickets)
            from BookingsTable b
            where b.event_id = e.event_id) as total_tickets
    from EventsTable e
) as event_sales
group by event_type
--11. Find Users Who Have Booked Tickets for Events in each Month Using a Subquery with DATE_FORMAT.
select c.customer_id, c.customer_name
from CustomersTable c
where exists (
    select *
    from BookingsTable b
    where b.customer_id = c.customer_id
      and format(b.booking_date, 'yy-MM') = '25-06'
)
--12. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery
select venue_name,
(select avg(ticket_price) as AveragePrice
from EventsTable as e
where e.venue_id = v.venue_id )
from Venue as v

