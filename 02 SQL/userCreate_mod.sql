-- KIM, LEE ����� �����ϱ�
CREATE USER KIM IDENTIFIED BY kim;

CREATE USER LEE IDENTIFIED BY lee;

-- Grant ��ɾ�� ����, ��� ���� �ֱ�
grant connect, resource to KIM;
grant connect, resource to LEE;
