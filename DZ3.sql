--=============== МОДУЛЬ 3. ОСНОВЫ SQL =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Выведите для каждого покупателя его адрес проживания, 
--город и страну проживания.
SELECT concat(a.first_name,' ',a.last_name) "Customer name" ,b.address,c.city,d.country
FROM customer a
left join address b ON a.address_id=b.address_id 
left join city c ON b.city_id=c.city_id
left join country d ON c.country_id=d.country_id



--ЗАДАНИЕ №2
--С помощью SQL-запроса посчитайте для каждого магазина количество его покупателей.
SELECT b.store_id "ID магазина",count(a.store_id) "Количество покупателей" 
FROM customer a
left join store b ON a.store_id=b.store_id
group by b.store_id




--Доработайте запрос и выведите только те магазины, 
--у которых количество покупателей больше 300-от.
--Для решения используйте фильтрацию по сгруппированным строкам 
--с использованием функции агрегации.
SELECT b.store_id "ID магазина",count(a.store_id) "Количество покупателей" 
FROM customer a
left join store b ON a.store_id=b.store_id
group by b.store_id
having  count(a.store_id)>300




-- Доработайте запрос, добавив в него информацию о городе магазина, 
--а также фамилию и имя продавца, который работает в этом магазине.
SELECT b.store_id "ID магазина",count(a.store_id) "Количество покупателей" ,d.city "Город", concat(s.last_name,' ',s.first_name) "Имя сотрудника"
FROM customer a
left join store b ON a.store_id=b.store_id
left join address c ON c.address_id=b.address_id 
left join city d ON d.city_id=c.city_id
left join staff s  ON s.store_id=b.store_id
group by b.store_id,d.city_id,s.staff_id 
having  count(a.store_id)>300




--ЗАДАНИЕ №3
--Выведите ТОП-5 покупателей, 
--которые взяли в аренду за всё время наибольшее количество фильмов
SELECT concat(a.last_name,' ',a.first_name) "Фамилия и имя покупателя",count(c.film_id)  "Количество фильмов"
FROM customer a
left join rental b ON a.customer_id=b.customer_id
left join inventory c ON c.inventory_id=b.inventory_id 
group by a.customer_id
order by count(c.film_id) desc
limit 5



--ЗАДАНИЕ №4
--Посчитайте для каждого покупателя 4 аналитических показателя:
--  1. количество фильмов, которые он взял в аренду
--  2. общую стоимость платежей за аренду всех фильмов (значение округлите до целого числа)
--  3. минимальное значение платежа за аренду фильма
--  4. максимальное значение платежа за аренду фильма
SELECT concat(a.last_name,' ',a.first_name) "Фамилия и имя покупателя",count(c.film_id)  "Количество фильмов",round(sum(d.amount)) "Общая стоимость платежей",
min(d.amount) "Минимальная стоимость платежа", max(d.amount) "Максимальная стоимость платежа"
FROM customer a
left join rental b ON a.customer_id=b.customer_id
left join inventory c ON c.inventory_id=b.inventory_id 
left join payment  d ON d.rental_id=b.rental_id 
group by a.customer_id 





--ЗАДАНИЕ №5
--Используя данные из таблицы городов, составьте все возможные пары городов так, чтобы 
--в результате не было пар с одинаковыми названиями городов. Решение должно быть через Декартово произведение.
 
SELECT a.city "Город 1",b.city "Город 2"
FROM city a
CROSS JOIN city b
where a.city != b.city
ORDER BY a.city, b.city




--ЗАДАНИЕ №6
--Используя данные из таблицы rental о дате выдачи фильма в аренду (поле rental_date) и 
--дате возврата (поле return_date), вычислите для каждого покупателя среднее количество 
--дней, за которые он возвращает фильмы. В результате должны быть дробные значения, а не интервал.
 select customer_id "ID покупателя",round(avg(return_date::date-rental_date::date),2) 
 from rental r 
 group by customer_id 
 order by customer_id 




--======== ДОПОЛНИТЕЛЬНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Посчитайте для каждого фильма сколько раз его брали в аренду и значение общей стоимости аренды фильма за всё время.





--ЗАДАНИЕ №2
--Доработайте запрос из предыдущего задания и выведите с помощью него фильмы, которые отсутствуют на dvd дисках.





--ЗАДАНИЕ №3
--Посчитайте количество продаж, выполненных каждым продавцом. Добавьте вычисляемую колонку "Премия".
--Если количество продаж превышает 7300, то значение в колонке будет "Да", иначе должно быть значение "Нет".







