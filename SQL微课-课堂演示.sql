##选取目标SCHEMA
USE classicmodels;

##查看某个指定表里储存的数据列类型
DESCRIBE customers;

##选取schema下某个指定表格里的所有数据列，显示前十行
SELECT * FROM customers
LIMIT 10;

##练习1：选取offices表格里的所有数据列，显示前三行
SELECT * FROM offices
LIMIT 3;


##公司决定圣诞节给所有客户送一个印有客户公司联系人firstname的杯子，于是需要知道一共有多少个不同名的客户，用到DISTINCT语句
SELECT DISTINCT contactFirstName
FROM customers
ORDER BY contactFirstName;

##练习2：请从customers表格中获取数据知道公司在哪些州有客户？查询的结果请按所在州的第一个字母倒序排列
##提示：倒序指令是DESC##
DESCRIBE customers;
SELECT DISTINCT state
FROM customers
ORDER BY state DESC;


##选取指定表格中的指定数据列，并给出一定的条件，需要用到WHERE语句
SELECT customerName, phone,country
FROM customers
WHERE country = 'USA';

##当条件大于一个时，需要用到AND语句
SELECT firstname, lastname, jobtitle,officeCode
FROM employees
WHERE officeCode = 1 AND jobtitle = 'President';

##练习3：请调取所有状态显示为Cancelled的订单信息
DESCRIBE orders;
SELECT * FROM orders
WHERE status = 'Cancelled';




##练习4：请问代号为1611的销售在美国地区有没有客户？
##提示：销售代号列名为salesRepEmployeeNumber
DESCRIBE customers;
SELECT * FROM customers
WHERE salesRepEmployeeNumber = 1611 AND country = 'USA';




##其他比较符号 如 < > <= 都可以运用到筛选条件中
##例如查询1~4号办公室内所有不是大老板（President)的员工信息
SELECT * FROM employees
WHERE jobtitle <> 'President' AND officeCode <= 4
ORDER BY officeCode;

##更多的比较条件语句还有OR，BETWEEN, LIKE, IN， IS NULL等
##有时候可以通过多于一种写法来达到同样的筛选目的，例如筛选所有在加州（CA）或纽约（NY）的客户基本信息
##表达方法1
SELECT customerNumber, customerName, city, state, country, salesRepEmployeenUMBER, creditLimit
FROM customers
WHERE state = 'CA' OR state = 'NY';
##表达方法2
SELECT customerNumber, customerName, city, state, country, salesRepEmployeenUMBER, creditLimit
FROM customers
WHERE state IN ('CA','NY');

##使用GROUP BY和COUNT语句来给数据分组及计算组内数量
##查看所有订单状态下各有多少订单
SELECT status, COUNT(*)
FROM orders
GROUP BY status;

##练习5：查看所有办公室下各有多少名员工
DESCRIBE employees;
SELECT officeCode
FROM employees,COUNT(*) 
GROUP BY officeCode;


##调取数据时通过SELECT AS语句给数据列更改显示名
SELECT customerName FROM customers;
SELECT customerName AS Nickname FROM customers;

##练习6：选取所有在2、4、6号办公室上班的员工的姓名、邮箱、和职位名称，并且把员工的名字列的名称显示为Alias
DESCRIBE employees;


##和excel里的formula类似，SQL里也有运算语句，例如最基础的SUM
##我们先来查看一下订单号为10100的订单里包含的信息
SELECT * 
FROM orderdetails
WHERE orderNumber=10100;

##计算一下这个订单一共多少钱，并把计算出来的值命名为Total
SELECT SUM(quantityOrdered * priceEach) AS Total
FROM orderdetails
WHERE orderNumber=10100;

##练习7：计算所有订单各自的订单价，把计算出来的值命名为OrderTotal，并按照订单价倒序（最大额的在最前面）排列
DESCRIBE orderdetails;
