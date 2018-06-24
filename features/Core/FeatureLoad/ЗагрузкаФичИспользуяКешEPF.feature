﻿# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb

Функциональность: Загрузка epf с использованием кеш известных step definitions
	Как Разработчик
	Я Хочу чтобы была возможность загружать фичи быстрее
	Чтобы быстрее разрабатывать
 
Контекст: 
	Дано     Я сохраняю служебную epf 1 для проверки работы кеш в каталог Templates
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Когда Я открываю VanessaBehavior в режиме TestClient

Сценарий: Проверка работы кеш известных step definitions
	Когда В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиРаботыКеш"
	И     Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Behavior TestClient
	И     Я нажимаю на кнопку выполнить сценарии в Vanessa-Behavior TestClient

	И     В логе сообщений TestClient есть строка "Служебное сообщение 1"

#Теперь перезапустим VB, потом загрузим фичи, потом подменим epf, потом опять загрузим фичи.
#В итоге должно быть другое сообщение и должны быть получены изменения по таблице step definitions.
	
	И     я перехожу к закладке "Сервис"
	И     я нажимаю на кнопку "Сбросить кеш известных step definition"
	И     Я закрываю окно "* Vanessa Automation"
	И     Я открываю VanessaBehavior в режиме TestClient
	И     В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ФичаДляПроверкиРаботыКеш"
	И     Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Behavior TestClient
	И     я перехожу к закладке "Служебная"
	И     я перехожу к закладке "Таблица step definition"
	И     я нажмаю на кнопку Vanessa-Behavior "Запомнить состояние формы TestClient"
	И     Пауза 5
	И     Я сохраняю служебную epf 2 для проверки работы кеш в каталог Templates
	И     Пауза 1
	И     Я нажимаю на кнопку перезагрузить сценарии в Vanessa-Behavior TestClient

	И     Я нажимаю на кнопку выполнить сценарии в Vanessa-Behavior TestClient
	И     В логе сообщений TestClient есть строка "Служебное сообщение 2"
	И     я перехожу к закладке "Служебная"
	И     я перехожу к закладке "Таблица step definition"
	И     я нажмаю на кнопку Vanessa-Behavior "ПолучитьИзмененияФормыGherkin"
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'Версия файла'
	
