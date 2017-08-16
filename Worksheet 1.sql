select 100 * 10 from dual;
select salary from employees;
select employee_ID, (salary + salary * 0.3) from employees;
select commission_pct from employees; 
--null을 산술 연산식에 사용하면 결과는 무조건 null
select first_name || ' ' || last_name as "이름", (salary + salary * commission_pct)* 12 from employees;
select employee_id, salary, commission_pct from employees;
--nvl 함수 안의 파라미터의 값과 뒤에 부분의 타입을 맞춰줘야 가능.
select first_name || ' ' || last_name as "이름", salary, (salary + salary * nvl(commission_pct, 0))*12 from employees;

select nvl(manager_id,0) from employees;




--1. 전체직원을 입사일 기준 오름차순으로 정렬하되, 이름, 이메일 전화번호 순서로 출력
--단, 이름 이메일 전화번호로 컬럼이름을 대체할 것
select last_name 이름, email 이메일, phone_number 전화번호 from employees order by hire_date asc;

--2. 업무별로 업무이름과 최고임금을 내림차순으로 정렬 (DESC)
select JOB_TITLE , MAX_SALARY from jobs order by Job_title,max_salary desc;

--3. 매니저가 없는 직원은 몇명?
select * from employees;
select count (last_name) from employees where manager_id=null;

