SELECT titulo FROM livros;

SELECT nome 
FROM autores 
WHERE nascimento < '1900-01-01';

SELECT livros.titulo 
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id AND autores.nome = 'J.K. Rowling';

SELECT alunos.nome 
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id AND matriculas.curso = 'Engenharia de Software';

SELECT produto, SUM(receita) AS receitas_totais
FROM vendas 
GROUP BY produto;

SELECT nome, COUNT(*) AS quantidade_livros 
FROM autores 
INNER JOIN livros ON livros.autor_id = autores.id 
GROUP BY nome;

SELECT matriculas.curso, COUNT(alunos.id) AS quantidade_alunos 
FROM matriculas 
INNER JOIN alunos ON matriculas.aluno_id = alunos.id
GROUP BY curso;

SELECT produto, AVG(receita) AS media_receitas
FROM vendas 
GROUP BY produto;

SELECT produto, SUM(receita) AS receitas_totais
FROM vendas 
GROUP BY produto 
HAVING SUM(receita) > 10000;

SELECT nome, COUNT(*) AS quantidade_livros 
FROM autores
INNER JOIN livros ON livros.autor_id = autores.id
GROUP BY nome 
HAVING COUNT(*) = 2;

SELECT livros.titulo, autores.nome 
FROM livros 
LEFT JOIN autores ON livros.autor_id = autores.id;

SELECT alunos.nome, matriculas.curso 
FROM alunos 
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;

SELECT autores.nome, livros.titulo
FROM autores 
LEFT JOIN livros ON livros.autor_id = autores.id;

SELECT matriculas.curso, alunos.nome 
FROM alunos 
RIGHT JOIN matriculas ON matriculas.aluno_id = alunos.id;

SELECT matriculas.curso, alunos.nome 
FROM alunos 
INNER JOIN matriculas ON matriculas.aluno_id = alunos.id;

SELECT nome, COUNT(*) AS quantidade_livros
FROM autores 
INNER JOIN livros ON livros.autor_id = autores.id 
GROUP BY nome
ORDER BY COUNT(*) DESC LIMIT 1;

SELECT produto, SUM(receita) AS receitas_totais
FROM vendas 
GROUP BY produto
ORDER BY COUNT(*) ASC LIMIT 1;

/*Exercício 18*/

SELECT alunos.nome, COUNT(*) AS quantidade_matriculas
FROM matriculas INNER JOIN alunos ON matriculas.aluno_id = alunos.id 
GROUP BY nome;

SELECT produto, COUNT(*) AS quantidade_receitas
FROM vendas 
GROUP BY produto 
ORDER BY COUNT(*) DESC LIMIT 1;
