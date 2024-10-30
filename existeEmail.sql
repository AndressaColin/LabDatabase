DELIMITER//
CREATE PROCEDURE InserirNovoCliente(IN nome VARCHAR(20), IN cpf INT, IN telefone INT, IN email VARCHAR(100))
BEGIN
	DECLARE existeEmail INT DEFAULT 0; 
   	DECLARE codigoConfirmacao INT; 
    
    SELECT COUNT(*) INTO existeEmail 
    FROM Cliente WHERE email = emailCliente; 
    
    IF existeEmail > 0 THEN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Este email já está cadastrado.'; 
    ELSE 
    SET codigoConfirmacao = FLOOR(100000 + RAND() * 900000);
    
    INSERT INTO Cliente (nome, cpf, telefone, email) VALUES (nomeCliente, cpfCliente, telefoneCliente, emailCliente); 
    SELECT codigoConfirmacao AS 'Código de Confirmação'; 
    END IF; 
END // 
DELIMITER ;

