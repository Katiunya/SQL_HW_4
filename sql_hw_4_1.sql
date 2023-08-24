DROP DATABASE hw_4;
CREATE DATABASE hw_4;
USE hw_4;

/* Задание 1. Вывести на экран сколько машин каждого цвета для марок BMW и LADA.*/

CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

SELECT * FROM AUTO;

SELECT COLOR, MARK, count(1)
  FROM AUTO 
  WHERE MARK IN ('BMW','LADA') 
  GROUP BY COLOR, MARK;


/* Задание 2. Вывести на экран марку авто и количество авто не этой марки.*/

 
SELECT DISTINCT MARK, (SELECT count(1) 
  FROM AUTO a1 
  WHERE a1.MARK != a.MARK) AS count 
  FROM AUTO a;  

/* Задание 3. Даны 2 таблицы, созданные следующим образом: */

CREATE TABLE test_a (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  data VARCHAR(1)
);


CREATE TABLE test_b (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

INSERT INTO test_a(id,data)
  VALUES
    (10, 'A'),
    (20, 'A'),
    (30, 'F'),
    (40, 'D'),
    (50, 'C');
    
INSERT INTO test_b(id)
  VALUES
    (10),
    (30),
    (50);


/* Напишите запрос, который вернет строки из таблицы test_a, id, которых нет в 
таблице test_b, не используя ключевое слово NOT */    
    
SELECT * FROM test_a;
SELECT * FROM test_b; 

SELECT *
  FROM test_a a 
  LEFT JOIN test_b b 
	ON a.id = b.id
    WHERE b.id IS NULL;    