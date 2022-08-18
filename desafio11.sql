SELECT
  cancao_nome AS nome_musica,
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cancao_nome, 'Amar', 'Code Review')
  , 'SUPERSTAR', 'SUPERDEV'), 'Bard', 'QA'), 'SOUL', 'CODE'), 'Pais', 'Pull Requests')
  AS novo_nome
FROM SpotifyClone.cancoes
GROUP BY cancao_nome
HAVING nome_musica <> novo_nome
ORDER BY nome_musica DESC;