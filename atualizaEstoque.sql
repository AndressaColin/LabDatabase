DELIMITER //
CREATE PROCEDURE atualizacaoEstoque (IN p_codProduto INT, IN p_quantidade INT)
BEGIN
	DECLARE estoqueAtual INT;
    
    SELECT estoque INTO estoqueAtual
    FROM produto WHERE codProduto = p_codProduto;
    
    IF estoqueAtual >= p_quantidade THEN
    	UPDATE produto
        SET estoque = estoque - p_quantidade,
        	ultimaAtualiza = CURRENT_DATE()
        WHERE codProduto = p_codProduto;
    ELSE
    	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estoque insuficiente para realizar a venda!'
    END IF;
END //
DELIMITER;
