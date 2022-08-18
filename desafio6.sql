SELECT
  format(MIN(pl.valor_plano), 2) AS faturamento_minimo,
  format(MAX(pl.valor_plano), 2) AS faturamento_maximo,
  format(AVG(pl.valor_plano), 2) AS faturamento_medio,
  format(SUM(pl.valor_plano), 2) AS faturamento_total
FROM SpotifyClone.plano AS pl
INNER JOIN SpotifyClone.usuario AS us
ON pl.plano_id = us.plano_id;