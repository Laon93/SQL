select department_id, job_id, count(*),round(avg(salary),0)
from employees
group by rollup(department_id, job_id)
order by department_id, job_id;

select grouping(department_id) , department_id , job_id,
count(*), round(avg(salary), 0 )
from employees
group by rollup(department_id, job_id)
order by department_id, job_id;

--grouping 은 안에 null이 들어있으면 1을 반환한다.
--그렇기 때문에 when 1 then '모든 부서'로 표시해준다
select case grouping (department_id) when 1 then '모든 부서'
else nvl(to_char(department_id), '부서 없음') 
	end as "부서", job_id as "직책", count(*), round(avg(salary),0)
	from employees 
	group by rollup(department_id, job_id)
	order by department_id , job_id;
	

select case grouping(department_id) when 1 then '모든 부서'
else nvl(to_char(department_id), '부서 없음') end as "부서", 
	case grouping(job_id) when 1 then '모든 직책'
else nvl(to_char(job_id), '직책 없음') end as "직책", 
	count(*), round(avg(salary) , 0)
	from employees
	group by rollup(department_id, job_id)
	order by department_id, job_id;
	
	
	
	
	
	
	