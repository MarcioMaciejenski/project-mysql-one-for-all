SELECT
  ar.nome_artista AS artista,
  al.album_nome AS album
FROM SpotifyClone.album AS al
INNER JOIN SpotifyClone.artista AS ar
ON al.artista_id = ar.artista_id
WHERE ar.nome_artista = 'Elis Regina'
ORDER BY album;