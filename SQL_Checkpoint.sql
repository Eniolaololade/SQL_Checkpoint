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