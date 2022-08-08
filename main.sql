/* 
------------------------------------------------
/ / CREATE tables 
------------------------------------------------ 
*/


CREATE TABLE client(
    clno CHAR(3),
    name VARCHAR(12),
    address VARCHAR(30),
    PRIMARY KEY (clno)
) / 


CREATE TABLE stock(
    company CHAR(7),
    price NUMBER(6, 2),
    dividend NUMBER(4, 2),
    eps NUMBER(4, 2),
    PRIMARY KEY (company)
) / 


CREATE TABLE trading(
    company CHAR(7),
    exchange VARCHAR(12),
    PRIMARY KEY (company, exchange),
    FOREIGN KEY (company) REFERENCES stock(company)
) / 



CREATE TABLE purchase(
    clno CHAR(3),
    company CHAR(7),
    pdate DATE,
    qty NUMBER(6),
    price NUMBER(6, 2),
    PRIMARY KEY (clno, company, pdate),
    FOREIGN KEY (clno) REFERENCES client(clno),
    FOREIGN KEY (company) REFERENCES stock(company)
) /

/*
------------------------------------------------
/ / Inserting values for above tables
------------------------------------------------
*/

INSERT INTO client VALUES ('C01','John Smith','3 East Av Bentley WA 6102')
/

INSERT INTO client VALUES ('C02','Jill Brody','42 Bent St Perth WA 6001')
/


/* --------------------------------------*/

INSERT INTO stock VALUES ('BHP',10.50,1.50,3.20)
/
INSERT INTO stock VALUES ('IBM',70.00,4.25,10.00)
/
INSERT INTO stock VALUES ('INTEL',40.00,5.00,12.40)
/
INSERT INTO stock VALUES ('FORD',76.50,2.00,8.50)
/
INSERT INTO stock VALUES ('GM',60.00,2.50,9.20)
/
INSERT INTO stock VALUES ('INFOSYS',45.00,3.00,7.80)
/

/*--------------------------------------------------- */