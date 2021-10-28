/* 1. A equipe comercial da locadora está criando uma nova estratégia e pediu que você classificasse os filmes
do catálogo de acordo com seu preço de aluguel. A regra para a classificação é:
○ Aluguel menor ou igual a 0.99: Básico
○ Aluguel entre 0.99 e 2.99: Essencial
○ Aluguel maior que 2.99: Exclusivo
Escreva uma consulta SQL que, a partir da tabela film, retorne a lista classificada, contendo as colunas: id,
nome do filme, preço de aluguel e classificação. */

SELECT title, 
       rental_rate, 
       CASE 
         WHEN rental_rate > 2.99 THEN "Exclusivo"
         WHEN rental_rate <= 2.99 AND rental_rate > 0.99 THEN "Essencial"
         WHEN rental_rate <= 0.99 THEN "Basic" 
       END AS classif_alguel 
  FROM sakila.film;

/* 2. A tabela customer contém: dados das pessoas cadastradas na rede de locadoras, identificação da loja que
a pessoa se cadastrou (a partir da coluna store_id) e também se o cadastro está ativo ou não (coluna active).
Escreva uma consulta SQL que utilize o comando CASE WHEN e retorne a contagem de consumidores ativos e inativos 
para cada uma das lojas. Dica: existem 4 possibilidades de resultados (lojas 1 e 2, e pessoa ativa ou inativa) */
SELECT 
       COUNT(CASE WHEN active = 0 AND store_id = 1 THEN "Inativos loja 1" ELSE NULL END) AS loja_01_inativos,
       COUNT(CASE WHEN active = 1 AND store_id = 1 THEN "Ativos loja 1" ELSE NULL END) AS loja_01_ativos,
       COUNT(CASE WHEN active = 0 AND store_id = 2 THEN "Inativos loja 2" ELSE NULL END) AS loja_02_inativos,
       COUNT(CASE WHEN active = 1 AND store_id = 2 THEN "Ativos loja 2"ELSE NULL END) AS loja_02_inativos
  FROM sakila.customer; 

/* 3. Utilizando os conceitos já estudados em módulos anteriores, qual outra estratégia poderia ser utilizada
para atingir o mesmo resultado da pergunta acima? Escreva a consulta SQL. */
SELECT store_id,
       SUM(active) AS ativos,
       COUNT(active) - SUM(active) AS inativos
  FROM sakila.customer 
 GROUP BY store_id;

 /* 4. Na tabela address, a coluna city_id representa a cidade na qual aquele endereço está situado. Como você
pode já ter percebido, ela faz referência à tabela city, que também contém uma coluna de mesmo nome.
Consultando manualmente o nome da cidade para os 5 primeiros registros da tabela address (registros
com address_id entre 1 e 5), escreva uma consulta SQL que retorne o endereço e o nome da cidade à qual
ele se refere.
Dica: use a sintaxe CASE WHEN, acompanhada da relação que você descobrir entre os valores de
city_id nas duas tabelas. */ 
SELECT city_id,
       address,
       CASE
         WHEN city_id = 1 THEN "A Corua (La Corua)"
         WHEN city_id = 2 THEN "Abha"
         WHEN city_id = 3 THEN "Abu Dhabi"
         WHEN city_id = 4 THEN "Acua"
         WHEN city_id = 5 THEN "Adana" 
       END AS cidades
  FROM sakila.address 
 WHERE city_id >=1 AND city_id <=5 
 ORDER BY 1;

 SELECT address.city_id, 
        address.address, 
        city.city 
   FROM sakila.address
  INNER JOIN sakila.city 
     ON address.city_id = city.city_id 
  WHERE address.city_id >= 1 AND address.city_id <= 5; 
