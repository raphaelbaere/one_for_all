SELECT al.album, COUNT(mf.cancao_id) AS favoritadas
FROM SpotifyClone.albuns al
INNER JOIN SpotifyClone.cancoes ca ON ca.album_id = al.album_id
INNER JOIN SpotifyClone.musicas_favoritas mf ON mf.cancao_id = ca.cancao_id
GROUP BY al.album
ORDER BY favoritadas DESC, al.album
LIMIT 3;