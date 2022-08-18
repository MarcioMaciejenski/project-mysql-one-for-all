SELECT
  ar.nome_artista AS artista,
  al.album_nome AS album,
  COUNT(sar.artista_id) AS seguidores
FROM SpotifyClone.seguindo_artistas AS sar
INNER JOIN SpotifyClone.artista AS ar
ON sar.artista_id = ar.artista_id
INNER JOIN SpotifyClone.album AS al
ON ar.artista_id = al.artista_id
GROUP BY al.album_nome, sar.artista_id
ORDER BY seguidores DESC, artista, album;