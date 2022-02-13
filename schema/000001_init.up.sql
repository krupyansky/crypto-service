CREATE TABLE currency
(
    id      int unsigned auto_increment primary key,
    fsym    varchar(3) not null,
    tsym    varchar(3) not null,
    raw     json       not null,
    display json       not null
);
