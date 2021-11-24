-- INSERINDO DADOS NA TABELA CAD_ALUNOS
INSERT INTO cad_alunos (id, nome, nascimento, sexo, endereco, cep, email)
	VALUES (1, 'Aimil Locard', '1970/10/07', 'Polygender', '0957 Burning Wood Circle', null, 'alocard0@timesonline.co.uk'),
		   (2, 'Rodrick Burren', '1952/03/01', 'Non-binary', '24259 Londonderry Park', null, 'rburren1@virginia.edu'),
		   (3, 'Cecile Krugmann', '1973/08/29', 'Bigender', '91 Katie Way', '68220', 'ckrugmann2@deliciousdays.com'),
		   (4, 'Robin Inmett', '1983/04/19', 'Bigender', '4237 Debra Circle', '349115', 'rinmett3@baidu.com'),
		   (5, 'Chuck Tichner', '1963/07/08', 'Female', '13 Russell Street', '636708', 'ctichner4@rediff.com'),
		   (6, 'Moria Ballston', '1966/04/05', 'Genderfluid', '87371 Warrior Circle', null, 'mballston5@vkontakte.ru'),
		   (7, 'Courtnay Skypp', '2000/10/14', 'Male', '29933 Steensland Road', null, 'cskypp6@mtv.com'),
		   (8, 'Helene Wiggins', '1964/09/05', 'Genderfluid', '92 1st Road', '50312', 'hwiggins7@friendfeed.com'),
		   (9, 'Dorothee Miere', '1997/07/05', 'Genderfluid', '8 Prentice Street', null, 'dmiere8@constantcontact.com'),
		   (10, 'Ardyce Zapater', '1966/01/12', 'Agender', '55 Milwaukee Terrace', null, 'azapater9@liveinternet.ru'),
		   (11, 'Manolo Kinsella', '1990/03/26', 'Agender', '04 Bowman Plaza', null, 'mkinsellaa@mozilla.org'),
		   (12, 'Galvan Dmitriev', '1968/07/22', 'Genderqueer', '426 Cordelia Place', '43503', 'gdmitrievb@sfgate.com'),
		   (13, 'Melania Shemilt', '1980/01/21', 'Polygender', '018 Cottonwood Road', null, 'mshemiltc@ebay.com'),
		   (14, 'Brina Cometson', '1953/12/10', 'Non-binary', '785 Darwin Avenue', '1408', 'bcometsond@state.gov'),
		   (15, 'Karlene Fochs', '1979/06/02', 'Bigender', '271 Corry Point', null, 'kfochse@over-blog.com'),
		   (16, 'Mag Geipel', '1957/05/04', 'Female', '88611 Straubel Trail', '3915', 'mgeipelf@furl.net'),
		   (17, 'Juan Haddleston', '1953/07/12', 'Genderqueer', '12973 Summer Ridge Point', '10600', 'jhaddlestong@reverbnation.com'),
		   (18, 'Pearle Eads', '1973/09/08', 'Male', '6889 La Follette Hill', '675029', 'peadsh@wordpress.com'),
		   (19, 'Rosalinde Towse', '1973/06/23', 'Genderfluid', '43 Melby Way', '66218', 'rtowsei@oakley.com'),
		   (20, 'Julina Thornborrow', '1986/09/24', 'Agender', '7 Burning Wood Plaza', null, 'jthornborrowj@jugem.jp');

