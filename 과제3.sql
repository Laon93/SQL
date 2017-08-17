--1. 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 
--   부서명(department_name), 매니저(manager)의 이름(first_name)을 조회
select * from employees;
select * from departments;

select employee_id, first_name from employees;
--manager 이름 출력
select b.department_name, a.first_name
from employees a, departments b
where a.employee_id = b.manager_id;

select a.employee_id, a.first_name, 
	c.department_name, b.first_name manager_name
from employees a, employees b, departments c
where a.department_id = c.department_id
and a.manager_id = b.employee_id
order by a.employee_id; 


--2. 지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력
select * from regions;
select * from countries;

select regions.region_name, countries.country_name
from regions, countries
where regions.region_id = countries.region_id
order by countries.COUNTRY_NAME desc;

--3. 각 부서(department)에 대해서 부서번호(department_id), 이름(department_name), 
-- 매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 
-- 나라(countries)의 이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 
-- 전부 출력해 

select * from departments;
select * from employees;
select * from countries;
select * from regions;
select * from locations;

select d.department_id, d.department_name, e.first_name, 
l.city , c.country_name, r.region_name
from departments d, employees e, countries c, regions r, locations l
where d.manager_id = e.employee_id and c.country_id = l.country_id
and l.location_id = d.location_id and r.region_id = c.REGION_ID;
--4. ‘Public Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력
-- (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려하지 않습니다.) 
-- 이름은 first_name과 last_name을 합쳐 출력합니다. 

select * from job_history;
select * from jobs;
select * from employees;

select distinct e.first_name || ' ' || e.last_name
from job_history jh, jobs j, employees e
where j.job_title = 'Public Accountant'
and jh.employee_id = e.employee_id;

--5. 같은 성(last_name)을 가진 직원들의 사번(employee_id), 이름(firt_name), 
-- 성(last_name)과 부서 이름을 조회하여 성(last_name)순서로 정렬
select count(*) from employees;
select * from employees
where employees.last_name = 'King';
select * from departments;

select distinct a.employee_id, a.first_name, a.last_name, c.department_name
from employees a, employees b, departments c
where a.last_name = b.last_name
and a.employee_id != b.employee_id
and a.department_id = c.department_id
order by a.last_name desc;

-- 6.자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 
--  성(last_name)과 채용일(hire_date)을 조회하세요 
select * from employees;

select a.employee_id, b.employee_id manager_id , a.hire_date, b.hire_date
from employees a, employees b
where a.manager_id = b.employee_id
and a.hire_date < b.hire_date;
--and to_date(a.hire_date) < to_date( b.hire_date);









