create database DDL_checkpoint;
use DDL_checkpoint;

-- creating department table 
create table Department (
Num_S int primary key,
Label Varchar(255) not null,
Manager_Name varchar(255) not null 
);

-- creating employee table 
create table Employee (
Num_E int primary key,
Name Varchar(255) not null,
Position Varchar(255) not null,
Salary Decimal(10,2) not null,
Department_Num_S int  not null,
Foreign key (Department_Num_S) References Department(Num_S)
);

-- creating project table 
create table Project (
Num_P int primary key,
Title Varchar(255) not null,
Start_Date Date not null,
End_Date Date,
Department_Num_S int not null,
Foreign key (Department_Num_S) References Department (Num_S)
);

-- creating Employee-project table 
create table Employee_Project (
Employee_Num_E int not null,
Project_Num_P int not null,
Role Varchar(255) not null,
Primary key (Employee_Num_E, Project_Num_P),
Foreign key (Employee_Num_E) References Employee (Num_E),
Foreign key (Project_Num_P) References Project (Num_P)
);


INSERT INTO Department ( Num_S, Label, Manager_Name)
Values  ( 1, 'IT', 'Alice Johnson'),
		( 2, 'HR', 'Bob Smith' ),
		(3, 'Marketing', 'Clara Bennett');


Insert into Employee (Num_E, Name, Position, Salary, Department_Num_S) 
Values  ( 101, 'John Doe', 'Developer', 60000.00, 1),
		( 102, 'Jane Smith', 'Analyst', 55000.00, 2), 
		( 103, 'Mike Brown', 'Designer', 50000.00, 3),
		(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
		(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2 ) ;


Insert into Project (Num_P, Title, Start_Date, End_Date, Department_Num_S)
Values  (201, 'Website Redesign', '2024-01-15', '2024-06-30', 1),
		(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
		(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
		(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1) ;


Insert into Employee_Project (Employee_Num_E, Project_Num_P, Role) 
Values  ( 101, 201, 'Frontend Developer'),
		( 104, 201, 'Backend Developer'), 
		( 102, 202, 'Trainer'), 
		( 105, 202, 'Coordinator'), 
		( 103, 203, 'Research Lead'), 
		( 101, 204, 'Network Specialist') ;


Update Employee_Project
Set Role = 'Full Stack Developer'
Where Employee_Num_E = 101 ;


Delete from Employee_Project
where Employee_Num_E = 103 ; 

Delete from Employee
where Num_E = 103 ;


select * 
from department;

select * 
from Employee;

select * 
from Project;

select * 
from Employee_Project;

