# SQL

## subquery

중첩조건문: dept50 + employee100=150번 수행

조인으로도 가능: 100개의 튜플*50=5000번 반복 수행

최적화 면에서는 위가 효율적.



## hr 계정 접속

```bash
connect sys/oracle as sysdba
alter user hr identified by hr account unlock
connect hr/hr
--확인
show user
select * from tab
```

## 실습

1. 연봉이 12000 이상 되는 직원들의 LAST_NAME 및 연봉을 조회한다.

```sql
select last_name, salary
from employees
where salary>=12000
```

2. 사원번호가 176인 사람의 LAST_NAME과 부서 번호를 조회한다.

```sql
select last_name, department_id
from employees
where employee_id=176;
```

3. 연봉이 5000에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회한다.

```sql
select last_name, salary
from employees
where salary<5000 or salary>12000
```

## quiz

1. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳순으로 조회한다.

```sql
select last_name, department_id
from employees
where department_id in (20,50)
order by last_name
```

2. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.

```sql
select last_name, job_id
from employees
where manager_id is null
```

3. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.

```sql
select last_name
from employees
where last_name like '___a%'
```

4. 시애틀에 사는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.

```sql
select e.last_name, d.department_name, e.hire_date
from employees e, departments d
where e.department_id
in (select department_id from departments
where location_id=(select location_id from locations where city='Seattle'))
```

5. 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회한다.

```sql
select last_name, hire_date
from employees e
where hire_date < (select hire_date from employees f where f.employee_id = e.employee_id)
```

->아님