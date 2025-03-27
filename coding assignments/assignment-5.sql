
create table Employeesdata(Employee_id int primary key identity(1,1) , Employee_name varchar(100) not null , age int , Department varchar(50) , salary decimal(10,2))

insert into Employeesdata values('roshan',22,'developer',10000.00),('arun',45,'sales',80000.00),('ajay',34,'marketing',40000.00)
INSERT INTO Employeesdata VALUES  
('John Doe', 30, 'HR', 50000.00),  
('Jane Smith', 28, 'Finance', 55000.50),  
('Alice Johnson', 35, 'IT', 60000.75),  
('Bob Brown', 40, 'Marketing', 58000.00),  
('Charlie Davis', 32, 'Sales', 52000.25),  
('Emily Clark', 29, 'HR', 51000.00);  

select  * from Employeesdata;

update Employeesdata set salary = salary * 1.10 where Department = 'sales';

delete from Employeesdata where Department = 'IT';

INSERT INTO Employeesdata VALUES  
('agnes', 50, 'HR', 44000.00)

update Employeesdata set Department = 'senior staff' where salary > 50000.00;

delete from Employeesdata
where age > 35;

select Employee_name , salary from Employeesdata;

select * from Employeesdata where Department = 'senior staff' and salary > 53000.00;

select * from Employeesdata order by salary desc;

select * from Employeesdata where Department in('HR' , 'senior staff');

SELECT *  
FROM Employeesdata 
WHERE Department <> 'IT';

SELECT *  
FROM Employeesdata  
WHERE Employee_name LIKE '%John%' AND Salary > 40000;

create database BankDB;


ALTER DATABASE BankDB MODIFY NAME = FinancialDB;


ALTER DATABASE FinancialDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;  
DROP DATABASE FinancialDB;