--백업용으로 만드는 테이블
--테이블을 수정하거나 컬럼을 변경할 때 백업을 해두고 수정을 한다 
--하지만 옮길때 제약조건은 복사되지 않는다!
create table employees_bak01 as (select * from employees where job_id = 'FI_ACCOUNT');

create table employees_bak01 as (select employee_id, first_name, last_name from employees where job_id = 'FI_ACCOUNT');


select * from employees_bak01;

--drop은 rollback;의 대상이 아니므로 매우 조심해서 사용해야한다.
--rollback의 대상은 insert, delete, update 이 아이들!!
drop table employees_bak01;