-- 수도컬럼인 level 과 rownum 
-- rownum을 where절에서 사용할 수 없다. --> select 할때 나오는것이기 때문에 where할때는 존재하지 않는 컬럼
select rownum, employee_id from employees;

--level을 찍을때 누가 가장 head에 있는지 확인하기 위함.
--트리구조로 생각하는거니까 head를 알아야함
--기준이 되는애가 employee_id인지 manager_id인지를 생각해야한다. 거꾸로 잘못하면 출력결과가 나오지 않는다.
-- start with ~ connect by 절
select level, manager_id, employee_id from employees
start with manager_id is null
connect by prior employee_id = manager_id
order by level, manager_id, employee_id;

--rollup, cube

select * from jobs;
select * from employees;
-- Q. 부서별, 직책별  평균 월급, 사원수 
select department_id, job_id, count(*), avg(salary) 
from employees 
group by department_id, job_id
order by department_id, job_id;

--Error 
select a.department_id, a.job_id,b.job_title, count(*), avg(a.salary) 
from employees a, jobs b
where a.job_id = b.job_id
group by department_id, job_id
order by department_id, job_id;

-- Q 
select department_id, job_id, count(*), round(avg(salary), 0)
from employees
group by rollup(department_id, job_id)
order by department_id, job_id;

select grouping(department_id),department_id, job_id, 
count(*), round(avg(salary), 0)
from employees
group by rollup(department_id, job_id)
order by department_id, job_id;

select case grouping(department_id) when 1 then '모든 부서' 
else nvl(to_char(department_id), '부서 없음')
end as "부서", job_id as "직책", count(*), round(avg(salary), 0)
from employees
group by rollup(department_id, job_id)
order by department_id, job_id;


select case grouping(department_id) when 1 then '모든 부서' 
else nvl(to_char(department_id), '부서 없음') end as "부서", 
  case grouping(job_id) when 1 then '모든 직책' 
  else nvl(to_char(job_id), '직책 없음') end as "직책", count(*), 
 round(avg(salary), 0) from employees
group by rollup(department_id, job_id)
order by department_id, job_id;
