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
