sql이란 데이터베이스에서 데이터를 가져오는 것만 정리.

# 1. 데이터베이스 개요

데이터베이스: 엑셀 테이블같이 데이터를 쌓아두는 형태, 데이터의 구조.

관계형 데이터 모델: 관계형 구조, 트리. 어떤 상자, 형태, 뼈대, 이론.

table: 쉬운 형태.

실저 데이터베이스는 테이블이 여러 개 있고, 서로 연관되어 저장됨.

데이터베이스는 Integrated & Related Data

중복(Redundancy)을 최소화하여 보조기억장치에 저장

## 데이터베이스 추상화

추상화의 3단계

- 물리적 단계: DB관리자(DBA)
- 논리적 단계: DB설계자(DA)
- 뷰 단계: End User

## 관계형 데이터 모델

DB를 사용하는 것만으로 데이터 정제 기능.

키: 데이터를(tuple을) 구분하는 값.

- candidate key: 하나의 관계에서 유일성과 최소성(minimality)을 만족하는 키
- primary key: 주키는 관계에서 여러 튜플 중에서 **하나의 튜플을 식별**하는 역할을 수행
- foreign key: 외래키는 어느 관계의 속성들 중에서 일부가 다른 관계의 주키가 될 때, 이를 외래키라 함.
  - 이 외래키를 이용하여 관계와 관계를 서로 연결할 수 있음

## 데이터베이스 언어(SQL)

- DBMS(Database Management System)을 통해서 데이터베이스의 구축 및 사용자와 데이터베이스 간의 소통 수단으로 데이터 정의, 조작, 제어하는데 사용되는 언어
- 데이터베이스 언어의 종류로는 그 역할에 따라 다음과 같이 나뉜다

- DDL, DML, DCL

## DBMS

- 오라클
  정부,국가기관.. 모든 DB가 오라클. 포털사이트(다음,네이버,구글...) 대부분 유명 회사, 기업들에서 사용되는 DB라 생각해도.. 
  대용량 지원, 신뢰성, 안정성.
  그리고 DB를 함부로 바꿀 수 없어.
- MySql
  처음엔 오픈소스였는데(소규모) 나중에 상용화

- SQL Server
  마이크로소프트가 만듦, 윈도우 서버에 가장 적합한 DB다
  한때 많이 사용됨, 기존에 쓰던 곳은 계속 쓰지만, 요즘 선택하진 않음

# 2. 오라클 개요

- 오라클 사가 개발한 **객체 관계 DBMS**
- DB 관점에서는 객체 개념이 모호함. (기존까지는 관계 개념)
- 오라클이 객체도 가능하긴 하지만 관계 DB라고 생각하면 됨.

**데이터 웨어하우스**

- 데이터베이스: 테이블 / 데이터 웨어하우징: 데이터베이스 다수를 관리하는.
- 테이블의 히스토리까지. 시간 축이 하나 더 있다고 생각하면 됨.
- 더 어마어마한 용량

## 설치

management system이기 때문에, DB를 구동해서 사용. 계정으로 접속해서 사용

일반적으로) 설치하고, 관리자 계정으로 일반 사용자 계정을 만들고, 일반 사용자 계정으로 DB 만들고, 처리.

관리자 계정은 처음에 생성하는 용도로만. 나중에 DB관리할 때만 쓰고..

## 실습

sql 파일 실행시키려면 Oracle 설치 폴더와 같은 경로에 위치해야 한다.

### Create Users

system 계정으로 유저 생성

```bash
SQL*Plus: Release 11.2.0.2.0 Production on 금 7월 10 11:52:40 2020

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> connect system
Enter password:
Connected.
SQL> @C:\oraclexe\myfile\userCreate_mod.sql

User created.


User created.


Grant succeeded.


Grant succeeded.
```

### Create Tables

사용자 계정으로 table manipulating

```bash
SQL> connect kim/kim
Connected.

SQL> @C:\oraclexe\myfile\sampledata.sql

Table created.


1 row created.


1 row created.


1 row created.


1 row created.


Table created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.

CREATE VIEW EMP_PLANNING
            *
ERROR at line 1:
ORA-01031: insufficient privileges

```

### 테이블 생성 확인, 구조 확인

- TAB
  - tab은 데이터베이스 내의 테이블에 관한 정보를 나타내는 데이터 사전 뷰
  - TNAME은 테이블의 이름을 나타내고, TABTYPE은 테이블의 유형, 즉 테이블 또는 뷰를 나타냄
- DESCRIBE, DESC
  - 이름은 DEPARTMENT 테이블에 속한 애트리뷰트들을 나타내고, 널?은 애트 리뷰트가 널값을 허용하는가를 나타내며, 유형은 애트리뷰트의 데이터 타입 과 길이를 의미

```bash
SQL> select * from tab;

TNAME                                                        TABTYPE
------------------------------------------------------------ --------------
 CLUSTERID
----------
DEPARTMENT                                                   TABLE


EMPLOYEE                                                     TABLE



SQL> describe department;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPTNO                                    NOT NULL NUMBER
 DEPTNAME                                           CHAR(10)
 FLOOR                                              NUMBER

SQL> desc employee;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER
 EMPNAME                                            CHAR(10)
 TITLE                                              CHAR(10)
 MANAGER                                            NUMBER
 SALARY                                             NUMBER
 DNO                                                NUMBER
```

# 3. SQL

200713

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