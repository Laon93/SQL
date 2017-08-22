CREATE TABLE book(
no number(10),
title varchar2(120),
author varchar2(50),
pub_date date);


insert into book values(1, '토지', '박경리', to_date('2017/08/21', 'yyyy/mm/dd'));
commit;

delete from book where no = 1;
commit;
rollback;
select * from book;

update book set title = '토지2';

select * from employees where job_id = 'FI_ACCOUNT';




--타임스탬프 포맷을 확인하기
select value from nls_database_parameters where parameter = 'NLS_TIMESTAMP_FORMAT';
--char의 기본설정?을 확인하기
select value from nls_database_parameters where parameter = 'NLS_CHARACTERSET';
