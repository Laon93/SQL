--1. ��ü������ �Ի��� ���� ������������ �����ϵ�, �̸�, �̸��� ��ȭ��ȣ ������ ���
--��, �̸� �̸��� ��ȭ��ȣ�� �÷��̸��� ��ü�� ��
select last_name �̸�, email �̸���, phone_number ��ȭ��ȣ from employees order by hire_date asc;

--2. �������� �����̸��� �ְ��ӱ��� ������������ ���� (DESC)
select JOB_TITLE , MAX_SALARY from jobs order by Job_title desc, max_salary desc;

--3. �Ŵ����� ���� ������ ���?
select * from employees;
select count(employee_id) from employees where manager_id is null;

--4. ������ �̸�, �ְ����� ������������ ���� (DESC)
select * from jobs;
select * from jobs order by job_title desc, max_salary desc;

--5. �μ��� �� �� ���� �ֳ���
select * from departments;
select count(department_id) from departments;

--6. ��ü �μ��� �μ� �̸��� �� ������� ���
select * from departments;
select department_name from departments;
select department_name from departments order by length(department_name) desc;

--7. �Ŵ����� ���� �μ���?
select count(department_id) from departments;
select count(department_id) from departments where manager_id is null;

--8. ���簡 ���� ������ ����Ǵ� ���� �̸��� �빮���� ����ϰ� ������������ ����(asc)
select * from countries;
select * from countries order by length(country_name) asc;

--9.�� ���踦 ��� �������� ������ ������? �� ������ �̸� ������ �ø��������� ����
select * from regions;
select * from regions order by length(region_name) desc;


--10. �μ� �繫���� ��ġ�� ���ô�? ���� �̸��� �ҹ��ڷ� �������� ����(asc)
select * from locations;
select lower(city) from locations order by city asc;
select lower(street_address) from locations order by street_address asc;
