SELECT (CONCAT(pu.nome_pessoa_usuaria, ' ', pu.sobrenome_pessoa_usuaria)) AS pessoa_usuaria,
IF (MAX(YEAR(hr.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria	
FROM SpotifyClone.pessoa_usuaria pu
INNER JOIN SpotifyClone.historico_de_reproducoes hr ON hr.pessoa_usuaria_id = pu.pessoa_usuaria_id
GROUP BY pessoa_usuaria	
ORDER BY pessoa_usuaria;