SELECT ar.artista AS artista, al.album AS album, COUNT(sa.seguindo_artista_id) AS pessoas_seguidoras
FROM SpotifyClone.artistas ar
INNER JOIN SpotifyClone.albuns al ON al.album_do_artista_id = ar.artista_id
INNER JOIN SpotifyClone.seguindo_artistas sa ON sa.seguindo_artista_id = ar.artista_id
GROUP BY album, artista
ORDER BY pessoas_seguidoras DESC, artista, album;