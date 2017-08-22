---질문할 것들

--1. 부서별, 직책별 평균 월급, 사원수  + job_title 
select department_id, job_id, count(*), avg(salary)
from employees
group by department_id, job_id
order by department_id, job_id;


--column ambiquously defined error 
--이게 왜 안되는거지ㅠㅠ 
select a.department_id, b.job_id, b.job_title, count(*), avg(a.salary)
from employees a, jobs b
where a.job_id = b.job_id
group by department_id, job_id
order by department_id, job_id;


-- 2.
select case grouping (department_id) when 1 then '모든 부서'
else nvl(to_char(department_id), '부서 없음') 
	end as "부서";
--department_id == null 이면 1을 반환해서 모든 부서라고 적는데
--왜 또 null check를 하면 null이 나오지:var1



