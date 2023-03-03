# sql-challenge

This repository explores the employee database in SQL. The database consists of 6 tables, each of which contains information about the employees working at
Pewlett Hackard (a fictional company). 
1. The departments table contains the department number and its corresponding department name. For example the department number d003 refers to the Human 
Resources department. 
2. The dept_emp table contains the employment number and the department number associated with the employee (the department that the employee belongs to)
3. The dept_manager table contains the employment number and the department number associated with the managers
4. The employees table is a big table which consists of employee number, first and last name, employment title id, birth date, hire date and sex
5. The salaries table contains the salary for each employee
6. The titles table contains the title id and what it stands for

The open source database PostgreSQL was used via the pgAdmin client. 
The first task was to create tables to hold the data from the CSV files. The CSV files were then imported into the SQL database and the analysis was 
carried out.
The relationship between the attributes for each of the entities was also mapped out using an Entity Relationship Diagram. 
