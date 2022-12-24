-- Tipos de dados.
CREATE TYPE sexo AS ENUM('M','F');

-- Tabelas independentes.

CREATE TABLE IF NOT EXISTS pessoa (
  username varchar(75) PRIMARY KEY,
  senha varchar(250) NOT NULL,
  gostaDeLer boolean NOT NULL,
  sexo sexo NOT NULL,
  nascimento date NOT NULL,
  uf char(2) NOT NULL, -- Este tipo ainda tem que ser restringido para aceitar somente UFs validas.

  imagem varchar(150),
  descricao text
);

CREATE TABLE IF NOT EXISTS artigo (
  titulo varchar(50) PRIMARY KEY,
  dataCriacao date NOT NULL,
  qtdEdicoes integer NOT NULL DEFAULT 1,
  qtdPalavras bigint NOT NULL,
  qtdSubtitulos integer NOT NULL,
  qtdLinks integer NOT NULL,
  qtdImagens integer NOT NULL
);

CREATE TABLE IF NOT EXISTS categoria (
  titulo varchar(50) PRIMARY KEY
);

-- Tabelas de relacionamentos.

-- Auto relacionamentos
CREATE TABLE IF NOT EXISTS pessoa_segue_pessoa (
  pessoa_segue varchar(75) NOT NULL,
  pessoa_seguida varchar(75) NOT NULL,

  CONSTRAINT FK_pessoa_segue_pessoa_seguidor FOREIGN KEY(pessoa_segue) REFERENCES pessoa(username),
  CONSTRAINT FK_pessoa_segue_pessoa_seguido FOREIGN KEY(pessoa_seguida) REFERENCES pessoa(username),

  CONSTRAINT PK_pessoa_segue_pessoa PRIMARY KEY (pessoa_segue,pessoa_seguida)
);

CREATE TABLE IF NOT EXISTS categoria_possui_categoria (
  titulo_dono varchar(50) NOT NULL,
  titulo_subcategoria varchar(50) NOT NULL,

  CONSTRAINT FK_categoria_possui_categoria_dono FOREIGN KEY(titulo_dono) REFERENCES categoria(titulo),
  CONSTRAINT FK_categoria_possui_categoria_subcategoria FOREIGN KEY(titulo_subcategoria) REFERENCES categoria(titulo),

  CONSTRAINT PK_categoria_possui_categoria PRIMARY KEY (titulo_dono,titulo_subcategoria)
);

-- Relacionamentos interage.

CREATE TABLE IF NOT EXISTS pessoa_interage_artigo (
  username varchar(75) NOT NULL,
  titulo varchar(50) NOT NULL,
  ofensivo boolean NOT NULL,
  gostei boolean NOT NULL,
  acesso timestamp NOT NULL DEFAULT NOW(),

  CONSTRAINT FK_pessoa_interage_artigo_username FOREIGN KEY(username) REFERENCES pessoa(username),
  CONSTRAINT FK_pessoa_interage_artigo_titulo FOREIGN KEY(titulo) REFERENCES artigo(titulo),

  CONSTRAINT PK_pessoa_interage_artigo PRIMARY KEY(username,titulo)
);

CREATE TABLE IF NOT EXISTS pessoa_interage_categoria (
  username varchar(75) NOT NULL,
  titulo varchar(50) NOT NULL,
  ofensivo boolean NOT NULL,
  gostei boolean NOT NULL,
  acesso timestamp NOT NULL DEFAULT NOW(),

  CONSTRAINT FK_pessoa_interage_categoria_username FOREIGN KEY(username) REFERENCES pessoa(username),
  CONSTRAINT FK_pessoa_interage_categoria_titulo FOREIGN KEY(titulo) REFERENCES categoria(titulo),

  CONSTRAINT PK_pessoa_interage_categoria PRIMARY KEY(username,titulo)
);

-- Relacionamentos comuns.
CREATE TABLE IF NOT EXISTS pessoa_le_artigo (
  username varchar(75) NOT NULL,
  titulo varchar(50) NOT NULL,
  acesso timestamp NOT NULL DEFAULT NOW(),
  tempoLido time,

  CONSTRAINT FK_pessoa_le_artigo_username FOREIGN KEY(username) REFERENCES pessoa(username),
  CONSTRAINT FK_pessoa_le_artigo_titulo FOREIGN KEY(titulo) REFERENCES artigo(titulo),

  CONSTRAINT PK_pessoa_le_artigo PRIMARY KEY(username,titulo,acesso)
);

CREATE TABLE IF NOT EXISTS artigo_pertence_categoria (
  titulo_artigo varchar(50) NOT NULL,
  titulo_categoria varchar(50) NOT NULL,

  CONSTRAINT FK_artigo_pertence_categoria_titulo_artigo FOREIGN KEY(titulo_artigo) REFERENCES artigo(titulo),
  CONSTRAINT FK_artigo_pertence_categoria_titulo_categoria FOREIGN KEY(titulo_categoria) REFERENCES categoria(titulo),

  CONSTRAINT PK_artigo_pertence_categoria PRIMARY KEY(titulo_categoria,titulo_artigo)
);

-- Functions para retornar valores derivados.

-- Derivados de Pessoa
CREATE OR REPLACE FUNCTION idade(IN name varchar(75), OUT idade record) RETURNS record AS $$
BEGIN
  SELECT DATE_PART('year',now()) - DATE_PART('year',nascimento)  FROM pessoa wHERE username = name INTO idade;
END;
$$ language plpgsql;

-- Derivados de Artigo
CREATE OR REPLACE FUNCTION qtdPessoasLeram(IN titulo_artigo varchar(50), OUT n_pessoas record) RETURNS record AS $$
BEGIN
  SELECT COUNT(DISTINCT username) FROM pessoa_le_artigo WHERE titulo = titulo_artigo INTO n_pessoas;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION qtdLeituras(IN titulo_artigo varchar(50), OUT n_leituras record) RETURNS record AS $$
BEGIN
  SELECT COUNT(username) FROM pessoa_le_artigo WHERE titulo = titulo_artigo INTO n_leituras;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION qtdTempoLido(IN titulo_artigo varchar(50), OUT tempo_leitura record) RETURNS record AS $$
BEGIN
  SELECT COALESCE(SUM(tempoLido),'00:00:00') FROM pessoa_le_artigo WHERE titulo = titulo_artigo INTO tempo_leitura;
END;
$$ language plpgsql;

-- Derivados de Categoria

CREATE OR REPLACE FUNCTION qtdArtigos(IN titulo varchar(50), OUT n_artigos record) RETURNS record AS $$
BEGIN
  SELECT COUNT(titulo_artigo) FROM artigo_pertence_categoria WHERE titulo_categoria = titulo INTO n_artigos;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION qtdSubcategorias(IN titulo varchar(50), OUT n_subcategorias record) RETURNS record AS $$
BEGIN
  SELECT COUNT(titulo_subcategoria) FROM categoria_possui_categoria WHERE titulo_dono = titulo INTO n_subcategorias;
END;
$$ language plpgsql;
