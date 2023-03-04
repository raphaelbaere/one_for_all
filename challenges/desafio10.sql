CREATE TABLE SpotifyClone.musicas_favoritas (
  pessoa_usuaria_id INT NOT NULL,
  cancao_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (pessoa_usuaria_id, cancao_id),
  FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.pessoa_usuaria (pessoa_usuaria_id),
  FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes (cancao_id)
) ENGINE = INNODB;


INSERT INTO
  SpotifyClone.musicas_favoritas (pessoa_usuaria_id, cancao_id)
VALUES
  (3, 3),
  (3, 6),
  (3, 10),
  (1, 4),
  (2, 1),
  (2, 3),
  (4, 7),
  (4, 4),
  (5, 10),
  (5, 2),
  (8, 4),
  (9, 7),
  (10, 3);