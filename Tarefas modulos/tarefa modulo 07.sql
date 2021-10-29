/* 1. Escreva uma consulta SQL que:
    ○ Parta da tabela film (dica: essa será a tabela ao lado do comando FROM)
    ○ Relacione todas as tabelas com prefixo film_
    ○ Não tenha colunas redundantes no resultado final (ou seja, as colunas em comum devem ser removidas da
    consulta) */

SELECT film_actor.actor_id, 
       film.*, 
       film_category.category_id
  FROM sakila.film_actor
 INNER JOIN sakila.film
    ON film_actor.film_id = film.film_id
 INNER JOIN sakila.film_category
    ON film_category.film_id = film.film_id
 INNER JOIN sakila.film_text
    ON film_text.film_id = film.film_id
 GROUP BY film.film_id;

 /* 2. Esse mês, iremos oferecer um prêmio para todos os consumidores que já alugaram mais de 40 filmes! Para
auxiliar na estratégia, a equipe responsável precisa da sua ajuda para identificar quem são essas pessoas, e
gerar uma base com seus dados de contato (nome, sobrenome, email e cidade da loja de cadastro).
Dicas: sua consulta final deverá retornar as 4 colunas listadas acima, e você precisará fazer a união
entre diversas tabelas para isso. Caso necessário, revise o módulo 5 - Funções de Agregação.*/

 SELECT first_name AS nome,
        last_name AS sobrenome,
        email,
        city.city AS cidade_loja,
        count(rental_id) AS total_aluguel
   FROM sakila.customer
  INNER JOIN sakila.rental 
     ON rental.customer_id = customer.customer_id
  INNER JOIN sakila.store 
     ON customer.store_id = store.store_id
  INNER JOIN sakila.address 
     ON store.address_id = address.address_id
  INNER JOIN sakila.city 
     ON address.city_id = city.city_id
  GROUP BY customer.first_name
 HAVING count(rental_id) >= 40
  ORDER BY count(rental_id) DESC; 

  /* 3. Crie uma consulta que relaciona a tabela inventory com outras tabelas. Com base no seu código e nos
resultados, o que você imagina que essa tabela representa? */

SELECT count(inventory.store_id) AS exemplares, 
       inventory.film_id, 
       inventory.store_id,
       city.city, 
       film.title, 
       category.category_id,
       category.name, 
       film.description, 
       rating, 
       length
  FROM sakila.inventory
 INNER JOIN sakila.film 
    ON inventory.film_id = film.film_id
 INNER JOIN sakila.film_category 
    ON film_category.film_id = film.film_id
 INNER JOIN sakila.category 
    ON category.category_id = film_category.category_id
 INNER JOIN sakila.store 
    ON store.store_id = inventory.store_id
 INNER JOIN sakila.address 
    ON address.address_id = store.address_id
 INNER JOIN sakila.city 
    ON city.city_id = address.city_id
 GROUP BY description, inventory.store_id
 ORDER BY inventory_id; 

 /* 4. Com base na tabela rental, podemos ver que alguns aluguéis não foram devolvidos (registros em que a
coluna return_date é nula). Qual é o valor total pago por esses aluguéis? */

SELECT count(rental_date) AS nao_devolvidos, 
       SUM(amount) AS totalpago
  FROM sakila.rental
 INNER JOIN sakila.payment 
    ON payment.rental_id = rental.rental_id
 WHERE return_date IS NULL;