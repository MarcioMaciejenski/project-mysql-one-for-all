SELECT
  CONCAT(us.nome, ' ', us.sobrenome) AS usuario,
  IF(MAX(YEAR(hr.data_reproducao))>= '2021','Usuário ativo','Usuário inativo') AS status_usuario
FROM SpotifyClone.historico_reproducao AS hr
INNER JOIN SpotifyClone.usuario AS us
ON hr.usuario_id = us.usuario_id
GROUP BY hr.usuario_id
ORDER BY usuario;