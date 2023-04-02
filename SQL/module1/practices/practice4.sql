--  Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email,
--  phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that,
--  the employee_id column does not contain any duplicate value at the time of insertion,
--  and the foreign key column department_id, reference by the column department_id of departments table,
--  can contain only those values which are exists in the departments table and another foreign key column job_id,
--  referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.

use db1;

create table employees
(
employee_id int primary key,
first_name varchar(255) not null,
last_name varchar(255) not null,
email varchar(255) not null constraint check (email like '%_@__%.__%'),
phone_number numeric(10) not null,
hire_date date not null,
salary int not null,
commission int not null,
manager_id int not null,
job_id int not null,
department_id int not null,
constraint fk_chk_jobs foreign key (job_id) references jobs1(job_id),
constraint fk_chk_departments foreign key (department_id) references departments(department_id)
);

drop table employees;
truncate table employees;

INSERT INTO `db1`.`employees`
(`employee_id`,
`first_name`,
`last_name`,
`email`,
`phone_number`,
`hire_date`,
`salary`,
`commission`,
`manager_id`,
`job_id`,
`department_id`)
VALUES
(5001,
'samidh',
'darji',
'sam@gmail.com',
9898632200,
'2023-02-01',
20000,
20000,
6001,
1001,
2001
);

INSERT INTO `db1`.`employees`
(`employee_id`,
`first_name`,
`last_name`,
`email`,
`phone_number`,
`hire_date`,
`salary`,
`commission`,
`manager_id`,
`job_id`,
`department_id`)
VALUES
(5002,
'samidh',
'darji',
'@gmail.com',
9898632200,
'2023-02-01',
20000,
20000,
6001,
1002,
2002
);


desc employees;

create table departments
(
department_id int primary key,
department_name varchar(25)
);

INSERT INTO `db1`.`departments`
(`department_id`,
`department_name`)
VALUES
(
2001,
'PHP'
),
(
2002,
'OPS'
);


INSERT INTO `db1`.`jobs1`
(`job_id`,
`job_title`,
`min_salary`,
`max_salary`)
VALUES
(
1001,
'devops',
50000,
500000
),
(
1002,
'web Developer',
20000,
37500
);


create table jobs1
(
job_id int primary key,
job_title varchar(25),
min_salary int,
max_salary int
);
