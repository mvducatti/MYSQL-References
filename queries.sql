-- CREATEING DATABSE

    CREATE DATABASE PROJETO;

-- CONNECTING TO THE DESIRED DATABASE

    USE PROJETO;

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

-- SHOWING ALL TABLES

    SHOW TABLES;

-- INSERTING DATA 

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

-- DATA UPDATE

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

    -- UPDATING SINGLE CELL

        UPDATE CLIENTE SET CPF='234567891' WHERE CPF='1234567891';
        UPDATE CLIENTE SET CPF='112347891' WHERE CPF='12347891';
        UPDATE CLIENTE SET NOME='Liliane' WHERE NOME='Lilane';

-- DATA FILTERING

    -- SEARCHING WITH "=" //! -- TRY TO USE THIS OFTEN -- !

        SELECT NOME, SEXO, EMAIL FROM CLIENTE 
            WHERE ESTADO = 'SP';

        -- WITH TWO CONDITIONS

            SELECT NOME, SEXO, EMAIL FROM CLIENTE 
                WHERE ESTADO = 'SP' AND EMAIL IS NOT NULL;

            SELECT NOME, SEXO, EMAIL FROM CLIENTE 
                WHERE ESTADO = 'SP' AND EMAIL IS NULL;

    -- SEARCHING WITH "LIKE" AND "%" CHARACTER (JOKER) //! -- USE ONLY ON EMERGENCY, IT SLOWS DOWN YOUR ROCESSING -- !

        /* INSERT INTO CLIENTE 
            VALUES ('Ana Claudia','F','anaclaudia@gmail.com',651543896,'12382345','RJ'),
                ('Ana Carolina','F',NULL,389665154,'83212345','PR'),
                ('Mariana Ana','F',NULL,389665154,'83212345','RS'); */

        SELECT NOME, CPF, EMAIL, SEXO, ESTADO FROM CLIENTE 
            WHERE NOME LIKE '%ana'; -- expected "ana" and "mariana ana"

        SELECT NOME, CPF, EMAIL, SEXO, ESTADO FROM CLIENTE 
            WHERE NOME LIKE 'ana%'; -- expected "ana", "ana claudia" and "ana carolina"

        SELECT NOME, CPF, EMAIL, SEXO, ESTADO FROM CLIENTE 
            WHERE NOME LIKE '%ana%'; -- expected all "ana's" 

        SELECT NOME, CPF, EMAIL, SEXO, ESTADO FROM CLIENTE 
            WHERE NOME LIKE 'mari%'; -- expected "maria" and "mariana ana"

        -- WITH TWO CONDITIONS

            SELECT NOME, SEXO, EMAIL, ESTADO FROM CLIENTE 
                WHERE NOME LIKE 'ana%' AND EMAIL IS NOT NULL;

            SELECT NOME, SEXO, EMAIL, ESTADO FROM CLIENTE 
                WHERE NOME LIKE 'ana%' AND EMAIL IS NULL;

    -- SEARCHING WITH THREE OR MORE

        SELECT NOME, SEXO, EMAIL, ESTADO FROM CLIENTE 
            WHERE EMAIL IS NULL AND NOME LIKE 'ana%' OR ESTADO = 'SP';

    -- "AND" and "OR"

        SELECT NOME, SEXO, EMAIL, ESTADO FROM CLIENTE
            WHERE EMAIL IS NOT NULL AND NOME LIKE 'matias'; -- expected false

        SELECT NOME, SEXO, EMAIL, ESTADO FROM CLIENTE
            WHERE EMAIL IS NOT NULL OR NOME LIKE 'matias'; -- expected true

        SELECT NOME, SEXO, EMAIL, ESTADO FROM CLIENTE
            WHERE SEXO = 'F' AND NOME LIKE '%ana'; -- expected true, "ana" and "mariana ana"