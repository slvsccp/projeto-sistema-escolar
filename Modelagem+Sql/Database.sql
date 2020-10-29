CREATE TABLE Alunos
(
	id_aluno int PRIMARY KEY NOT NULL,
	nome VARCHAR(200) NOT NULL,
	data_nasc DATE NOT NULL,
	sexo VARCHAR(1) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL,
);



CREATE TABLE Situacao
(
	id_situacao int PRIMARY KEY NOT NULL,
	situacao VARCHAR(25) NOT NULL,
	data_cadastro DATETIME,
	login_cadastro VARCHAR(15)
);


CREATE TABLE Cursos
(
	id_curso int PRIMARY KEY NOT NULL,
	nome_curso VARCHAR(200) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL

);

CREATE TABLE Turmas
(
	id_turma INT PRIMARY KEY NOT NULL,
	id_aluno INT NOT NULL,
	id_curso INT NOT NULL,
	valor_turma NUMERIC(15,2) NOT NULL,
	desconto NUMERIC(3,2) NOT NULL,
	data_inicio DATE NOT NULL,
	data_termino DATE,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15)
);



ALTER TABLE Turmas
	ADD CONSTRAINT fk_Curso FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso);


CREATE TABlE AlunosxTurmas
(
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	valor NUMERIC(13,2) NOT NULL,
	valor_desconto NUMERIC(3,2) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);

ALTER TABLE AlunosxTurmas
	ADD CONSTRAINT fk_turma FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma);

ALTER TABLE AlunosxTurmas
	ADD CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

CREATE TABLE Registro_Presenca
(
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	id_situacao INT NOT NULL,
	data_presenca DATE NOT NULL,
	data_cadastro DATE NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);



ALTER TABLE Registro_Presenca
	ADD CONSTRAINT fk_TurmasRP FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma);

ALTER TABLE Registro_Presenca
	ADD CONSTRAINT fk_AlunosRP FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE Registro_Presenca
	ADD CONSTRAINT fk_SituacaoRP FOREIGN KEY (id_situacao) REFERENCES Situacao (id_situacao);

