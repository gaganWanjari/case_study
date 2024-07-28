USE passenger_management;

CREATE TABLE passengers (
    pnr VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    origin VARCHAR(100),
    destination VARCHAR(100),
    ticket_price DOUBLE,
    train_number INT
);
