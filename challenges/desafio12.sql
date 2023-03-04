SELECT ar.artista, 
		CASE
    WHEN COUNT(mf.cancao_id) >= 5 THEN 'A'
    WHEN (COUNT(mf.cancao_id) = 3 OR COUNT(mf.cancao_id) = 4) THEN 'B'
	WHEN (COUNT(mf.cancao_id) = 1 OR COUNT(mf.cancao_id) = 2) THEN 'C'
    ELSE '-'
END AS ranking
FROM SpotifyClone.artistas ar
INNER JOIN SpotifyClone.cancoes ca ON ca.artista_id = ar.artista_id
LEFT JOIN SpotifyClone.musicas_favoritas mf ON mf.cancao_id = ca.cancao_id
GROUP BY ar.artista
ORDER BY COUNT(mf.cancao_id) DESC, ar.artista;