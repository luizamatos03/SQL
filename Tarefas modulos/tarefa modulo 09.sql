/* 1. Se você é do tempo da Blockbuster, deve lembrar que os filmes mais famosos ou mais novos eram oferecidos em maior quantidade para aluguel 
já que, naturalmente, a demanda por eles era maior que a média. Vamos verificar essa premissa na nossa locadora usando o banco de dados sakila!
a.	Escreva uma consulta que liste, em ordem decrescente, os filmes mais alugados na nossa locadora. 
Utilize a tabela rental para isso, relacionando com a tabela inventory.*/

SELECT inventory.film_id,
	   COUNT(inventory.film_id) AS exemplares,
       SUM(more_rental.tot_rental) AS alugueis
  FROM inventory 
 INNER JOIN (SELECT inventory_id, 
			        COUNT(rental_id) AS tot_rental 
			   FROM rental 
			  GROUP BY inventory_id 
			  ORDER BY tot_rental DESC) AS more_rental 
USING (inventory_id)
GROUP BY inventory.film_id
ORDER BY alugueis DESC;

/* b.	Escreva uma consulta que liste, em ordem decrescente, o número de unidades disponíveis de cada filme na locadora. */

SELECT f.film_id, f.title, COUNT(f.title) AS Qtd
FROM inventory
INNER JOIN film AS f USING (film_id) 
GROUP BY f.title
ORDER BY Qtd DESC;

/* c.	Usando subconsultas, relacione as tabelas resultantes dos itens a) e b) e responda: 
os títulos mais alugados de fato correspondem aos que têm maior número de itens disponíveis? 
Qual consulta você usou para chegar a esse resultado?
Bônus: caso queira, use métricas de descrição estatística (média, percentil) para responder à pergunta de forma mais embasada! 

RESPOSTA: A consulta abaixo demonstra que os títulos com mais exemplares tem a maior quantidade de alugueis.
*/

WITH units AS(
	SELECT f.film_id,
		   f.title, 
		   COUNT(f.title) AS Qtd
      FROM inventory
	 INNER JOIN film AS f USING (film_id) 
	 GROUP BY f.title
	 ORDER BY qtd DESC),

more_rental AS (
	 SELECT inventory_id, 
			COUNT(rental_id) AS tot_rental 
	   FROM rental 
	  GROUP BY inventory_id 
	  ORDER BY tot_rental DESC)
     
SELECT i.film_id,
	   units.title,
	   COUNT(i.film_id) AS exemplares,
       SUM(more_rental.tot_rental) AS alugueis
  FROM inventory AS i 
 INNER JOIN more_rental USING (inventory_id)
 INNER JOIN units USING (film_id)
 GROUP BY i.film_id
 ORDER BY alugueis DESC, exemplares DESC;


/*2.	A view chamada sales_by_film_category traz o resultado total de vendas em aluguéis por categoria dos filmes. 
Escreva uma consulta que complemente essa tabela com as seguintes métricas para cada categoria:

●	Valor médio do aluguel dos filmes por categoria;
●	Valor médio do custo de reposição dos filmes por categoria;*/

-- custos médios por categoria
WITH medias_custo_reposição AS(
				  SELECT f.title, 
						 f_l.category, 
						 AVG(f.replacement_cost) AS medias_custos_reposição
				    FROM sakila.film as f
				   INNER JOIN film_list AS f_l
					  ON f.title = f_l.title
				   GROUP BY f_l.category)
                   
-- junção dos custos médios por categoria com os custos de reposição por categoria.
	SELECT f_l.category, 
           COUNT(f_l.category) AS Qtd_por_categoria, 
           AVG(price) AS media_preço,
           (total_sales/COUNT(f_l.category)) AS media_aluguel,
           medias_custos_reposição
	  FROM sakila.film_list AS f_l
	 INNER JOIN sales_by_film_category AS s_c 
		ON f_l.category = s_c.category
	 INNER JOIN medias_custo_reposição
		ON f_l.category = medias_custo_reposição.category
	 GROUP BY f_l.category;
  
/*Total de vendas por categoria na loja 1;*/
SELECT store_id, 
	   name,
       SUM(amount)
  FROM inventory AS i
 INNER JOIN film_category AS f_c USING (film_id)
 INNER JOIN category AS c USING (category_id)
 INNER JOIN rental AS r USING (inventory_id)
 INNER JOIN payment AS p USING(rental_id)
 WHERE store_id = 1 
 GROUP BY name;

/*●	Total de vendas por categoria na loja 2; (dica: use o comando CASE WHEN)*/
SELECT name AS Categoria,
       SUM(amount) AS soma_vendas,
       CASE
			WHEN store_id THEN 'Loja 2'
            ELSE store_id
			END 'Loja'
  FROM inventory AS i
 INNER JOIN film_category AS f_c USING (film_id)
 INNER JOIN category AS c USING (category_id)
 INNER JOIN rental AS r USING (inventory_id)
 INNER JOIN payment AS p USING(rental_id)
 GROUP BY name;

/* ● Total de títulos disponíveis por categoria (dica: use a tabela inventory) */
WITH categoria_filme AS(
				SELECT f_c.film_id, 
					   c.category_id, 
                       c.name 
				  FROM film_category AS f_c
			     INNER JOIN category AS c 
                    ON f_c.category_id = c.category_id)

SELECT count(i.inventory_id) AS Qtd, categoria_filme.name 
  FROM inventory AS i
 INNER JOIN categoria_filme
	ON i.film_id = categoria_filme.film_id
GROUP BY categoria_filme.name;