SELECT
  c.cancao_nome AS nome,
  COUNT(hr.cancoes_id) AS reproducoes
FROM SpotifyClone.plano AS pl
INNER JOIN SpotifyClone.usuario AS us
ON pl.plano_id = us.plano_id
INNER JOIN SpotifyClone.historico_reproducao AS hr
ON us.usuario_id = hr.usuario_id
INNER JOIN SpotifyClone.cancoes AS c
ON hr.cancoes_id = c.cancoes_id
WHERE pl.nome_plano = 'gratuito' OR pl.nome_plano = 'pessoal'
GROUP BY c.cancao_nome
ORDER BY nome;