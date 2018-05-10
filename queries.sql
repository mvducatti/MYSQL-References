-- CREATING TABLE

CREATE TABLE CLIENTE(
    NOME VARCHAR (30),
    SEXO CHAR (1),
    EMAIL VARCHAR (30),
    CPF INT (11),
    TELEFONE VARCHAR (30),
    ENDERECO VARCHAR (100)
);

-- CHECKING SPECIFICATIONS FROM TABLE

    DESC CLIENTE;

-- QUERY TO INSERT DATA INTO CLIENTE`S TABLE

-- EXCLUDING THE COLUMNS

    INSERT INTO CLIENTE VALUES ('Joao','M','joao@gmail.com',1234567891,'23458975','Sao Paulo');
    INSERT INTO CLIENTE VALUES ('Maria','F','maria@gmail.com',789111234,'89752345','Piaui');
    INSERT INTO CLIENTE VALUES ('Pedro','M','pedro@gmail.com',451239116,'75854923','Rio de Janeiro');
    INSERT INTO CLIENTE VALUES ('Marcos','M',NULL,451239116,'75854923','Sao Paulo');

-- NAMING THE COLUMNS

    INSERT INTO CLIENTE (NOME, SEXO, ENDERECO, TELEFONE, CPF)
        VALUES ('Lilane','F','Vinhedo','23475589',12347891);

-- COMPACT INSERT - MYSQL ONLY

    INSERT INTO CLIENTE 
        VALUES ('Ana','F','ana@gmail.com',791123456,'58972345','Parana'),
               ('Carla','F','carla@gmail.com',112789134,'23897545','Santos');

-- DATA FILTERING

    SELECT NOME, SEXO FROM CLIENTE 
        WHERE ENDERECO LIKE 'Sao Paulo';

-- ALTER COLUMN NAME

    ALTER TABLE CLIENTE 
        CHANGE `ENDERECO` `ESTADO` VARCHAR(15);

-- ALTER MUTIPLE VALUES FOR ROWS

    UPDATE CLIENTE
    SET ESTADO = CASE ESTADO 
                        WHEN 'Sao Paulo' THEN 'SP' 
                        WHEN 'Rio de Janeiro' THEN 'RJ' 
                        WHEN 'Santos' THEN 'SP' 
                        WHEN 'Parana' THEN 'PR' 
                        WHEN 'Piaui' THEN 'PI' 
                        ELSE ESTADO
                        END
    WHERE ESTADO IN('Sao Paulo', 'Rio de Janeiro','Santos','Parana','Piaui');

-- ALTER SINGLE VALUE FOR MULTIPLE ROWS

    UPDATE CLIENTE
    SET ESTADO = CASE ESTADO 
                        WHEN 'Vinhedo' THEN 'SP'  
                        ELSE ESTADO
                        END
    WHERE ESTADO IN('Vinhedo');

-- ALTER COLUMN TYPE

    ALTER TABLE CLIENTE MODIFY ESTADO CHAR(2);