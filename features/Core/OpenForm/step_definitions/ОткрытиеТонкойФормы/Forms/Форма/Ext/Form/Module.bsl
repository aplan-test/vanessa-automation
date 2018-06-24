﻿//начало текста модуля
&НаКлиенте
Перем Ванесса;

&НаКлиенте
Функция ДобавитьШагВМассивТестов(МассивТестов,Снипет,ИмяПроцедуры,ПредставлениеТеста = Неопределено,Транзакция = Неопределено,Параметр = Неопределено)
	Структура = Новый Структура;
	Структура.Вставить("Снипет",Снипет);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ПредставлениеТеста",ПредставлениеТеста);
	Структура.Вставить("Транзакция",Транзакция);
	Структура.Вставить("Параметр",Параметр);
	МассивТестов.Добавить(Структура);
КонецФункции

&НаКлиенте
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯРаботаюСVanessa_behaviorepf()","ЯРаботаюСVanessa_behaviorepf","я работаю с vanessa-behavior.epf");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯМогуОткрытьФормуОбработки()","ЯМогуОткрытьФормуОбработки","я могу открыть форму обработки");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯМогуЗакрытьФормуОбработки()","ЯМогуЗакрытьФормуОбработки","я могу закрыть форму обработки");

	Возврат ВсеТесты;
КонецФункции

&НаКлиенте
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры


&НаКлиенте
//я работаю с vanessa-behavior.epf
//@ЯРаботаюСVanessa_behaviorepf()
Процедура ЯРаботаюСVanessa_behaviorepf() Экспорт
	//Сообщить(Ванесса.КаталогИнструментов);
	ПутьКОбработке = Ванесса.Объект.КаталогИнструментов + "\vanessa-automation.epf";
	//Файл = Новый Файл(ПутьКОбработке);
	//Ванесса.ПроверитьРавенство(Файл.Существует(),Истина,"Существует файл vanessa-behavior.epf");
	
	Контекст.Вставить("ПутьКОбработке",ПутьКОбработке);
КонецПроцедуры


//&НаСервере
//Функция ПодключитьВнешнююОбработкуСервер(АдресХранилища)
//	Возврат ВнешниеОбработки.Подключить(АдресХранилища,,Ложь); 
//КонецФункции 


//&НаКлиенте
//Функция ПодключитьВнешнююОбработкуКлиент(ИмяФайла)
//	ЕстьПоддержкаНемодальныхФорм = Ванесса.УзнатьЕстьПоддержкаНемодальныхФорм();
//	
//	
//	ДополнительныеПараметры = Новый Структура;
//	Если ЕстьПоддержкаНемодальныхФорм Тогда
//		Оповещение = Вычислить("Новый ОписаниеОповещения(""ОбработкаПослеПомещенияФайла"", ЭтаФорма, ДополнительныеПараметры)");
//		Выполнить("НачатьПомещениеФайла(Оповещение,, ИмяФайла, Ложь, УникальныйИдентификатор);");
//		
//		Возврат ДополнительныеПараметры.ИмяОбработки;
//	Иначе
//		АдресХранилища = "";
//		ПоместитьФайл(АдресХранилища, ИмяФайла, , Ложь, УникальныйИдентификатор);
//		//ПодключитьВнешнююОбработку(АдресХранилища);
//		Результат = Неопределено;
//		ИмяОбработки = ПодключитьВнешнююОбработкуСервер(АдресХранилища);
//		Возврат ИмяОбработки;
//		
//		//ОбработкаПолученияФайлаОбработкиТеста(Результат,АдресХранилища,ИмяФайла,ДополнительныеПараметры);
//	КонецЕсли;
//КонецФункции 


&НаКлиенте
//я могу открыть форму обработки
//@ЯМогуОткрытьФормуОбработки()
Процедура ЯМогуОткрытьФормуОбработки() Экспорт
	ИмяОбработки = Ванесса.ПодключитьВнешнююОбработкуКлиент(Контекст.ПутьКОбработке);
	ФормаОбработки = ПолучитьФорму("ВнешняяОбработка." + ИмяОбработки + ".Форма.УправляемаяФорма",,,Истина);
	Ванесса.ПроверитьНеРавенство(ФормаОбработки.Открыта(),Истина,"Форма обработки должна быть закрыта.");
	
	ФормаОбработки.Объект.РежимСамотестирования = Истина;
	ФормаОбработки.Открыть();
	
	Ванесса.ПроверитьРавенство(ФормаОбработки.Открыта(),Истина,"Форма обработки должна открыться.");
	
	Контекст.Вставить("ФормаОбработки",ФормаОбработки);
КонецПроцедуры

&НаКлиенте
//я могу закрыть форму обработки
//@ЯМогуЗакрытьФормуОбработки()
Процедура ЯМогуЗакрытьФормуОбработки() Экспорт
	ФормаОбработки = Контекст.ФормаОбработки;
	ФормаОбработки.Закрыть();
	
	Ванесса.ПроверитьРавенство(ФормаОбработки.Открыта(),Ложь,"Форма обработки должна закрыться.");
КонецПроцедуры

//окончание текста модуля