-- INSERINDO DADOS NA TABELA CURSOS
INSERT INTO cursos (id, nome, id_professor, carga, ano_curso, valor_do_curso, certificado)
	VALUES (1, 'Job', 3, 59, 2018, 638.12, true),
		   (2, 'Wrapsafe', 1, 322, 2022, 632.79, true),
		   (3, 'Otcom', 2, 222, 2017, 247.91, true),
		   (4, 'Ronstring', 2, 149,2020, 235.92, true),
		   (5, 'Keylex', 4, 36, 2017, 451.47, false),
		   (6, 'Lotstring', 1, 297, 2019, 563.40, true),
		   (7, 'Flowdesk', 5, 293, 2018, 662.93, true),
		   (8, 'Domainer', 5, 164, 2019, 525.02, true),
		   (9, 'Daltfresh',4,  217, 2017, 570.05, false),
		   (10,'Andalax', 3, 311, 2019, 558.06, false),
           (11,'Asoka','8','85','2018',743.27,True),
		   (12,'Bitwolf','9','82','2021',471.16,False),
		   (13,'Fintone','9','81','2020',575.94,False),
		   (14,'Stim','6','64','2019',708.47,True),
		   (15,'Zamit','6','37','2017',518.30, False),
		   (16,'Holdlamis','10','74','2020',746.44,False),
		   (17,'Cardguard','8','25','2018',482.78,True),
		   (18,'Tampflex','10','85','2019',499.55,True),
		   (19,'Tin','6','75','2019',298.59,False),
		   (20,'Voltsillam','6','34','2017',571.63,False);
           
           
-- INSERINDO DADOS NA TABELA PROFESSORES
INSERT INTO professores (id, nome, nascimento, valor_hora, email, sexo, graduacao)
	VALUES (1,'Candie Reburn','1967/12/16',17.90,'creburn0@washington.edu','Male','Josai International University'),
		   (2,'Darryl Burnep','1951/02/25',10.97,'dburnep1@theguardian.com','Polygender','Ahfad University for Women'),
		   (3,'Viva Zollner','1966/05/12',15.60,'vzollner2@sina.com.cn','Bigender','Fachhochschule Aschaffenburg'),
		   (4,'Susette Andreone','1972/06/22',17.82,'sandreone3@illinois.edu','Male','Ahvaz University of Medical Sciences'),
		   (5,'Martainn Fludgate','1972/05/23',13.99,'mfludgate4@lycos.com','Bigender','Shuchiin College'),
		   (6,'Joellyn Markie','1952/03/04',19.50,'jmarkie5@discovery.com','Bigender','Ecole Nationale et Mocanique de Grenoble'),
		   (7,'Manda Haswell','1960/07/02',18.93,'mhaswell6@slate.com','Genderqueer','Mohammad Ali Jinnah University -Karachi'),
		   (8,'Stanly Wolffers','1960/10/12',18.62,'swolffers7@dot.gov','Female','University College of Trolttan/Uddevalla'),
		   (9,'Alvin Warrack','1964/09/15',13.93,'awarrack8@deliciousdays.com','Polygender','Kasetsart University'),
		   (10,'Lydon Axcell','1951/06/12',14.66,'laxcell9@tinypic.com','Polygender','Franklin and Marshall College');

-- INSERINDO DADOS NA TABELA ASSISTE_AULAS
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (1, 3, 9, 8, 1, '2017/06/20');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (2, 4, 5, 3, 5, '2019/04/09');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (3, 13, 4, 4, 4, '2020/06/20');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (4, 6, 10, 2, 4, '2018/09/07');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (5, 5, 2, 8, 5, '2020/03/07');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (6, 13, 4, 2, 5, '2019/06/22');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (7, 1, 9, 6, 2, '2017/06/08');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (8, 16, 7, 5, 4, '2017/09/28');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (9, 4, 9, 4, 1, '2019/05/03');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (10, 17, 6, 1, 2, '2017/03/13');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (11, 14, 10, 7, 4, '2017/05/23');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (12, 12, 1, 1, 2, '2021/10/08');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (13, 11, 6, 1, 3, '2017/07/04');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (14, 2, 1, 1, 1, '2019/04/24');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (15, 5, 1, 5, 3, '2017/08/24');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (16, 17, 6, 4, 3, '2020/08/29');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (17, 9, 5, 7, 2, '2021/10/08');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (18, 7, 10, 9, 4, '2021/09/05');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (19, 5, 1, 7, 1, '2020/12/01');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (20, 18, 7, 9, 5, '2018/03/09');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (21, 11, 8, 2, 4, '2019/06/14');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (22, 20, 5, 9, 4, '2018/11/10');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (23, 11, 5, 9, 2, '2020/02/10');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (24, 1, 9, 3, 5, '2017/05/08');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (25, 7, 9, 6, 2, '2021/03/15');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (26, 19, 10, 2, 4, '2018/12/22');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (27, 15, 7, 2, 3, '2018/10/09');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (28, 15, 7, 6, 4, '2021/01/20');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (29, 3, 1, 9, 1, '2018/02/13');
INSERT INTO assiste_aulas (id, id_aluno, id_curso, id_professor, qtd_aula, data_aula) values (30, 9, 8, 2, 4, '2017/01/23');

