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
