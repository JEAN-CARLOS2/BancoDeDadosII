CREATE DATABASE CONCURSO_CNU;
USE CONCURSO_CNU;

CREATE TABLE usuario(

id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome_usu VARCHAR(80) NOT NULL,
data_cadastro DATE NOT NULL,
email_usuario VARCHAR(50) NOT NULL UNIQUE

);


CREATE TABLE usuario_questao(

fk_id_usuario INT,
fk_id_questao INT,
FOREIGN KEY (fk_id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (fk_id_questao) REFERENCES questao(id_questao),
data_resp DATE,
resultado VARCHAR(30),
resposta_usu TEXT

);

CREATE TABLE questao(

id_questao INT PRIMARY KEY AUTO_INCREMENT,
fk_id_assunto INT,
fk_id_banca INT,
enunciado TEXT NOT NULL,
modalidade ENUM('disciplinas'),
nivel VARCHAR(80),
FOREIGN KEY (fk_id_assunto) REFERENCES assunto(id_assunto),
FOREIGN KEY (fk_id_banca) REFERENCES banca(id_banca)

);

CREATE TABLE disciplina(

id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
nome_disc VARCHAR(70)

);

CREATE TABLE alternativas(

id_alternativa INT PRIMARY KEY AUTO_INCREMENT,
fk_id_questao INT,
FOREIGN KEY (fk_id_questao) REFERENCES questao(id_questao),
texto_alter TEXT,
gabarito_alter TEXT

);

CREATE TABLE assunto(

Id_assunto INT PRIMARY KEY AUTO_INCREMENT,
fk_id_disciplina INT,
text_ass TEXT,
campo TEXT,
FOREIGN KEY(fk_id_disciplina) REFERENCES DISCIPLINA(id_disciplina)

);

CREATE TABLE questao_professor(

fk_id_questao INT,
fk_id_professor INT,
texto_com TEXT,
data_com DATE,
FOREIGN KEY (fk_id_questao) REFERENCES questao(id_questao),
FOREIGN KEY (fk_id_professor) REFERENCES professor(id_professor)

);

CREATE TABLE banca(

id_banca INT PRIMARY KEY AUTO_INCREMENT,
nome_ban VARCHAR(80),
sigla_ban VARCHAR(10)

);

CREATE TABLE professor(

id_professor INT PRIMARY KEY AUTO_INCREMENT,
email_prof VARCHAR(50) UNIQUE,
nome_prof VARCHAR(50),
telefone_prof VARCHAR(11)

);

