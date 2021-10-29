/* Além da sintaxe INNER JOIN, estudamos diversas outras opções de relacionamentos entre tabelas SQL, que a partir de agora te permitem explorar as mais diversas bases de dados. Não haverá um dia no seu trabalho com
SQL em que você não irá fazer um relacionamento!
Antes de caminharmos para o próximo módulo, estude o conteúdo e responda às perguntas:
	1. A gestão da locadora decidiu que no mês de julho de 2005 haverá um prêmio para o funcionário que mais registrou vendas, e pediu sua ajuda para determinar a premiação.
		a. Usando a tabela staff como driving table, escreva uma consulta SQL que traga todas as vendas realizadas por
		cada funcionário no mês de julho de 2005. Não é permitido utilizar o filtro WHERE!*/

 SELECT first_name AS Nome, 
	last_name AS Sobrenome,
	amount AS Valor_venda, 
	payment_date AS Data_venda
   FROM staff
  RIGHT JOIN payment
     ON staff.staff_id = payment.staff_id
 HAVING payment.payment_date BETWEEN '2005-07-01' AND '2005-07-31'
  ORDER BY payment_date;



/* c. Altere essa consulta para trazer o total em pagamentos processados por cada funcionário. */

 SELECT first_name AS Nome, 
        last_name AS Sobrenome,
        sum(amount) AS Total_vendas
   FROM staff
  RIGHT JOIN payment
     ON staff.staff_id = payment.staff_id
  WHERE payment_date BETWEEN '2005-06-01' AND '2005-06-30'
  GROUP BY staff.staff_id
  ORDER BY Total_vendas DESC;

/* 2. Na tarefa do módulo anterior, você descobriu que alguns aluguéis ainda não foram devolvidos. Precisamos buscar esses itens! Escreva uma consulta que retorne a 
lista de emails das pessoas que estão com aluguéis pendentes, e o número de itens a serem retornados.
Bônus opcional: utilize a função GROUP_CONCAT, que estudamos no módulo 5, para retornar também uma lista com o nome dos filmes que devem ser devolvidos. */

SELECT c.first_name, 
       c.last_name, 
       c.email,
       COUNT(r.rental_id) AS qnt_titulo,
       GROUP_CONCAT(title) AS titulos
  FROM rental AS r
 INNER JOIN customer AS c USING (customer_id)
 INNER JOIN inventory AS i  USING (inventory_id)
 INNER JOIN film AS f USING (film_id)
 WHERE return_date IS NULL
 GROUP BY first_name, email
 ORDER BY qnt_titulo DESC;
