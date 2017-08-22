-- 1. 직원중에 최고임금과 최저임금을 "최고임금", "최저임금" 프로젝션 타이틀로 함께 출력
-- 	    최고임금 - 최저임금 이란 타이틀로 출력
select * from employees;

select max(salary)  최고임금, min(salary)  최저임금,
 max(salary)-min(salary) "최고임금 - 최저임금" from employees;
 
 
-- 2. 마지막으로 신입사원이 들어온 날은?
select * from employees;
select max(hire_date) from employees;

-- 3. 부서별로 평균임금, 최고임금, 최저임금을 부서(department_id)와 함께 출력하고 정렬순서는
--    평균연봉, 최고임금, 최저임금의 내림차순 (Group by 사용)
select * from employees;
select department_name, salary from employees;
select department_id, avg(salary) 평균, max(salary) 최고, min(salary) "최소"
FROM employees where department_id is not null 
group by department_id 
order by avg(salary) desc, max(salary) desc, min(salary) desc;

-- 4. 업무별로 평균임금, 최고임금 최저임금을 업무와 함께 출력(Group by 사용)
select * from employees;
select job_id, salary from employees;
select job_id, avg(salary) 평균, max(salary) 최고, min(salary) "최소"
FROM employees where manager_id is not null 
group by job_id
order by avg(salary) desc, max(salary) desc, min(salary) desc;;

-- 5. 가장 오래 근속한 직원의 입사일은 언제? --년 --월 --일로 출력
select min(to_char(hire_date, 'yyyy"년" mm"월" dd"일"')) 입사일
from employees;

-- 6. 평균 임금과 최저 입금의 차이가 2000 미만인 부서,
--    평균임금, 최저임금, (평균임금 - 최저임금)--> order by 조건
select * from employees;
select department_id from employees;
select department_id, max(salary), min(salary),
avg(salary) - min(salary) 
from employees  where department_id is not null
group by department_id having avg(salary) - min(salary) < 2000
order by avg(salary) - min(salary) desc;

-- 7. 업무별로 최고임금과 최저임금의 차이를 출력
select * from employees;
select job_id, max(salary) - min(salary) 
from employees 
group by job_id
order by max(salary) - min(salary) desc;

