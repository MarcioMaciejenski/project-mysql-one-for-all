SELECT
   DISTINCT CONCAT(us.nome, ' ', us.sobrenome) AS usuario,
   COUNT(DISTINCT hr.cancoes_id) AS qt_de_musicas_ouvidas,
   ROUND(SUM(c.duracao_segundos) / 60, 2) AS total_minutos
FROM SpotifyClone.historico_reproducao AS hr
INNER JOIN SpotifyClone.usuario AS us
ON hr.usuario_id = us.usuario_id
INNER JOIN SpotifyClone.cancoes AS c
ON hr.cancoes_id = c.cancoes_id
GROUP BY hr.usuario_id;