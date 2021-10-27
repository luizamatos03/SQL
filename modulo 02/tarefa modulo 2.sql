/* 1. Qual é o nome e sobrenome dos dois funcionários da nossa locadora? */
SELECT * FROM staff;

/* 2. Escreva uma consulta SQL que retorne todos os registros e os atributos
first_name, last_name e email da tabela customer. */

SELECT first_name, 
	     last_name, 
       email 
  FROM customer;

/* 3. Escreva a consulta SQL que retorne a seguinte tabela:
nome_cidade id_pais   id_cidade    ultima_atualizacao
Abu Dhabi    101          3        2006-02-15 04:45:25
Acua         60           4        2006-02-15 04:45:25 */
SELECT city AS nome_cidade,
	     country_id AS id_pais,
       city_id AS id_cidade,
       last_update AS ultima_atualizacao
  FROM city;

/* 4. Escreva uma consulta SQL que retorne a lista única de distritos na tabela address
○ Dica: a coluna district representa o distrito de cada endereço */
SELECT DISTINCT district FROM address;