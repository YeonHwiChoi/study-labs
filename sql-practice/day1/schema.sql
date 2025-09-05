-- employees, orders, students 예시 스키마 & 데이터
CREATE TABLE IF NOT EXISTS employees(id SERIAL PRIMARY KEY, name TEXT, department TEXT, age INT);
INSERT INTO employees(name, department, age) VALUES
('Alice','HR',28),('Bob','IT',32),('Charlie','Finance',40);

CREATE TABLE IF NOT EXISTS orders(id SERIAL PRIMARY KEY, customer_id INT, amount NUMERIC);
INSERT INTO orders(customer_id, amount) VALUES
(1,200),(1,300),(2,150),(3,500);

CREATE TABLE IF NOT EXISTS students(id SERIAL PRIMARY KEY, grade INT, score INT);
INSERT INTO students(grade, score) VALUES
(1,75),(1,85),(2,90),(2,70),(3,95);
