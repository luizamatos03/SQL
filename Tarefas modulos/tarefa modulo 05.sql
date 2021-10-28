/* 1. Conte o número de registros nas tabelas seguintes. Além do número, escreva para cada item pelo menos 3
consultas com formas diferentes de chegar a esse resultado:
a. Customer */
SELECT COUNT(customer_id) 
  FROM sakila.customer;

SELECT COUNT(email) 
  FROM sakila.customer;

SELECT COUNT(DISTINCT address_id) 
  FROM sakila.customer;


/* b. Film */
SELECT COUNT(film_id) 
  FROM sakila.film; 

SELECT COUNT(title) 
  FROM sakila.film;

SELECT COUNT(DISTINCT description) 
  FROM sakila.film; 


/* c. Rental */
SELECT COUNT(rental_id) 
  FROM sakila.rental;

SELECT COUNT(inventory_id) 
  FROM sakila.rental;

SELECT COUNT(customer_id) 
  FROM sakila.rental;

/* 2. Qual foi o valor médio pago por aluguéis de filmes (tabela payment) no mês de junho de 2015? */
SELECT AVG(amount) AS preco_medio 
  FROM sakila.payment 
 WHERE "2005-06-01" <= payment_date <= "2005-06-30";

 /* Quantos pagamentos foram realizados nesse período? Escreva a consulta utilizada! */
SELECT COUNT(payment_date) 
  FROM sakila.payment 
 WHERE payment_date BETWEEN "2005-06-01" AND "2005-06-30";

/* 3. Em uma locadora, é comum haver um custo associado a cada filme para reposição, em caso de perda ou dano
ao item. Qual é o maior custo de reposição (tabela film) no inventário atual? Descreva dois processos por meio
dos quais você pode chegar a essa informação. */
SELECT MAX(replacement_cost) 
  FROM sakila.film;

SELECT * 
  FROM sakila.film 
 ORDER BY replacement_cost DESC;

/* 4. Escreva uma consulta que, a partir da tabela film, retorne o seguinte resultado: */
SELECT rental_duration AS duracao_aluguel, 
       COUNT(title) AS total_filmes, 
       AVG (length) AS media_duracao_filme 
  FROM sakila.film 
 GROUP BY 1 
 ORDER BY rental_duration;

 /* 5. Responda: quantos e quais consumidores (representados pelo atributo customer_id) já tiveram um total de
pagamentos (tabela payment) maior que 200? Escreva uma consulta SQL que retorne esse resultado.
Dica: utilize a cláusula HAVING para facilitar seu trabalho! */
SELECT customer_id, 
       SUM(amount)
  FROM sakila.payment 
 GROUP BY 1 
HAVING SUM(amount) > 200;

