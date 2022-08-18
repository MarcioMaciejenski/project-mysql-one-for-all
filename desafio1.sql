DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_plano VARCHAR(20) NOT NULL,  
  valor_plano DOUBLE NOT NULL
)engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(60) NOT NULL,
  idade INT,
  data_assinatura DATE NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY(plano_id) REFERENCES plano(plano_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(45) NOT NULL
)engine = InnoDB;

CREATE TABLE SpotifyClone.album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_nome VARCHAR(60) NOT NULL,
  artista_id INT NOT NULL,
  ano_lancamento INT NOT NULL,
  FOREIGN KEY(artista_id) REFERENCES artista(artista_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
  cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
  cancao_nome VARCHAR(100) NOT NULL,
  duracao_segundos INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY(album_id) REFERENCES album(album_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
  FOREIGN KEY(usuario_id) REFERENCES usuario(usuario_id),
  FOREIGN KEY(artista_id) REFERENCES artista(artista_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducao(
  usuario_id INT NOT NULL,
  cancoes_id INT NOT NULL,
  data_reproducao DATETIME,
  CONSTRAINT PRIMARY KEY(usuario_id, cancoes_id),
  FOREIGN KEY(cancoes_id) REFERENCES cancoes(cancoes_id),
  FOREIGN KEY(usuario_id) REFERENCES usuario(usuario_id)
)engine = InnoDB;

INSERT INTO SpotifyClone.plano(nome_plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.usuario(nome, sobrenome, idade, data_assinatura, plano_id)
VALUES
  ('Barbara', 'Liskov', 82, '2019-10-20', 1),
  ('Robert', 'Cecil Martin', 58, '2017-01-06', 1),
  ('Ada', 'Lovelace', 37, '2017-12-30', 2),
  ('Martin', 'Fowler', 46, '2017-01-17', 2),
  ('Sandi', 'Metz', 58, '2018-04-29', 2),
  ('Paulo', 'Freire', 19, '2018-02-14', 3),
  ('Bell', 'Hooks', 26, '2018-01-05', 3),
  ('Christopher', 'Alexander', 85, '2019-06-05', 4),
  ('Judith', 'Butler', 45, '2020-05-13', 4),
  ('Jorge', 'Amado', 58, '2017-02-17', 4);
  
INSERT INTO SpotifyClone.artista(nome_artista)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
  
INSERT INTO SpotifyClone.album(album_nome, artista_id, ano_lancamento)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);
  
INSERT INTO SpotifyClone.cancoes(album_id, cancao_nome, duracao_segundos)
VALUES
  (1, 'BREAK MY SOUL', 279),
  (1, 'VIRGO’S GROOVE', 369),
  (1, 'ALIEN SUPERSTAR', 116),
  (2, 'Don’t Stop Me Now', 203),
  (3, 'Under Pressure', 152),
  (4, 'Como Nossos Pais', 105),
  (5, 'O Medo de Amar é o Medo de Ser Livre', 207),
  (6, 'Samba em Paris', 267),
  (7, 'The Bard’s Song', 244),
  (8, 'Feeling Good', 100);
  
INSERT INTO SpotifyClone.seguindo_artistas(usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 6),
  (7, 6),
  (9, 3),
  (10, 2);
  
INSERT INTO SpotifyClone.historico_reproducao(cancoes_id, usuario_id, data_reproducao)
VALUES
  (8, 1, '2022-02-28 10:45:55'),
  (2, 1, '2020-05-02 05:30:35'),
  (10, 1, '2020-03-06 11:22:33'),
  (10, 2, '2022-08-05 08:05:17'),
  (7, 2, '2020-01-02 07:40:33'),
  (10, 3, '2020-11-13 16:55:13'),
  (2, 3, '2020-12-05 18:38:30'),
  (8, 4, '2021-08-15 17:10:10'),
  (8, 5, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (7, 6, '2017-01-24 00:31:17'),
  (1, 6, '2017-10-12 12:35:20'),
  (4, 7, '2011-12-15 22:30:49'),
  (4, 8, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (3, 10, '2015-12-13 08:30:22');