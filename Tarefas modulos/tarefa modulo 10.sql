/* Ex. 1: Escreva uma consulta SQL que, com base no total de pagamentos realizados, divida todos os consumidores da locadora em 4 grupos.
Além disso, com a ajuda da função CASE WHEN, classifique consumidores nesses grupos, do de maiores pagadores ao de menores, respectivamente em:
- Especial;
- Fiel;
- Ocasional
- Iniciante; */

-- Query para a coluna de classificação.
SELECT email,
       (CASE 
	    WHEN ordem = 1 THEN "Especial"
            WHEN ordem = 2 THEN "Fiel"
            WHEN ordem = 3 THEN "Ocasional"
            WHEN ordem = 4 THEN "Iniciante"
       END) AS Classificacao,
       total_pago
  FROM (SELECT customer_id,  -- Query para a utilização do NTILE para poder classificar com CASE WHEN e para obter os dados dos emails.
       	       email, 
               total_pago,
               NTILE(4) OVER (ORDER BY total_pago DESC) AS ordem
	  FROM customer
	 INNER JOIN (SELECT customer_id, -- Query para o somatório por cliente.
			    SUM(amount) AS total_pago
		       FROM payment 
		      GROUP BY customer_id
		      ORDER BY total_pago DESC) AS totais
	 USING (customer_id)) AS geral;
      
      
/* Ex. 2: Escreva uma consulta SQL que responda: qual foi a primeira loja da rede a atingir um total de $10.000 no mês de Jul/2005? 
Resposta: a Loja 1 pois chegou ao total  de 10003.09 no dia 2005-07-08 às 10:41:06 e a Loja 2 no total de 10001.19 no dia 2005-07-08 às 18:29:13*/

SELECT totais.payment_date, 
       totais.alugueis, 
       store_id
  FROM staff
 INNER JOIN(SELECT staff_id, 
		   amount,
		   payment_date,
		   SUM(amount) OVER (PARTITION BY staff_id ORDER BY payment_date ROWS UNBOUNDED PRECEDING) AS alugueis
	      FROM payment
	     WHERE payment_date <= '2005-07-31') AS totais
USING (staff_id);
