SELECT COUNT(hr.pessoa_usuaria_id) AS musicas_no_historico
FROM SpotifyClone.historico_de_reproducoes hr
INNER JOIN SpotifyClone.pessoa_usuaria pu ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
WHERE CONCAT(pu.nome_pessoa_usuaria, ' ', pu.sobrenome_pessoa_usuaria) = 'Barbara Liskov';