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

DELIMITER // /*define um novo delimitador*/
CREATE PROCEDURE sp_LivrosAteAno(publicacao INT) /*cria a procedure com o parâmetro "publicacao"*/
BEGIN /*marca o início do código da procedure*/
	SELECT Titulo FROM Livro /*seleciona os titulos da tabela livro*/
	WHERE Ano_Publicacao <= publicacao ; /*restringe a consulta apenas para um ano menor ou igual*/
END; /*marca o final do código da procedure*/
// DELIMITER ; /*redefine o delimitador*/
CALL sp_LivrosAteAno('2012'); /*chama a procedure

DELIMITER // 
CREATE PROCEDURE sp_TitulosPorCategoria(IN nome VARCHAR(150))
BEGIN
	SELECT Livro.Titulo FROM Livro 
    	INNER JOIN Categoria 
   	WHERE Categoria.Categoria_ID = Livro.Categoria_ID AND Categoria.Nome = nome;
END;
// DELIMITER ;
CALL sp_TitulosPorCategoria('Ciência');

DELIMITER // 
CREATE PROCEDURE sp_AdicionarLivro(IN Vtitulo VARCHAR(255))
BEGIN
	DECLARE quantidade_de_livros INT;
    	SELECT COUNT(Titulo) INTO quantidade_de_livros 
	FROM Livro WHERE Vtitulo = Titulo;
	IF quantidade_de_livros = 0 THEN
		INSERT INTO Livro (Titulo) VALUES (Vtitulo);
	ELSE
		SELECT Titulo FROM Livro WHERE Titulo = Vtitulo;
	END IF;
END;
// DELIMITER ;
CALL sp_AdicionarLivro('Viczinha');

DELIMITER // 
CREATE PROCEDURE sp_AutorAntigo()
BEGIN 
	SELECT Nome FROM Autor 
    	ORDER BY Data_Nascimento LIMIT  1;
END; 
// DELIMITER ; 
CALL sp_AutorAntigo();
 
/*Expliquei o exercício 5*/

DELIMITER // 
CREATE PROCEDURE sp_LivrosESeusAutores()
BEGIN
	SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome 
    	FROM Livro INNER JOIN Autor_Livro 
    	INNER JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID 
    	AND Livro.Livro_ID = Autor_Livro.Livro_ID;
END;
// DELIMITER ;
CALL sp_LivrosESeusAutores();
