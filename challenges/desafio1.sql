-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

 CREATE TABLE SpotifyClone.plano(
     plano_id INT PRIMARY KEY AUTO_INCREMENT,
     tipo_plano VARCHAR(45) NOT NULL,
     valor_plano DOUBLE NOT NULL
 ) engine = InnoDB;

CREATE TABLE SpotifyClone.pessoa_usuaria(
     pessoa_usuaria_id INT PRIMARY KEY AUTO_INCREMENT,
     nome_pessoa_usuaria VARCHAR(45) NOT NULL,
     sobrenome_pessoa_usuaria VARCHAR(45) NOT NULL,
     idade_pessoa_usuaria INT NOT NULL,
     tipo_plano_id INT NOT NULL,
     data_assinatura DATE,
     FOREIGN KEY (tipo_plano_id) REFERENCES SpotifyClone.plano (plano_id)
 ) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
     artista_id INT PRIMARY KEY AUTO_INCREMENT,
     artista VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
     album_id INT PRIMARY KEY AUTO_INCREMENT,
     album VARCHAR(45) NOT NULL,
     album_do_artista_id INT NOT NULL,
     ano_lancamento YEAR(4) NOT NULL,
     FOREIGN KEY (album_do_artista_id) REFERENCES SpotifyClone.artistas (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
     cancao_id INT PRIMARY KEY AUTO_INCREMENT,
     cancao VARCHAR(45) NOT NULL,
     duracao_segundos SMALLINT(3) NOT NULL,
     album_id INT NOT NULL,
     artista_id INT NOT NULL,
     FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns (album_id),
     FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_de_reproducoes(
     cancao_reproduzida_id INT AUTO_INCREMENT,
     pessoa_usuaria_id INT,
     cancao_id INT,
     data_reproducao DATETIME NOT NULL,
     PRIMARY KEY (cancao_reproduzida_id, cancao_id, pessoa_usuaria_id),
     FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes (cancao_id),
     FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.pessoa_usuaria (pessoa_usuaria_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas (
  pessoa_usuaria_id INT NOT NULL,
  seguindo_artista_id INT NOT NULL,
  PRIMARY KEY (pessoa_usuaria_id, seguindo_artista_id),
		FOREIGN KEY (pessoa_usuaria_id)
		REFERENCES SpotifyClone.pessoa_usuaria (pessoa_usuaria_id),
		FOREIGN KEY (seguindo_artista_id)
		REFERENCES SpotifyClone.artistas (artista_id));


-- Insert preço

INSERT INTO SpotifyClone.plano (tipo_plano, valor_plano)
VALUES 
	('gratuito', 0),
	('universitário', 5.99),
	('familiar', 7.99),
	('pessoal', 6.99);

-- Insert pessoa usuária
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Robert', 'Cecil Martin', 58, 1, '2017-01-06');
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Ada', 'Lovelace', 37, 3, '2017-12-30');
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Barbara', 'Liskov', 82, 1, '2019-10-20');
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Martin', 'Fowler', 46, 3, '2017-01-17');
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Sandi', 'Metz', 58, 3, '2018-04-29');
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Paulo', 'Freire', 19, 2, '2018-02-14');
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Bell', 'Hooks', 26, 2, '2018-01-05');
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Christopher', 'Alexander', 85, 4, '2019-06-05');
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Judith', 'Butler', 45, 4, '2020-05-13');
INSERT INTO SpotifyClone.pessoa_usuaria (nome_pessoa_usuaria, sobrenome_pessoa_usuaria, idade_pessoa_usuaria, tipo_plano_id, data_assinatura) VALUES ('Jorge', 'Amado', 58, 4, '2017-02-17');

-- Insert dos artistas
INSERT INTO SpotifyClone.artistas (artista) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

-- Insert dos albuns

INSERT INTO SpotifyClone.albuns (album_do_artista_id, album, ano_lancamento) VALUES
	(1, 'Renaissance', '2022'),
	(2, 'Jazz', '1978'),
	(2, 'Hot Space', '1982'),
	(3, 'Falso Brilhante',  '1998'),
	(3, 'Vento de Maio', '2001'),
	(4, 'QVVJFA?', '2003'),
	(5, 'Somewhere Far Beyond', '2007'),
	(6, 'I Put A Spell On You', '2012');

-- Insert cancoes
INSERT INTO SpotifyClone.cancoes (cancao, duracao_segundos, album_id, artista_id) VALUES
    ('BREAK MY SOUL', 279, 1, 1),
	("VIRGO'S GROOVE", 369, 1, 1),
	('ALIEN SUPERSTAR', 116, 1, 1),
	("Don't Stop Me Now", 203, 2, 2),
	('Under Pressure', 152, 3, 2),
	('Como Nossos Pais', 105, 4, 3),
	('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
	('Samba em Paris', 267, 6, 4),
	("The Bard's Song", 244, 7, 5),
	('Feeling Good', 100, 8, 6);


-- Insert do historico de reproduções
INSERT INTO SpotifyClone.historico_de_reproducoes (pessoa_usuaria_id, cancao_id, data_reproducao) VALUES
	(3, 8, '2022-02-28 10:45:55'),
	(3, 2, '2020-05-02 05:30:35'),
	(3, 10, '2020-03-06 11:22:33'),
	(1, 10, '2022-08-05 08:05:17'),
	(1, 7, '2020-01-02 07:40:33'),
	(2, 10, '2020-11-13 16:55:13'),
	(2, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.seguindo_artistas (pessoa_usuaria_id, seguindo_artista_id) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);
