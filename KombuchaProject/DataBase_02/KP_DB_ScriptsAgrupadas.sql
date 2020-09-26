-- SCRIPTS AGRUPADOS
<<<<<<< HEAD
CREATE SCHEMA tribos_kombucha;
=======
-- CREATE SCHEMA tribos_kombucha;
>>>>>>> e481a0874cad50f25d4cd25acc6d3b2f713e17c1
USE  tribos_kombucha;

-- Criação das tabelas

CREATE TABLE Funcionario(
	idFuncionario VARCHAR(11) PRIMARY KEY,
    nomeFuncionario CHAR(100) NOT NULL,
    cargo VARCHAR(40),
    senha VARCHAR(20)
);

CREATE TABLE ItemDeEstoque (
	idItem INT PRIMARY KEY,
    tipoItem VARCHAR(50) NOT NULL
);

CREATE TABLE Estoque(
	idItem INT,
	idItemEstoque INT,
    nomeItem VARCHAR(50),
    quantItem DOUBLE,
    
    FOREIGN KEY (idItemEstoque) references ItemDeEstoque(idItem),
    PRIMARY KEY(idItem , idItemEstoque)
);

CREATE TABLE Insumo(
    idInsumo INT PRIMARY KEY,
    idItemEstoque INT,
    nomeInsumo VARCHAR (50),
	descInsumo VARCHAR (100),
    
    FOREIGN KEY (idItemEstoque) references ItemDeEstoque(idItem)
);

CREATE TABLE Fermentador(
    idFermentador INT PRIMARY KEY,
    idItemEstoque INT,
    estadoProducao BOOL,
    volume DOUBLE,
    
    FOREIGN KEY (idItemEstoque) references ItemDeEstoque(idItem)
);


CREATE TABLE EmbalagemKombucha(
    idEmbalagem INT PRIMARY KEY,
    idItemEstoque INT,
    corEmbalagem VARCHAR(50),
    nomeEmbalagem VARCHAR(50),
    
    FOREIGN KEY (idItemEstoque) references ItemDeEstoque(idItem)
);

CREATE TABLE SaborKombucha(
    idKombucha  INT PRIMARY KEY,
    nomeKombucha VARCHAR(50) NOT NULL,
    chaBase VARCHAR(50) NOT NULL,
    idChaBase INT,
    prePreparoQuantCha DOUBLE NOT NULL,
	prePreparoQuantAgua DOUBLE NOT NULL,
    quantidadeAcucar DOUBLE NOT NULL,
    idEmbalagem INT,

    FOREIGN KEY (idEmbalagem) references EmbalagemKombucha (idEmbalagem),
    FOREIGN KEY (idChaBase) references Insumo(idInsumo)
);

CREATE TABLE Pedido(
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idSabor INT,
    nomeSabor VARCHAR(100),
    quantidadeProducao INT,
    idFermentador INT NOT NULL,
    idFermentadorExtra INT,
    idFuncionario VARCHAR(11),
	quantidadeCha  DOUBLE,
	quantidadeAgua  DOUBLE,
    quantidadeEmbalagem  INT,
    dataEntradaPedido DATETIME,
    
    FOREIGN KEY (idSabor) REFERENCES SaborKombucha(idKombucha),
    FOREIGN KEY (idFermentador) REFERENCES Fermentador(idFermentador),
	FOREIGN KEY (idFermentadorExtra) REFERENCES Fermentador(idFermentador),
    FOREIGN KEY (idFuncionario) references Funcionario(idFuncionario)
);


CREATE TABLE KombuchaPronto(
    idKombuchaPronto INT PRIMARY KEY ,
    idItemEstoque INT,
    idSabor INT,
	nomeProduto VARCHAR(50),
    dataFabricacao DATE,

    FOREIGN KEY (idItemEstoque) references ItemDeEstoque(idItem),
    FOREIGN KEY (idSabor) references SaborKombucha (idKombucha)
);

-- População inicial do banco

INSERT INTO Funcionario(
    idFuncionario,
    nomeFuncionario,
    cargo, 
    senha)
VALUES
<<<<<<< HEAD
    (1, 'Daniel', 'Teste', '1111');
=======
    ('1', 'Daniel', 'Teste', '1111'),
    ('06146045675', 'Deive', 'Dev', '123');
