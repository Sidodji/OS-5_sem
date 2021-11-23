@Echo off
chcp 1251
if "%1" =="удалить" goto DELETE
if "%1" =="создать" goto CREATE
if "%1" == "%2" if "%1" =="" (goto 3ERROR)
if NOT "%1" == "удалить" if NOT "%1" == "создать" goto 1ERROR

:1ERROR
echo -- строка параметров: %1 %2
echo -- режим: %1
echo -- имя файла : %2
echo ---+ режим задан некорректно
goto CLOSE

:2ERROR
echo -- строка параметров: %1 %2
echo -- режим: %1
echo -- имя файла : %2
echo ---+ не задано имя файла 
goto CLOSE

:3ERROR
echo -- строка параметров: %1 %2
echo -- режим: %1
echo -- имя файла: %2
echo ---+ режим файла
echo ---++ режим = {удалить, создать}
echo ---++ файл = имя файла
goto CLOSE

:4ERROR
echo -- строка параметров: %1 %2
echo -- режим: %1
echo -- имя файла: %2
echo ---+ файл %2 уже есть
goto CLOSE

:5ERROR
echo -- строка параметров: %1 %2
echo -- режим: %1
echo -- имя файла: %2
echo ---+ файл %2 не найден
goto CLOSE

:DELETE
if "%2" == "" goto 2ERROR
if not exist %2 goto 5ERROR
del %2
echo -- строка параметров: %1 %2
echo -- режим: %1
echo -- имя файла: %2
echo файл %2 удален
goto CLOSE

:CREATE
if "%2" == "" goto 2ERROR
if exist %2 goto 4ERROR
dir > %2
echo -- строка параметров: %1 %2
echo -- режим: %1
echo -- имя файла: %2
echo ---+ файл %2 
goto CLOSE 

:CLOSE