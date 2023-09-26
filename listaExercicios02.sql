DELIMITER // 
CREATE PROCEDURE sp_ListarAutores()
BEGIN
	SELECT Nome FROM Autor;
END;
// DELIMITER ;
CALL sp_ListarAutores();

DELIMITER //
CREATE PROCEDURE sp_LivrosPorCategoria(IN nome VARCHAR(150))
BEGIN
	SELECT Titulo FROM Livro
	INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
	AND Categoria.Nome = nome;
END;
// DELIMITER ;
CALL sp_LivrosPorCategoria('Autoajuda');

DELIMITER //
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN nome VARCHAR(150))
BEGIN
	SELECT Categoria.Nome, COUNT(*) AS quantidade_livros
	FROM Livro 
	INNER JOIN Categoria ON Categoria.Categoria_ID = Livro.Categoria_ID 
	WHERE Categoria.Nome = nome
	GROUP BY Nome;
END;
// DELIMITER ;
CALL sp_ContarLivrosPorCategoria('Romance');
