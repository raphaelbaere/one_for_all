SELECT ar.artista AS artista, al.album AS album
FROM SpotifyClone.artistas ar
INNER JOIN SpotifyClone.albuns al ON al.album_do_artista_id = ar.artista_id
WHERE ar.artista = 'Elis Regina'
ORDER BY al.album;