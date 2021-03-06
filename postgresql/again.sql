DROP TABLE IF EXISTS
t_routes,
t_lodgings,
t_availability;

CREATE TABLE t_routes (
    routeid SERIAL,
    numberofdays INT NOT NULL,
    routename VARCHAR NOT NULL,
    routedesc VARCHAR NOT NULL
);

INSERT INTO t_routes (numberofdays, routename, routedesc)
VALUES
(2, 'Route 1', '2 Stops'),
(3, 'Route 2', '3 Stops'),
(4, 'Route 3', '4 Stops');


CREATE TABLE t_lodgings (
    lodgingid SERIAL,
    routeid INTEGER NOT NULL,
    daynumber INTEGER NOT NULL,
    lodgingname VARCHAR NOT NULL,
    lodgingtype VARCHAR NOT NULL,
    isBooked BOOLEAN NOT NULL,
    price REAL NOT NULL
);

INSERT INTO t_lodgings (routeid, daynumber, lodgingname, lodgingtype, isbooked, price)
VALUES 
(1, 1, 'Madison Campground', 'campground', 'FALSE', 26.00), --Madison
(1, 2, 'Canyon Lodge & Cabins', 'hotel', 'FALSE', 150.00), --Canyon Village
(1, 2, 'Canyon Campground', 'campground', 'FALSE', 54.00), --Canyon Village
(1, 2, 'Moran Lodge', 'hotel', 'FALSE', 78.00), --Canyon Village
(2, 1, 'Madison Campground', 'campground', 'FALSE', 26.00), --Madison
(2, 2, 'Old Faithful Inn', 'hotel', 'FALSE', 300.00), --Old Faithful
(2, 2, 'Old Faithful Lodge', 'hotel', 'FALSE', 350.00), --Old Faithful
(2, 2, 'Old Faithful Snow Lodge', 'hotel', 'FALSE', 400.00), --Old Faithful
(2, 3, 'Grant Village Lodge', 'hotel', 'FALSE', 225.00), --Grant Village
(2, 3, 'Grant Village Campground', 'campground', 'FALSE', 50.00), --Grant Village
(3, 1, 'Lake Village Lodge & Cabins', 'hotel', 'FALSE', 225.00), --Lake Village
(3, 2, 'Pahaska Tepee Resort', 'hotel', 'FALSE', 150.00), -- Pahaska Tepees
(3, 3, 'Roosevelt Lodge & Cabins', 'hotel', 'FALSE', 99.99), --Tower Fall
(3, 3, 'Tower Fall Campground', 'campground', 'FALSE', 45.00), --Tower Fall
(3, 4, 'Norris Campground', 'campground', 'FALSE', 35.00); --Museum

CREATE TABLE t_availability (
    lodgingid INT NOT NULL,
    sitenumber INT NOT NULL,
    sitename VARCHAR NOT NULL,
    sitedesc VARCHAR,
    siteprice REAL NOT NULL,
    bookdate DATE NOT NULL,
    isbooked BOOLEAN NOT NULL
);

INSERT INTO t_availability (lodgingid, sitenumber, sitename, sitedesc, siteprice, bookdate, isbooked)
VALUES 
(1, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
(1, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
(1, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
(2, 1, 'room 123', 'two twin beds', 100.00, '2020-07-11', 'FALSE'),
(2, 2, 'room 456', '1 queen, sofa bed', 150.00, '2020-07-11', 'FALSE'),
(2, 3, 'room 223', 'king bed luxury suite', 300.00, '2020-07-11', 'FALSE');
-- (3, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (3, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (3, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (4, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (4, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (4, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (5, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (5, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (5, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (6, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (6, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (6, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (7, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (7, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (7, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (8, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (8, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (8, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (9, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (9, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (9, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (10, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (10, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (10, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (11, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (11, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (11, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (12, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (12, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (12, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (13, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (13, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (13, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
-- (14, 1, 'site 1A', 'site with RV hookup', 27.00, '2020-07-11', 'FALSE'),
-- (14, 2, 'site 2A', 'site with RV hookup and tent space', 27.00, '2020-07-11', 'FALSE'),
-- (14, 3, 'site 3A', 'site with tent space, electricity', 27.00, '2020-07-11', 'FALSE'),
