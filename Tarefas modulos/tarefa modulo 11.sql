/* 1.	Conhecendo funções de datas, você pode agora conhecer mais sobre algumas métricas de performance de vendas das lojas. Escreva consultas que retornem:*/
	-- a.	A quantidade de aluguéis por mês por loja.
    
    SELECT MONTH(rental_date) AS mes_dos_alugueis,
           YEAR(rental_date) AS ano_dos_alugueis,
           COUNT(rental_date) AS qtd_alugueis,
           staff_id AS Loja
      FROM rental
     GROUP BY MONTH(rental_date), staff_id
     ORDER BY ano_dos_alugueis, mes_dos_alugueis, qtd_alugueis DESC;
            
            
  -- b.	O valor total pago por mês em toda a rede.
  
  SELECT CONCAT(MONTH(rental_date), " / ", YEAR(rental_date)) AS data_alugueis,
         COUNT(rental_date) AS qtd_alugueis
    FROM rental
   GROUP BY YEAR(rental_date), MONTH(rental_date);
		 
         
-- c.	A quantidade de aluguéis por semana entre maio e junho de 2005. Qual semana teve a melhor performance?
SELECT COUNT(rental_id),
	   CASE
	   WHEN p.semana = 21 THEN 'semana de 24 a 28/05/2005'
           WHEN p.semana = 22 THEN 'semana de 29 a 31/05/2005'
           WHEN p.semana = 24 THEN 'semana de 14 a 18/06/2005'
           WHEN p.semana = 25 THEN 'semana de 19 a 21/06/2005'
	   END AS 'semana'
 FROM (SELECT rental_id,
	      rental_date,
              EXTRACT(WEEK FROM rental_date) AS semana
         FROM rental
	WHERE rental_date >= '2005-05-01' AND rental_date <= '2005-06-30') AS p
        GROUP BY p.semana;

        
        
/* 2.	A gerência da rede deseja entender se no mês de maio de 2005 houve diferença na recorrência dos consumidores fidelizados (ou seja, que realizaram mais de um aluguel) 
entre as duas lojas. Seu desafio é escrever uma consulta que retorne o número médio de dias entre os aluguéis desses consumidores, 
por loja que estão registrados. Dicas de como construir essa consulta:
		-	Descubra, primeiro, quem são os consumidores (pelo seu customer_id) que queremos analisar: realizaram dois ou mais aluguéis no mês de maio de 2005.
		-	Depois, avalie a diferença de tempo entre cada aluguel e o seguinte, por consumidor. Você precisará de uma função de janela para isso.
		-	Por fim, calcule a média de tempo entre aluguéis para cada uma das lojas. Lembre-se que a tabela customer indica qual loja cada pessoa se cadastrou.
	Com isso, responda: há diferença no número médio de dias entre aluguéis desse segmento de consumidores para as duas lojas? */ 
    
-- Descubra, primeiro, quem são os consumidores (pelo seu customer_id) que queremos analisar: realizaram dois ou mais aluguéis no mês de maio de 2005.
SELECT COUNT(r.rental_id) AS qnt_alugueis,
       name
  FROM rental AS r
 INNER JOIN customer_list
       ON r.customer_id = ID
 WHERE MONTH(r.rental_date) = '05'
 GROUP BY name
 ORDER BY qnt_alugueis DESC;


-- Depois, avalie a diferença de tempo entre cada aluguel e o seguinte, por consumidor. Você precisará de uma função de janela para isso.
SELECT name, 
       rental_date, 
       data_ultm_pedido, 
       diferenca_dias,
       COUNT(rental_id) OVER (PARTITION BY name ORDER BY name) AS qtd_alugueis
  FROM (SELECT r.rental_id,
	       name,
	       r.rental_date,
	       LAG (rental_date, 1, rental_date) OVER (PARTITION BY name ORDER BY name, rental_date) AS data_ultm_pedido,
	       DATEDIFF(rental_date, LAG (rental_date, 1, rental_date) OVER (PARTITION BY name ORDER BY name, rental_date)) AS diferenca_dias
          FROM rental AS r
	 INNER JOIN customer_list
            ON r.customer_id = ID
	 WHERE MONTH(r.rental_date) = '05'
	 ORDER BY name, rental_date) AS p
 ORDER BY qtd_alugueis DESC, name, data_ultm_pedido;        
    
    
-- Por fim, calcule a média de tempo entre aluguéis para cada uma das lojas. Lembre-se que a tabela customer indica qual loja cada pessoa se cadastrou.

WITH p AS          
	 (SELECT r.rental_id, -- Query para descobrir a diferença dos dias entre os alugueis.
	         first_name, 
	         last_name,
	         r.rental_date,
		 LAG (rental_date, 1, rental_date) OVER (PARTITION BY first_name, last_name ORDER BY first_name, rental_date) AS data_ultm_pedido,
			 DATEDIFF(rental_date, LAG (rental_date, 1, rental_date) OVER (PARTITION BY first_name, last_name ORDER BY first_name, rental_date)) AS diferenca_dias,
		     store_id
		FROM rental AS r
	  INNER JOIN customer USING (customer_id)
	  WHERE MONTH(r.rental_date) = '05'
	  ORDER BY first_name, rental_date)
	
SELECT DISTINCT store_id, -- Query principal para a média de dias de cada locadora.
       AVG(p.diferenca_dias) OVER (PARTITION BY store_id) AS media_dias
  FROM p;


/* 3.	Reescreva a consulta da tarefa do Módulo 3, dessa vez utilizando um filtro com expressões regulares: 
quais filmes disponíveis na locadora têm indicação de orientação parental (PG ou PG-13)? */
-- Experimentei fazer 3 modos diferentes.

-- Modo 1
SELECT title,
       rating 
  FROM sakila.film_list 
 WHERE REGEXP_LIKE(rating, 'PG')
 ORDER BY rating;
 
 -- Modo 2
SELECT title,
       rating
  FROM film_list
 WHERE rating LIKE "PG%";

-- Modo 3
SELECT title, 
       rating
  FROM film_list
 WHERE rating LIKE "PG" OR rating LIKE "PG-13";
