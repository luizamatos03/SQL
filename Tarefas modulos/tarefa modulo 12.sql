-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS cursos_livres;

-- Criação da tabela de cadastro dos alunos
CREATE TABLE IF NOT EXISTS cad_alunos(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL ,
  nascimento DATE,
  sexo VARCHAR(30) NOT NULL,
  endereco VARCHAR (100),
  cep INT (8) ZEROFILL,
  email VARCHAR (100) NOT NULL,
  PRIMARY KEY (id)
) DEFAULT CHARSET utf8;


/* Criação de tabela com os professores e os cursos ministrados */
CREATE TABLE IF NOT EXISTS professores (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR (255) NOT NULL,
  nascimento DATE NOT NULL,
  valor_hora DECIMAL (6,2) NOT NULL,
  email VARCHAR (100) NOT NULL,
  sexo VARCHAR (15) NOT NULL,
  graduacao VARCHAR (255) NOT NULL,
  PRIMARY KEY (id)
)DEFAULT CHARSET = utf8;


/* Criação da tabela de cursos disponíveis */
CREATE TABLE IF NOT EXISTS cursos(
  id INT NOT NULL AUTO_INCREMENT UNIQUE,
  nome VARCHAR(30) NOT NULL UNIQUE,
  id_professor INT,
  carga INT UNSIGNED,
  ano_curso YEAR DEFAULT '2016',
  valor_do_curso DECIMAL (5,2),
  certificado BOOL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_professor) REFERENCES professores(id)
)DEFAULT CHARSET=utf8;

/* Criação de tabela de correlação alunos e cursos assistidos */
CREATE TABLE IF NOT EXISTS assiste_aulas (
  id INT NOT NULL AUTO_INCREMENT,
  id_aluno INT,
  id_curso INT,
  id_professor INT,
  qtd_aula TINYINT (3) NOT NULL,
  data_aula DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_aluno) REFERENCES cad_alunos(id),
  FOREIGN KEY (id_curso) REFERENCES cursos(id),
  FOREIGN KEY (id_professor) REFERENCES professores(id)
)DEFAULT CHARSET = utf8;
