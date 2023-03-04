SELECT can.cancao AS cancao, COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes can
INNER JOIN SpotifyClone.historico_de_reproducoes hr ON hr.cancao_id = can.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;