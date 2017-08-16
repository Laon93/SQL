--1. 전체직원을 입사일 기준 오름차순으로 정렬하되, 이름, 이메일 전화번호 순서로 출력
--단, 이름 이메일 전화번호로 컬럼이름을 대체할 것
select last_name 이름, email 이메일, phone_number 전화번호 from employees order by hire_date asc;


--2. 업무별로 업무이름과 최고임금을 내림차순으로 정렬 (DESC)
select JOB_TITLE , MAX_SALARY from jobs order by Job_title desc, max_salary desc;


--3. 매니저가 없는 직원은 몇명?
select * from employees;
select count(employee_id) from employees where manager_id is null;


--4. 업무를 이름, 최고연봉의 내림차순으로 정렬 (DESC)
select * from jobs;
select * from jobs order by job_title desc, max_salary desc;


--5. 부서는 총 몇 개가 있나요
select * from departments;
select count(department_id) from departments;


--6. 전체 부서를 부서 이름이 긴 순서대로 출력
select * from departments;
select department_name from departments;
select department_name from departments order by length(department_name) desc;


--7. 매니저가 없는 부서는?
select count(department_id) from departments;
select count(department_id) from departments where manager_id is null;


--8. 지사가 있을 것으로 예상되는 나라 이름을 대문자초 출력하고 오름차순으로 정렬(asc)
select * from countries;
select * from countries order by length(country_name) asc;


--9.전 세계를 몇개의 지역으로 나누어 관리중? 각 지역의 이름 길이의 올림차순으로 정렬
select * from regions;
select * from regions order by length(region_name) desc;


--10. 부서 사무실이 위치한 도시는? 도시 이름을 소문자로 오름차순 정렬(asc)
select * from locations;
select lower(city) from locations order by city asc;
select lower(street_address) from locations order by street_address asc;
