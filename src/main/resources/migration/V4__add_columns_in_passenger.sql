Alter table passenger
    add email VARCHAR(255) not null unique,
    add password varchar(255) not null,
    add phone_number varchar(255) not null,
    modify name varchar(255) not null;
   