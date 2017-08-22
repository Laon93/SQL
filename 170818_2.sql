--subquery
--문) 이름이 lex인 사원보다 많은 월급을 받는 직원들의 이름과 월급을 출력해라

select first_name , salary from employees
where salary > (select salary from employees where first_name = 'Lex'); 

select a.first_name, a.salary from employees a, 
(select salary from employees where first_name = 'Lex') b
where a.salary > b.salary;

--subquery는 from절 where절 어디에도 들어갈 수 있다. 
-- 그러니까 문제를 보고 잘 생각을 해서 어디에 넣는 것이 효과적일지를 판단하는 것이 바람직.\
-- 조건이 여러개인 경우에는 에러 발생!! 그러니 주의하는 것이 좋다~

--single row subquery
select first_name, salary
from employees where salary > (select salary from employees where first_name = 'Lex');

--Q 전체 직원의 평균 연월급보다 많이 받고 있는 직원들의 이름, 월급 출력
select avg(salary) from employees;

select first_name, salary
from employees where salary > (select avg(salary) from employees);

--select a.first_name, a.salary
--from employees a, employees b 
--where a.salary > ;

--Q job_id 'IT_PROG'인 직원보다 월급을 많이 받는 직원의 이름과 월급
select salary from employees where job_id = 'IT_PROG';

--all --> 리스트에 있는 애들보다 다 커야한다.
select first_name, salary from employees
where salary > all (select salary from employees where job_id = 'IT_PROG');

--Q job_id 'IT_PROG'인 직원과 같은 월급을 받는 직원의 이름과 월급
select first_name, salary from employees
where salary in (select salary from employees where job_id = 'IT_PROG');

select first_name, salary from employees
where salary = any (select salary from employees where job_id = 'IT_PROG');

--in과 =any는 같은일을 함
--<any, >any 이런식으로도 사용 가능

-- corelated subquery
--Q 각 부서별로 최고 월급을 받는 직원의 이름과 월급 출력
select max(salary) from employees 
group by department_id;

 -- 1. where
select department_id, first_name, salary from employees
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id)
order by department_id;

 -- 2. from
 select a.department_id, a.first_name, a.salary 
 from employees a, (select department_id, max(salary) as max_salary from employees group by department_id) b
 where a.department_id = b.department_id
 and a.salary = b.max_salary
 order by a.department_id;
 

 -- 3. corelated
 select department_id , first_name, salary
 from employees a
 where salary = (select max(salary) from employees where a.department_id = department_id)
 order by department_id;
 
 -- 자기 부서의 평균 월급보다 적은 월급을 받는 직원의 이름과 월급을 출력
 select a.department_id , a.first_name , a.salary
 from employees a , (select department_id, avg(salary) avg_salary from employees group by department_id) b
 where a.department_id = b.department_id
 and a.salary < b.avg_salary
 order by a.department_id;
 
 select department_id, first_name, salary
 from employees a
 where salary < (select avg(salary) from employees where a.department_id = department_id)
 order by department_id;














