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


-- 1. Write a query to retrieve the names of employees who are assigned to more than one project, including the total number of projects for each employee.
select Em.name, Emp.employee_Num_E, count(Emp.Project_Num_P) No_of_Projects
from Employee Em
join Employee_Project Emp 
ON Em.Num_E = Emp.Employee_Num_E
group by Em.name, Emp.employee_Num_E
having  count(Emp.Project_Num_P) > 1


-- 2. Write a query to retrieve the list of projects managed by each department, including the department label and manager’s name.
select Label, pr.Title, Manager_name
from project pr
join department D
ON D.Num_S = Pr.Department_Num_S
order by label;


-- 3. Write a query to retrieve the names of employees working on the project "Website Redesign," including their roles in the project.
select Em.name, Pr.title, Emp.Role
from Employee Em
join Employee_Project Emp ON Em.Num_E = Emp.Employee_Num_E
join Project pr ON pr.Num_P = Emp.Project_Num_P
where Pr.title like '%Web_%'
;

-- 4. Write a query to retrieve the department with the highest number of employees, including the department label, manager name, and the total number of employees.
select top 1 Label, manager_name, count(em.Num_E) Total_employees
from department D
join employee Em
ON D.Num_S = Em.Department_Num_S
group by Label, manager_name
order by Total_employees desc ; 


-- 5. Write a query to retrieve the names and positions of employees earning a salary greater than 60,000, including their department names.
select name, position, label, salary 
from Employee Em
join department D
ON Em.Department_Num_S = D.Num_S
where salary > 60000 ;


-- 6. Write a query to retrieve the number of employees assigned to each project, including the project title.
select title, count(emP.Employee_Num_E) Total_employees
from Project pr
join Employee_Project EmP 
ON Pr.Num_P = Emp.Project_Num_P
group by title ;


-- 7. Write a query to retrieve a summary of roles employees have across different projects, including the employee name, project title, and role.
select name, title, role
from Employee Em
join Employee_Project Emp ON em.Num_E = Emp.Employee_Num_E
join Project P ON P.Num_P = Emp.Project_Num_P ;


-- 8. Write a query to retrieve the total salary expenditure for each department, including the department label and manager name.
select label,manager_name, sum(salary) Tot_Salary
from department D
join Employee Em 
ON D.Num_S = Em.Department_Num_S
group by label, Manager_Name ; 