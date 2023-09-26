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
	SELECT Categoria.Nome, COUNT(*) AS quantidade_de_livros
	FROM Livro 
	INNER JOIN Categoria ON Categoria.Categoria_ID = Livro.Categoria_ID 
	WHERE Categoria.Nome = nome
	GROUP BY Nome;
END;
// DELIMITER ;
CALL sp_ContarLivrosPorCategoria('Romance');

DELIMITER // 
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN nome VARCHAR(150), OUT livros VARCHAR(50))
BEGIN
	DECLARE quantidade_de_livros INT;
	SELECT COUNT(*) INTO quantidade_de_livros
	FROM Livro 
	INNER JOIN Categoria ON Categoria.Categoria_ID = Livro.Categoria_ID 
	WHERE Categoria.Nome = nome 
	GROUP BY Nome;
	IF quantidade_de_livros > 0 THEN
		SET livros = 'Tem livros';
	ELSE
		SET livros = 'Não tem livros';
	END IF;
END;
// DELIMITER ;
CALL sp_VerificarLivrosCategoria('Ficção Científica', @livros);
SELECT @livros;

DELIMITER // 
CREATE PROCEDURE sp_LivrosAteAno(publicacao INT)
BEGIN
	SELECT Titulo FROM Livro 
	WHERE Ano_Publicacao <= publicacao ;
END;
// DELIMITER ;
CALL sp_LivrosAteAno('2012');

DELIMITER // 
CREATE PROCEDURE sp_TitulosPorCategoria(IN nome VARCHAR(150))
BEGIN
	SELECT Livro.Titulo FROM Livro 
    	INNER JOIN Categoria 
   	WHERE Categoria.Categoria_ID = Livro.Categoria_ID 
    	AND Categoria.Nome = nome;
END;
// DELIMITER ;
CALL sp_TitulosPorCategoria('Ciência');
