-- KIM, LEE ����� �����ϱ�
CREATE USER KIM IDENTIFIED BY kim
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  QUOTA UNLIMITED on users
  QUOTA UNLIMITED on temp;

CREATE USER LEE IDENTIFIED BY lee
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  QUOTA UNLIMITED on users
  QUOTA UNLIMITED on temp;

-- Grant ��ɾ�� ����, ��� ���� �ֱ�
grant connect, resource to KIM;
grant connect, resource to LEE;
