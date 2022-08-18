SELECT
  COUNT(hr.usuario_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico_reproducao AS hr
INNER JOIN SpotifyClone.usuario AS us
ON hr.usuario_id = us.usuario_id
WHERE us.nome = 'Barbara' AND us.sobrenome = 'Liskov';