>>>>>>> e481a0874cad50f25d4cd25acc6d3b2f713e17c1
    
INSERT INTO ItemDeEstoque(
    idItem,
    tipoItem)
VALUES
    (1, 'Insumo'),
    (2, 'Embalagem'),
    (3, 'Fermentador'),
    (4, 'Kombucha Pronto');
    

INSERT INTO Insumo(
    idInsumo,
    idItemEstoque,
    nomeInsumo,
    descInsumo)
VALUES
    (1, 1, 'Água', 'Água Mineral'),
    (2, 1, 'Açucar', 'Organico'),
    (3, 1, 'Scoby', 'Colonia para fermentação'),
    (4, 1, 'Chá de Anis', 'Chá de Anis');
 
 INSERT INTO Fermentador(
	idFermentador,
    idItemEstoque,
    estadoProducao,
    volume)
VALUES
	(0, 3, true, 4),
    (1, 3, false, 4.0),
    (2, 3, false, 4.0),
    (3, 3, false, 4.0),
    (4, 3, false, 4.0),
    (5, 3, false, 4.0),
    (6, 3, false, 4.0),
    (7, 3, false, 4.0),
    (8, 3, false, 4.0);


 INSERT INTO EmbalagemKombucha(
        idEmbalagem,
        idItemEstoque,
		corEmbalagem,
		nomeEmbalagem)
VALUES
	(1, 2, 'Branco', 'Embalagem Anis'),
	(2, 2, 'Amarelo', 'Embalagem Abacaxi'),
    (3, 2, 'Verde', 'Embalagem Hibisco'),
    (4, 2, 'Laranja', 'Embalagem Gengibre');
     

 INSERT INTO SaborKombucha(
    idKombucha,
	nomeKombucha,
    chaBase,
    idChaBase,
    prePreparoQuantCha,
    prePreparoQuantAgua,
    quantidadeAcucar,
    idEmbalagem)
VALUES
        (1, 'Anis', 'Chá de Anis', 4, 0.025, 0.3, 0.045, 1);
        
 INSERT INTO Estoque(
    idItem,
	idItemEstoque,
    nomeItem,
    quantItem)
VALUES
        (1, 1, 'Água', 20),
        (2, 1, 'Açucar', 10),
        (3, 1, 'Scoby', 32),
        (4, 1, 'Chá de Anis', 2),
        (1, 2, 'Embalagem Anis', 32),
        (2, 2, 'Embalagem Abacaxi', 32),
        (3, 2, 'Embalagem Hibisco', 32),
        (4, 2, 'Embalagem Gengibre', 32),
        (1, 4, 'Kombucha Pronto Anis', 8),
        (2, 4, 'Kombucha Pronto Abacaxi', 8),
        (3, 4, 'Kombucha Pronto Hibisco', 8),
        (4, 4, 'Kombucha Pronto Gengibre', 8);
        
        
