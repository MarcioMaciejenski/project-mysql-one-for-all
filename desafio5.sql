SELECT
  c.cancao_nome AS cancao,
  COUNT(hr.cancoes_id) AS reproducoes
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.historico_reproducao AS hr
ON c.cancoes_id = hr.cancoes_id
GROUP BY hr.cancoes_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;