INSERT INTO assiste_aulas
VALUES  (DEFAULT, 19, 2, 9, 2, '2020/01/10'),
	    (DEFAULT, 10, 10, 1, 7, '2020/03/05'),
	    (DEFAULT, 14, 8, 10, 2, '2021/10/01'),
	    (DEFAULT, 20, 5, 4, 3, '2017/04/23'),
	    (DEFAULT, 12, 9, 4, 3, '2020/06/06'),
	    (DEFAULT, 17, 10, 9, 2, '2018/12/01'),
	    (DEFAULT, 17, 9, 6, 3, '2018/06/16'),
	    (DEFAULT, 13, 5, 7, 8, '2019/11/05'),
	    (DEFAULT, 5, 1, 9, 7, '2018/07/30'),
	    (DEFAULT, 14, 1, 2, 5, '2021/04/03'),
	    (DEFAULT, 9, 4, 8, 7, '2017/01/24'),
	    (DEFAULT, 20, 7, 7, 2, '2017/11/27'),
	    (DEFAULT, 15, 2, 1, 8, '2017/01/01'),
	    (DEFAULT, 1, 1, 1, 5, '2020/05/24'),
	    (DEFAULT, 1, 6, 10, 8, '2017/01/16'),
	    (DEFAULT, 12, 3, 6, 2, '2018/10/04'),
	    (DEFAULT, 15, 1, 3, 6, '2018/09/23'),
	    (DEFAULT, 8, 10, 10, 6, '2021/07/04'),
	    (DEFAULT, 10, 8, 1, 3, '2018/04/14'),
	    (DEFAULT, 13, 3, 3, 7, '2017/02/04');
        
-- QUERY 1: Descobrir quais alunos assistiram menos aulas em 2021 e entrar em contato para fazer acompanhamento.
SELECT P.id_aluno,
	   P.Qtd_aulas,
       c_a.nome,
       c_a.email
  FROM (SELECT id_aluno, 
			   id_curso, 
			   SUM(qtd_aula) AS Qtd_aulas, 
			   data_aula 
		  FROM assiste_aulas
		 WHERE YEAR(data_aula) = 2021
		 GROUP BY id_aluno) AS P
 INNER JOIN cad_alunos AS c_a
    ON P.id_aluno = c_a.id
 WHERE YEAR(data_aula) = 2021
 ORDER BY Qtd_aulas ASC;

-- QUERY 2: Avaliar os cursos com acessos abaixo de 15 aulas assistidas para avaliação de continuidade na plataforma.
SELECT a.*,
	   c.nome
  FROM (SELECT id_curso,
			   SUM(qtd_aula) AS Qtd_aulas
		  FROM assiste_aulas
		 GROUP BY id_curso
		 ORDER BY Qtd_aulas DESC) AS a
 INNER JOIN cursos AS c
    ON a.id_curso = c.id
 WHERE Qtd_aulas <= 15
 ORDER BY Qtd_aulas DESC;

-- QUERY 3: Valor pago a cada professor pela quantidade de aulas assistidas em 2020.
SELECT p.nome,
       p.valor_hora,
       p.email,
       a.tot_aulas * valor_hora AS total_pago
  FROM (SELECT id_professor, 
               SUM(qtd_aula) AS tot_aulas, 
               data_aula 
		  FROM assiste_aulas
          GROUP BY id_professor) AS a
INNER JOIN professores AS p
ON a.id_professor = p.id
GROUP BY p.nome
ORDER BY tot_aulas DESC;