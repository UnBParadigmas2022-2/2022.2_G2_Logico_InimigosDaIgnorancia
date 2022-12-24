-- Dados inseridos pelo web_crawler.
INSERT INTO
categoria (titulo)
VALUES

('Filmes'),
('Filmes de comedia'),

('Musica'),
('Duplas Sertanejas'),

('Jogos eletronicos'),
('Jogos de PlayStation 2')
;

INSERT INTO 
artigo (titulo,dataCriacao,qtdEdicoes,qtdImagens,qtdPalavras,qtdSubtitulos,qtdLinks) 
VALUES
('Devil May Cry 3: Special Edition', '2002-02-12', 38, 3, 50123,5,34),
('Bruno & Marrone', '2010-07-02', 15, 2, 12200,8,6),
('Esqueceram de mim 2', '2013-03-14', 5, 0, 1300,3,20)
;

INSERT INTO
artigo_pertence_categoria (titulo_artigo, titulo_categoria)
VALUES
('Devil May Cry 3: Special Edition','Jogos eletronicos'),
('Devil May Cry 3: Special Edition','Jogos de PlayStation 2'),

('Esqueceram de mim 2','Filmes'),
('Esqueceram de mim 2','Filmes de comedia'),

('Bruno & Marrone','Musica'),
('Bruno & Marrone','Duplas Sertanejas')
;

INSERT INTO
categoria_possui_categoria (titulo_dono, titulo_subcategoria)
VALUES
('Musica','Duplas Sertanejas'),
('Filmes','Filmes de comedia'),
('Jogos eletronicos','Jogos de PlayStation 2')
;

-- Dados inseridos pelo JS

INSERT INTO 
pessoa (username,senha,gostadeler,sexo,nascimento,uf) 
VALUES 
('Robson','123',false,'M','2004-12-12','TO'),
('Mary','lalala',true,'F','1995-10-12','GO'),
('Alice','321la',true,'F','1963-10-12','DF'),
('Bob','123lala',true,'M','1960-10-12','DF')
;

INSERT INTO 
pessoa_segue_pessoa (pessoa_segue,pessoa_seguida) 
VALUES
('Robson','Mary'),
('Robson','Alice'),

('Mary','Alice'),
('Alice','Mary'),

('Robson','Bob'),
('Mary','Bob'),
('Alice','Bob')
;

INSERT INTO 
pessoa_le_artigo (username,titulo,tempoLido)
VALUES
('Robson','Devil May Cry 3: Special Edition','00:02:00'),
('Robson','Bruno & Marrone','00:01:00'),

('Bob','Bruno & Marrone','00:22:00'),
('Bob','Esqueceram de mim 2','00:10:00'),

('Alice','Esqueceram de mim 2','00:30:00')
;

INSERT INTO 
pessoa_le_artigo (username,titulo,tempoLido)
VALUES
('Bob','Bruno & Marrone','00:10:00'); -- Bob leu duas vezes o mesmo artigo, porem em timestamps diferentes e com tempo de leitura diferente.

INSERT INTO
pessoa_interage_artigo (username,titulo,ofensivo,gostei)
VALUES
('Bob','Bruno & Marrone',false,true),
('Bob','Esqueceram de mim 2',false,true),
('Bob','Devil May Cry 3: Special Edition',true,false),

('Robson','Devil May Cry 3: Special Edition',false,true),
('Robson','Bruno & Marrone',false,true),

('Alice','Esqueceram de mim 2',false,true)
;

INSERT INTO
pessoa_interage_categoria (username,titulo,ofensivo,gostei)
VALUES
('Bob','Filmes',false,false),
('Bob','Filmes de comedia',false,true),
('Bob','Musica',false,true),

('Robson','Jogos de PlayStation 2',false,true),

('Alice','Filmes de comedia',false,true)
;

