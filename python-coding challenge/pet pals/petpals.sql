

CREATE TABLE pets (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50),
    age INT,
    breed NVARCHAR(50)
);

CREATE TABLE donations (
    id INT IDENTITY(1,1) PRIMARY KEY,
    donor_name NVARCHAR(100),
    amount DECIMAL(10,2),
    donation_date DATE,
    item_type NVARCHAR(100)
);

CREATE TABLE adoption_events (
    id INT IDENTITY(1,1) PRIMARY KEY,
    event_name NVARCHAR(100),
    event_date DATE
);

CREATE TABLE participants (
    id INT IDENTITY(1,1) PRIMARY KEY,
    event_id INT,
    participant_name NVARCHAR(100)
);

select * from participants;