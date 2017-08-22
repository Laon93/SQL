-- 1. 평균 연봉보다 적은 월급을 받는 직원은 몇 명?
select * from employees;
select department_id, avg(salary) from employees
group by department_id;

-- 3번 방법으로
select department_id, first_name , salary
from employees a
where salary < (select avg(salary) avg_salary from employees where a.department_id = department_id)
order by department_id;

select count(*) from employees a
where salary < ( select avg(salary) from employees where a.department_id = department_id);

-- 2번 방법으로 ( from절)
select * from employees;
select count(*) 
from employees a, (select department_id , avg(salary) avg_salary from employees group by department_id ) b
where a.department_id = b.department_id
and a.salary < b.avg_salary;

-- 2. 각 부서별 최고의 급여를 받는 사원의 사번, 성, 월급을 조회 --> 연봉의 내림차순으로
select * from employees;
--1번 방법 (where 절)
select department_id, employee_id, last_name, salary
from employees
where (department_id , salary) in 
(select department_id , max(salary) from employees 
group by department_id)
order by salary desc;

--2번 방법 (from 절)
select a.department_id, a.employee_id , a.last_name , a.salary 
from employees a, 
(select department_id , max(salary) max_salary from employees
 group by department_id) b
 where a.salary = b.max_salary
 order by a.salary desc;
 
 --3번 방법
 select department_id, employee_id , last_name , salary
 from employees a
 where department_id = a.department_id
 order by a.salary desc;
 
 -- 3. 업무 별로 연봉의 총합을 구하고 연봉 총합이 가장 높은 업무부터 업무명과 연봉 총합을 조회
 select * from employees;
 select * from jobs;
 
 select sum(salary) sum_salary, job_id
 from employees
 group by job_id
 order by sum_salary desc;
 
 --from 절
 select a.job_id, a.job_title, sum_salary
 from jobs a, (select sum(salary) sum_salary, job_id 
 from employees group by job_id) b
 where a.job_id = b.job_id
 order by sum_salary desc;
 

-- 4. 자신의 부서 평균 급여보다 연봉이 많은 사원의 사번과 성, 연봉을 조회
select * from salary ; 

select employee_id , last_name , salary 
from employees a 
where salary > (select avg(salary) from employees 
where a.department_id = department_id
group by department_id );

select a.employee_id, a.last_name , a.salary
from employees a , (select avg(salary) avg_salary, department_id from employees
group by department_id) b 
where a.department_id = b.department_id
and a.salary > avg_salary
order by a.salary desc;
 





