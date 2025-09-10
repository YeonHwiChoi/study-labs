# 2️⃣ `sql-practice/day2/day2_sql.sql`

```sql
-- Day2 SQL 실습

-- ===============================
-- 1. 테이블 생성
-- ===============================
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ===============================
-- 2. 데이터 삽입
-- ===============================
INSERT INTO departments VALUES (1, 'HR'), (2, 'IT'), (3, 'Sales');

INSERT INTO employees VALUES
(101, 'Alice', 1, 3000),
(102, 'Bob',   1, 2500),
(103, 'Charlie', 2, 4000),
(104, 'David',   2, 5000),
(105, 'Eva',     3, 3500);

INSERT INTO customers VALUES
(1, 'CustomerA'),
(2, 'CustomerB'),
(3, 'CustomerC');

INSERT INTO orders VALUES
(1, 1),
(2, 1),
(3, 3);
