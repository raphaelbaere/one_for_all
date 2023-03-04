SELECT COUNT(DISTINCT ca.cancao) AS cancoes, COUNT(DISTINCT ar.artista) AS artistas, COUNT(DISTINCT al.album) AS albuns
FROM SpotifyClone.albuns al
INNER JOIN SpotifyClone.artistas ar ON al.album_do_artista_id = ar.artista_id
INNER JOIN SpotifyClone.cancoes ca ON al.album_id = ca.album_id;