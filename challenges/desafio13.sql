SELECT 
    CASE
        WHEN pu.idade_pessoa_usuaria <= 30 THEN 'Até 30 anos'
        WHEN pu.idade_pessoa_usuaria <= 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
    END faixa_etaria,
    COUNT(DISTINCT pu.pessoa_usuaria_id) total_pessoas_usuarias,
    COUNT(mf.pessoa_usuaria_id) total_favoritadas
FROM
    SpotifyClone.pessoa_usuaria pu
		LEFT JOIN
	SpotifyClone.musicas_favoritas mf ON mf.pessoa_usuaria_id = pu.pessoa_usuaria_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;