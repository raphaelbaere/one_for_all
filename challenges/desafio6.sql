SELECT FORMAT((MIN(pl.valor_plano)), 2) AS faturamento_minimo,
FORMAT(MAX(pl.valor_plano), 2) AS faturamento_maximo,
FORMAT(ROUND(AVG((SELECT SpotifyClone.plano.valor_plano FROM SpotifyClone.plano WHERE SpotifyClone.plano.plano_id = pu.tipo_plano_id)), 2), 2) AS faturamento_medio,
FORMAT(ROUND(SUM((SELECT SpotifyClone.plano.valor_plano FROM SpotifyClone.plano WHERE SpotifyClone.plano.plano_id = pu.tipo_plano_id)), 2), 2) AS faturamento_total
FROM SpotifyClone.plano pl
INNER JOIN SpotifyClone.pessoa_usuaria pu ON pu.tipo_plano_id = pl.plano_id;