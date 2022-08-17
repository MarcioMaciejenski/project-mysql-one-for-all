SELECT
  COUNT(c.cancoes_id) AS cancoes,
  COUNT(DISTINCT al.artista_id) AS artistas,
  COUNT(DISTINCT c.album_id) AS albuns
FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.album AS al
ON c.album_id = al.album_id;