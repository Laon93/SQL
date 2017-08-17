--

--natural join
select * from  employees 
natural join departments; 

select count(*) from employees
natural join departments;
--같은 명의 컬럼명이 다 자동으로 join이 걸린다


--natural join과 같은데 조건을 using으로 주는것 --> 
--조건을 명시했으니까 natural을 빼도된다
select count(*) from employees
join departments
using(department_id);

select count(*) from employees
join departments
on a.department_id = b.department_id
where a.salary>5000;