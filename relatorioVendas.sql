DELIMITER //
CREATE PROCEDURE RelatorioVendas (IN p_dataInicio DATE, IN p_dataFim DATE, IN p_codCategoria INT)
BEGIN
	SELECT p.codPedido AS codigo_pedido
    	c.nome AS Cliente
    	prod.nome AS Produto
    	cat.descricao AS Categoria
    	p.dataPedido AS data_pedido
    	SUM(pxp.quantidade * prod.preco) AS valor_total
    FROM
    	pedido p INNER JOIN cliente c ON p.codCli = c.codCliente
        INNER JOIN ped_x_prod pxp ON p.codPedido = pxp.codPed
        INNER JOIN produto prod ON pxp.codProd = prod.codProduto
        INNER JOIN categoria cat ON prod.codCat = cat.codCategoria
    WHERE 
        (p_dataInicia IS NULL OR p.dataPedido >= p_dataInicio) 
        AND
        (p_dataFim is NULL OR p.dataPedido <= p_dataFim)
        AND
        (p_codCategoria IS NULL OR prod.codCat = p_codCategoria)
        GROUP BY p.codPedido, c.nome, prod.nome, cat.descricao, p.dataPedido
        GROUP BY p.dataPedido DESC, valor_total DESC;
END;
DELIMITER //
        
    
    