<<<<<<< HEAD
INSERT INTO pedido( 
					idSabor, 
=======
INSERT INTO Pedido( idSabor, 
>>>>>>> e481a0874cad50f25d4cd25acc6d3b2f713e17c1
                    quantidadeProducao, 
                    idFermentador,
                    idFermentadorExtra,
                    idFuncionario,
                    quantidadeCha,
                    quantidadeAgua,
                    quantidadeEmbalagem,
                    dataEntradaPedido)
	VALUES ( 1, 1, 0, NULL, 1, 1, 1, 1, NOW());
 
 -- SUB PROCEDURES MONTAGEM DE PEDIDOS
 
 -- Monta chá para pedido
DROP FUNCTION IF EXISTS montagemCha;
DELIMITER $$
CREATE FUNCTION montagemCha (idKombucha INT, qtdPedido INT)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE prePreparoQuantCha_aux DOUBLE;
    DECLARE quantidadeDeProducao DOUBLE;
	SELECT prePreparoQuantCha INTO prePreparoQuantCha_aux FROM tribos_kombucha.SaborKombucha WHERE idKombucha = idKombucha;
        SET quantidadeDeProducao = prePreparoQuantCha_aux * qtdPedido;

RETURN quantidadeDeProducao;
END;
$$
DELIMITER ;

-- Monta água para pedido
DROP FUNCTION IF EXISTS montagemAgua;
DELIMITER $$
CREATE FUNCTION montagemAgua (idKombucha INT, qtdPedido INT)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE prePreparoQuantAgua_aux DOUBLE;
    DECLARE quantidadeDeProducao DOUBLE;
	SELECT prePreparoQuantAgua INTO prePreparoQuantAgua_aux FROM tribos_kombucha.SaborKombucha WHERE idKombucha = idKombucha;
        SET quantidadeDeProducao = prePreparoQuantAgua_aux * qtdPedido;

RETURN quantidadeDeProducao;
END;
$$
DELIMITER ;
/* 
SELECT prePreparoQuantCha INTO prePreparoQuantCha_aux FROM tribos_kombucha.SaborKombucha WHERE idKombucha = idKombucha;
        SET quantidadeDeProducao = prePreparoQuantCha_aux * quantidadeDeProducao;
*/

-- Monta numero de embalagens para pedido
DROP FUNCTION IF EXISTS montagemEmbalagem;
DELIMITER $$
CREATE FUNCTION montagemEmbalagem (idKombucha INT, qtdPedido INT)
RETURNS DOUBLE DETERMINISTIC
BEGIN
	DECLARE quantEmbalagem_aux INT;

    SET quantEmbalagem_aux = 1 * qtdPedido;
	
RETURN quantEmbalagem_aux;
END;
$$
DELIMITER ;



-- Seta fermentador para pedido
DROP PROCEDURE IF EXISTS escolheFermentador;
DELIMITER $$
CREATE PROCEDURE escolheFermentador (idPedido_aux INT, volumeProducao DOUBLE)
BEGIN
	DECLARE estadoProducao_aux BOOL;
	DECLARE idFermentador_aux INT;
    DECLARE idFermentador_aux2 INT;
    DECLARE volumeProducao_aux DOUBLE;
	
    IF volumeProducao <= 4.0 THEN
 
      SELECT idFermentador INTO idFermentador_aux FROM tribos_kombucha.fermentador
		WHERE estadoProducao = 0
        ORDER BY idFermentador LIMIT 1;
		CALL alteraEstadoFermentador(idFermentador_aux);
        UPDATE pedido SET idFermentador = idFermentador_aux WHERE idPedido = idPedido_aux;
        /*
        INSERT INTO pedido(idFermentador) 
				VALUES(idFermentador_aux)
                WHERE idPedido = idPedido_aux;
        */
   ELSEIF volumeProducao > 4.0 AND volumeProducao < 8.0 THEN
		-- SET volumeProducao_aux = volumeProducao - 4;
		SELECT idFermentador INTO idFermentador_aux FROM tribos_kombucha.fermentador
			WHERE estadoProducao = 0
            ORDER BY idFermentador LIMIT 1;
            CALL alteraEstadoFermentador(idFermentador_aux);
            UPDATE pedido SET idFermentador = idFermentador_aux WHERE idPedido = idPedido_aux;
            /*
            INSERT INTO pedido( idFermentador)
				VALUES(idFermentador_aux);
             */   
		SELECT idFermentador INTO idFermentador_aux2 FROM tribos_kombucha.fermentador
			WHERE estadoProducao = 0
            ORDER BY idFermentador LIMIT 1;
            CALL alteraEstadoFermentador(idFermentador_aux2);
            UPDATE pedido SET idFermentadorExtra = idFermentador_aux2 WHERE idPedido = idPedido_aux;
            /*
            INSERT INTO pedido( idFermentador, idFermentadorExtra)
				VALUES(idFermentador_aux, idFermentador_aux2);
			*/
	END IF;
   
END;
$$
DELIMITER ;

-- 

DROP PROCEDURE IF EXISTS alteraEstadoFermentador;
DELIMITER $$
	CREATE PROCEDURE alteraEstadoFermentador (IN idFermentador_aux INT)
	BEGIN 
        UPDATE fermentador SET estadoProducao = 1 WHERE idFermentador = idFermentador_aux ;
	END;
$$
DELIMITER ;

-- 

DROP PROCEDURE IF EXISTS montaPedidoPreparo;
DELIMITER $$
<<<<<<< HEAD
	CREATE PROCEDURE montaPedidoPreparo (IN idFuncionario DOUBLE,
										 IN idKombucha INT, 
										 IN quantidadeDeProducao DOUBLE)
										 
	BEGIN 
=======
	CREATE PROCEDURE montaPedidoPreparo (IN idFuncionario VARCHAR(11),
    									 -- IN idKombucha INT,
                                         in saborKombuchaIN VARCHAR(52), -- nova entrada
										 IN quantidadeDeProducao DOUBLE)
	
                                         

										 
	BEGIN 
		
>>>>>>> e481a0874cad50f25d4cd25acc6d3b2f713e17c1
        DECLARE quantidadeDeProducao_aux INT;
        DECLARE idPedido_aux INT;
        DECLARE prePreparoQuantCha_aux DOUBLE;
        DECLARE quantEmEstoqueCha DOUBLE;
        DECLARE prePreparoQuantAgua_aux DOUBLE;
        DECLARE dataEntradaPedido DATETIME;
        DECLARE quantEmbalagem INT;
        DECLARE volumeProducao DOUBLE;
        DECLARE idSabor_aux INT;
        DECLARE nomeSabor_aux VARCHAR(100);
<<<<<<< HEAD
        
=======
        DECLARE idKombucha INT;
        
		SELECT idKombucha into idKombucha from saborkombucha where nomeKombucha = saborKombuchaIN; -- novo select     
>>>>>>> e481a0874cad50f25d4cd25acc6d3b2f713e17c1
		SELECT NOW() INTO dataEntradaPedido;
        
        -- FUNÇÃO DE DECREMENTO DE SKOOBY
              
		SET idSabor_aux = idKombucha;
        
        SELECT quantidadeDeProducao INTO quantidadeDeProducao_aux;
        SET prePreparoQuantCha_aux = montagemCha(idKombucha, quantidadeDeProducao);
        -- select prePreparoQuantCha_aux;
        
        SET quantEmbalagem = montagemEmbalagem (idKombucha, quantidadeDeProducao);
        
        
        SET prePreparoQuantAgua_aux = montagemAgua(idKombucha, quantidadeDeProducao);
        -- select dataEntradaPedido, prePreparoQuantAgua_aux;
        
        SET volumeProducao = prePreparoQuantAgua_aux + prePreparoQuantCha_aux;
     
<<<<<<< HEAD
		SELECT idPedido INTO idPedido_aux FROM tribos_kombucha.pedido
			ORDER BY idPedido DESC LIMIT 1;
		SET idPedido_aux = idPedido_aux + 1;
     
        SELECT nomeKombucha INTO nomeSabor_aux FROM tribos_kombucha.saborkombucha
			WHERE idKombucha = idSabor_aux;
        
        INSERT INTO pedido( 
=======
		SELECT idPedido INTO idPedido_aux FROM tribos_kombucha.Pedido
			ORDER BY idPedido DESC LIMIT 1;
		SET idPedido_aux = idPedido_aux + 1;
     
        SELECT nomeKombucha INTO nomeSabor_aux FROM tribos_kombucha.SaborKombucha
			WHERE idKombucha = idSabor_aux;
        
        INSERT INTO Pedido( 
>>>>>>> e481a0874cad50f25d4cd25acc6d3b2f713e17c1
							idSabor,
                            nomeSabor,
                            quantidadeProducao,
                            idFermentador,
                            idFuncionario,
                            quantidadeCha,
                            quantidadeAgua,
                            quantidadeEmbalagem,
                            dataEntradaPedido)
		VALUES(
			idKombucha,
            nomeSabor_aux,
            quantidadeDeProducao_aux,
            0,
            idFuncionario,
            prePreparoQuantCha_aux,
            prePreparoQuantAgua_aux,
            quantEmbalagem,
            dataEntradaPedido
			);
            
            CALL escolheFermentador(idPedido_aux, volumeProducao);
            
            -- inserção dos fermentadores no pedido
	END;
$$
DELIMITER ;

/*
-- EXEMPLO TESTE DE INSERÇÃO DE PEDIDO
<<<<<<< HEAD
SET @quantidadeDeProducao = 2;
CALL montaPedidoPreparo(1, 1, @quantidadeDeProducao);
=======
SET @quantidadeDeProducao = 13;
CALL montaPedidoPreparo('1', 'Anis', @quantidadeDeProducao);
>>>>>>> e481a0874cad50f25d4cd25acc6d3b2f713e17c1
SELECT @quantidadeDeProducao;



SELECT * FROM pedido;
SELECT * FROM fermentador;
*/