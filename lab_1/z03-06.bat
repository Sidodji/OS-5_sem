@Echo off
chcp 1251
if "%1" =="�������" goto DELETE
if "%1" =="�������" goto CREATE
if "%1" == "%2" if "%1" =="" (goto 3ERROR)
if NOT "%1" == "�������" if NOT "%1" == "�������" goto 1ERROR

:1ERROR
echo -- ������ ����������: %1 %2
echo -- �����: %1
echo -- ��� �����: %2
echo ---+ ����� ����� �����������
goto CLOSE

:2ERROR
echo -- ������ ����������: %1 %2
echo -- �����: %1
echo -- ��� �����: %2
echo ---+ �� ������ ��� �����
goto CLOSE

:3ERROR
echo -- ������ ����������: %1 %2
echo -- �����: %1
echo -- ��� �����: %2
echo ---+ ����� �����
echo ---++ ����� = {�������, �������}
echo ---++ ���� = ��� �����
goto CLOSE

:4ERROR
echo -- ������ ����������: %1 %2
echo -- �����: %1
echo -- ��� �����: %2
echo ---+ ���� %2 ��� ����
goto CLOSE

:5ERROR
echo -- ������ ����������: %1 %2
echo -- �����: %1
echo -- ��� �����: %2
echo ---+ ���� %2 �� ������
goto CLOSE

:DELETE
if "%2" == "" goto 2ERROR
if not exist %2 goto 5ERROR
del %2
echo -- ������ ����������: %1 %2
echo -- �����: %1
echo -- ��� �����: %2
echo ���� %2 ������
goto CLOSE

:CREATE
if "%2" == "" goto 2ERROR
if exist %2 goto 4ERROR
dir > %2
echo -- ������ ����������: %1 %2
echo -- �����: %1
echo -- ��� �����: %2
echo ---+ ���� %2 
goto CLOSE 

:CLOSE