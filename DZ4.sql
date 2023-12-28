--=============== МОДУЛЬ 4. УГЛУБЛЕНИЕ В SQL =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--База данных: если подключение к облачной базе, то создаёте новую схему с префиксом в --виде фамилии, название должно быть на латинице в нижнем регистре и таблицы создаете --в этой новой схеме, если подключение к локальному серверу, то создаёте новую схему и --в ней создаёте таблицы.

--Спроектируйте базу данных, содержащую три справочника:
--· язык (английский, французский и т. п.);
--· народность (славяне, англосаксы и т. п.);
--· страны (Россия, Германия и т. п.).
--Две таблицы со связями: язык-народность и народность-страна, отношения многие ко многим. Пример таблицы со связями — film_actor.
--Требования к таблицам-справочникам:
--· наличие ограничений первичных ключей.
--· идентификатору сущности должен присваиваться автоинкрементом;
--· наименования сущностей не должны содержать null-значения, не должны допускаться --дубликаты в названиях сущностей.
--Требования к таблицам со связями:
--· наличие ограничений первичных и внешних ключей.

--В качестве ответа на задание пришлите запросы создания таблиц и запросы по --добавлению в каждую таблицу по 5 строк с данными.
 
--СОЗДАНИЕ ТАБЛИЦЫ ЯЗЫКИ
create table language_dz (
language_id serial primary key,
language_name varchar(50) not null unique )



--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ ЯЗЫКИ
insert into language_dz (language_name)
values ('Русский'),('Турецкий'),('Арабский'),('Китайский'),('Белорусский')


--СОЗДАНИЕ ТАБЛИЦЫ НАРОДНОСТИ
create table nationality_dz (
nationality_id serial primary key,
nationality_name varchar(50) not null unique )


--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ НАРОДНОСТИ

insert into nationality_dz (nationality_name)
values ('Русский'),('Турок'),('Араб'),('Китаец'),('Белорус')



--СОЗДАНИЕ ТАБЛИЦЫ СТРАНЫ
create table country_dz (
country_id serial primary key,
country_name varchar(50) not null unique )


--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ СТРАНЫ
insert into country_dz (country_name)
values ('Россия'),('Турция'),('Египет'),('Китай'),('Белоруссия')


--СОЗДАНИЕ ПЕРВОЙ ТАБЛИЦЫ СО СВЯЗЯМИ
create table language_nationality_dz  (
language_id int2 references language_dz(language_id)   ,
nationality_id int2 references nationality_dz(nationality_id))



--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ СО СВЯЗЯМИ
insert into language_nationality_dz(language_id,nationality_id)
values (1,1)

insert into language_nationality_dz(language_id,nationality_id)
values (2,2)

insert into language_nationality_dz(language_id,nationality_id)
values (3,3)

insert into language_nationality_dz(language_id,nationality_id)
values (4,4)

insert into language_nationality_dz(language_id,nationality_id)
values (5,5)


alter table language_nationality_dz
add constraint language_nationality_dz_pk
primary key (language_id,nationality_id)



--СОЗДАНИЕ ВТОРОЙ ТАБЛИЦЫ СО СВЯЗЯМИ
create table nationality_country_dz  (
country_id int2 references country_dz(country_id)   ,
nationality_id int2 references nationality_dz(nationality_id))


--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ СО СВЯЗЯМИ
insert into nationality_country_dz(country_id,nationality_id)
values (1,1)

insert into nationality_country_dz(country_id,nationality_id)
values (2,2)

insert into nationality_country_dz(country_id,nationality_id)
values (3,3)

insert into nationality_country_dz(country_id,nationality_id)
values (4,4)

insert into nationality_country_dz(country_id,nationality_id)
values (5,5)

alter table nationality_country_dz
add constraint nationality_country_dz_dz_pk
primary key (country_id,nationality_id)



--======== ДОПОЛНИТЕЛЬНАЯ ЧАСТЬ ==============


--ЗАДАНИЕ №1 
--Создайте новую таблицу film_new со следующими полями:
--·   	film_name - название фильма - тип данных varchar(255) и ограничение not null
--·   	film_year - год выпуска фильма - тип данных integer, условие, что значение должно быть больше 0
--·   	film_rental_rate - стоимость аренды фильма - тип данных numeric(4,2), значение по умолчанию 0.99
--·   	film_duration - длительность фильма в минутах - тип данных integer, ограничение not null и условие, что значение должно быть больше 0
--Если работаете в облачной базе, то перед названием таблицы задайте наименование вашей схемы.



--ЗАДАНИЕ №2 
--Заполните таблицу film_new данными с помощью SQL-запроса, где колонкам соответствуют массивы данных:
--·       film_name - array['The Shawshank Redemption', 'The Green Mile', 'Back to the Future', 'Forrest Gump', 'Schindlers List']
--·       film_year - array[1994, 1999, 1985, 1994, 1993]
--·       film_rental_rate - array[2.99, 0.99, 1.99, 2.99, 3.99]
--·   	  film_duration - array[142, 189, 116, 142, 195]



--ЗАДАНИЕ №3
--Обновите стоимость аренды фильмов в таблице film_new с учетом информации, 
--что стоимость аренды всех фильмов поднялась на 1.41



--ЗАДАНИЕ №4
--Фильм с названием "Back to the Future" был снят с аренды, 
--удалите строку с этим фильмом из таблицы film_new



--ЗАДАНИЕ №5
--Добавьте в таблицу film_new запись о любом другом новом фильме



--ЗАДАНИЕ №6
--Напишите SQL-запрос, который выведет все колонки из таблицы film_new, 
--а также новую вычисляемую колонку "длительность фильма в часах", округлённую до десятых



--ЗАДАНИЕ №7 
--Удалите таблицу film_new