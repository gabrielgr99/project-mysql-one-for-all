DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(20) NOT NULL,
      preco DECIMAL(5, 2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuarios(
      usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(70) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      data_assinatura DATE NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(70) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(70) NOT NULL,
      artista_id INT NOT NULL,
      lancamento YEAR NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      cancao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome VARCHAR(150) NOT NULL,
      duracao INT NOT NULL,
      album_id INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES albuns (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico(
      usuario_id INT NOT NULL,
      cancao_id INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
      FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artistas(
      usuario_id INT NOT NULL,
      artista_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (nome, preco)
  VALUES
    ('gratuito', 0.00),
    ('universitario', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.usuarios (nome, idade, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 4, '2017-12-30'),
    ('Martin Fowler', 46, 4, '2017-01-17'),
    ('Sandi Metz', 58, 4, '2018-04-29'),
    ('Paulo Freire', 19, 2, '2018-02-14'),
    ('Bell Hooks', 26, 2, '2018-01-05'),
    ('Christopher Alexander', 85, 3, '2019-06-05'),
    ('Judith Butler', 45, 3, '2020-05-13'),
    ('Jorge Amado', 58, 3, '2017-02-17');
  
  INSERT INTO SpotifyClone.artistas (nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.albuns (nome, artista_id, lancamento)
  VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);
  
  INSERT INTO SpotifyClone.cancoes (nome, duracao, album_id)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don’t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bard’s Song', 244, 7),
    ('Feeling Good', 100, 8);

  INSERT INTO SpotifyClone.historico (cancao_id, usuario_id, data_reproducao)
  VALUES
    ( 8, 1, '2022-02-28 10:45:55'),
    ( 2, 1, '2020-05-02 05:30:35'),
    ( 10, 1, '2020-03-06 11:22:33'),
    ( 10, 2, '2022-08-05 08:05:17'),
    ( 7, 2, '2020-01-02 07:40:33'),
    ( 10, 3, '2020-11-13 16:55:13'),
    ( 2, 3, '2020-12-05 18:38:30'),
    ( 8, 4, '2021-08-15 17:10:10'),
    ( 8, 5, '2022-01-09 01:44:33'),
    ( 5, 5, '2020-08-06 15:23:43'),
    ( 7, 6, '2017-01-24 00:31:17'),
    ( 1, 6, '2017-10-12 12:35:20'),
    ( 4, 7, '2011-12-15 22:30:49'),
    ( 4, 8, '2012-03-17 14:56:41'),
    ( 9, 9, '2022-02-24 21:14:22'),
    ( 3, 10, '2015-12-13 08:30:22');
  
  INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
  VALUES
    ( 1, 1),
    ( 1, 2),
    ( 1, 3),
    ( 2, 1),
    ( 2, 3),
    ( 3, 2),
    ( 4, 4),
    ( 5, 5),
    ( 5, 6),
    ( 6, 6),
    ( 6, 1),
    ( 7, 6),
    ( 9, 3),
    ( 10, 2);
