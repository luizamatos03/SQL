/* 1. Analise a tabela rental e responda:
a. Qual é a ordenação padrão da tabela? Qual comando você utilizou para analisar?
Resposta: Ascendente da coluna rental_id. */

/* b. Qual consulta SQL você pode usar para ordenar os registros de forma descendente por data de retorno do
DVD? */
SELECT * FROM sakila.rental ORDER BY return_date DESC;

/* c. Qual consulta SQL você pode usar para ordenar os registros de forma combinada: ascendente por id do
consumidor, e ascendente por data de retorno do DVD? */
SELECT * FROM sakila.rental ORDER BY customer_id, return_date;

/* d. O que acontece com os valores NULL na ordenação?
Resposta: São exibidos no começo da ordenação. Temos valores null na coluna return_date. Nesse
caso, após a ordenação da coluna customer_id, o valor null da coluna return_date aparece antes de todos os
outros. */

/*2. Quais são as combinações únicas de features especiais (coluna special_features) dos filmes? Qual consulta você
utilizou para chegar a esse resultado?*/
SELECT DISTINCT special_features FROM film;

/* 3. Você está ajudando a equipe de desenvolvimento a criar uma nova funcionalidade no sistema da locadora,
permitindo que a equipe de atendentes liste os consumidores de maneira similar a seus celulares, ordenando
por sobrenome ascendente e nome descendente (exemplo abaixo). Qual consulta SQL você pode usar para esse
objetivo? */

SELECT last_name, first_name FROM customer ORDER BY last_name ASC, first_name DESC;

