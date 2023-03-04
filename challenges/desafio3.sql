SELECT (CONCAT(pu.nome_pessoa_usuaria, ' ', pu.sobrenome_pessoa_usuaria)) AS pessoa_usuaria, COUNT(hr.pessoa_usuaria_id) AS musicas_ouvidas, ROUND((SUM(ca.duracao_segundos) / 60), 2) AS total_minutos
FROM SpotifyClone.pessoa_usuaria pu
INNER JOIN SpotifyClone.historico_de_reproducoes hr ON hr.pessoa_usuaria_id = pu.pessoa_usuaria_id
INNER JOIN SpotifyClone.cancoes ca ON ca.cancao_id = hr.cancao_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;