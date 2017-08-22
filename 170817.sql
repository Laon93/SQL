--ltrim --> 왼쪽만 제거
--rtrim --> 오른쪽만 제거
select trim('#' from '####data base####') from dual;

-- 실수값을 올림하여 정수로 만든다
select ceil(4.9) from dual;
select ceil(4.1) from dual;

-- 실수값을 내림하여 정수로 만든다
select floor(4.9) from dual;

-- 나머지 연산
select mod(9999,6) from dual;

-- 2의 10승
select power(2,10) from dual;

select round(3.3364, 3) from dual;

select employee_id, hire_date from employees;

select employee_id, to_char(hire_date, 'yyyy"년" mm"월" dd"일"') from employees;


select to_char(to_date('30' , 'RR') , 'yyyy') from dual;

select to_char(to_date('6anj0' , 'RR') , 'yyyy') from dual;


---case ~ end
select job_id from jobs;

-- AC_ACCOUNT => salary + salary * 0.5
-- AC_MGR => salary + salary * 0.3
-- AD_ASST => salary + salary * 0.2

select employee_id ,job_id, salary, case job_id 
WHEN 'AC_ACCOUNT' THEN salary + salary * 0.5
WHEN 'AC_MGR' THEN salary + salary * 0.3
WHEN 'AD_ASST' THEN salary + salary * 0.2
ELSE salary
	END as "이번달 월급"
	from employees;

--decode
select employee_id ,job_id, salary, decode(job_id ,
 'AC_ACCOUNT' , salary + salary * 0.5,
 'AC_MGR' , salary + salary * 0.3,
 'AD_ASST' , salary + salary * 0.2,
 salary) as "이번달 월급"
	from employees;
	


