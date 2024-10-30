DELIMITER //
CREATE PROCEDURE CalcularValorTotal (IN codPedido INT)
BEGIN
	DECLARE totalPedido DECIMAL(10,2);
    	DECLARE valorDesconto DECIMAL(10,2);
   	 
    SELECT SUM(pp.quantidade * pr.preco) INTO totalPedido
    FROM ped_x_prod pp JOIN produto pr ON pp.codProd = pr.codProduto
    WHERE pp.codPed = codPedido;
    
    SELECT valor INTO valorDesconto
    FROM desconto
    WHERE codPed = codPedido;
    
    IF valorDesconto IS NOT NULL THEN
    	SET valorPedido = valorPedido - valorDesconto;
    END IF;
END //
DELIMITER ;
