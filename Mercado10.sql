CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);
CREATE DATABASE mercado50;
USE mercado50;

CREATE DATABASE mercado;
USE mercado;

CREATE TABLE tbCep(
    cep VARCHAR(9) NOT NULL PRIMARY KEY,
    endereco VARCHAR(100),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    UF ENUM("AC", "AL", "AP", "AM", "BA")
);

CREATE TABLE fornecedor (
    cnpj BIGINT NOT NULL PRIMARY KEY,
    razaoSocial VARCHAR(100),
    nomeFantasia VARCHAR(60),
    dtCad DATE,
    cep VARCHAR(9),
    CONSTRAINT cepForn_Fk FOREIGN KEY (cep) REFERENCES tbCep(cep)
);

CREATE TABLE funcionario (
    codFunc INT NOT NULL PRIMARY KEY,
    nomeFunc VARCHAR(50),
    admissao DATE,
    cepFunc_Fk VARCHAR(9),
    FOREIGN KEY (cepFunc_Fk) REFERENCES tbCep(cep)
);

CREATE TABLE produto (
    codProd BIGINT NOT NULL PRIMARY KEY,
    descricao VARCHAR(50),
    dtVal DATE,
    cnpj_Fk BIGINT,
    FOREIGN KEY (cnpj_Fk) REFERENCES fornecedor(cnpj)
);

CREATE TABLE venda (
    codVenda INT AUTO_INCREMENT PRIMARY KEY,
    codFunc_FK INT,
    totalVendido FLOAT(10,2) DEFAULT 10,
    FOREIGN KEY (codFunc_FK) REFERENCES funcionario(codFunc)
);

CREATE TABLE itensVenda (
    codVenda_Fk INT,
    codProd_Fk BIGINT,
    hr_venda TIME,
    qtd_vendida INT,
    subtotal FLOAT,
    PRIMARY KEY (codVenda_FK, codProd_Fk, hr_venda),
    FOREIGN KEY (codVenda_Fk) REFERENCES venda (codVenda),
    FOREIGN KEY (codProd_Fk) REFERENCES produto (codProd)
);

-- Insert into fornecedor
INSERT INTO fornecedor (cnpj, razaoSocial, nomeFantasia, dtCad, cep) VALUES (1120386000158, 'Tramontina', 'Tramontina', '2023-01-01', NULL);
INSERT INTO fornecedor (cnpj, razaoSocial, nomeFantasia, dtCad, cep) VALUES (1120386000138, 'Brilux', 'Brilux', '2023-01-01', NULL);
INSERT INTO fornecedor (cnpj, razaoSocial, nomeFantasia, dtCad, cep) VALUES (1120386000137, 'Omo', 'Omo', '2023-01-01', NULL);
INSERT INTO fornecedor (cnpj, razaoSocial, nomeFantasia, dtCad, cep) VALUES (1120386000169, 'Friboy', 'Friboy', '2023-01-01', NULL);
INSERT INTO fornecedor (cnpj, razaoSocial, nomeFantasia, dtCad, cep) VALUES (1120386000145, 'Sadia', 'Sadia', '2023-01-01', NULL);

-- Insert into funcionario
INSERT INTO funcionario (codFunc, nomeFunc, admissao, cepFunc_Fk) VALUES (8854, 'Fabiane Correna', '2023-01-01', NULL);
INSERT INTO funcionario (codFunc, nomeFunc, admissao, cepFunc_Fk) VALUES (4567, 'Evelyn Barbosa', '2023-01-01', NULL);
INSERT INTO funcionario (codFunc, nomeFunc, admissao, cepFunc_Fk) VALUES (6586, 'Danilo Santos', '2023-01-01', NULL);
INSERT INTO funcionario (codFunc, nomeFunc, admissao, cepFunc_Fk) VALUES (4488, 'Eliana Ribeiro', '2023-01-01', NULL);
INSERT INTO funcionario (codFunc, nomeFunc, admissao, cepFunc_Fk) VALUES (5568, 'Tiago Ribeiro', '2023-01-01', NULL);

-- Insert into produto
INSERT INTO produto (codProd, descricao, dtVal, cnpj_Fk) VALUES (68, 'feijao', '2024-12-31', 1120386000158);
INSERT INTO produto (codProd, descricao, dtVal, cnpj_Fk) VALUES (75, 'arroz', '2024-12-31', 1120386000138);
INSERT INTO produto (codProd, descricao, dtVal, cnpj_Fk) VALUES (46, 'acucar', '2024-12-31', 1120386000137);
INSERT INTO produto (codProd, descricao, dtVal, cnpj_Fk) VALUES (25, 'farinha', '2024-12-31', 1120386000169);
INSERT INTO produto (codProd, descricao, dtVal, cnpj_Fk) VALUES (17, 'cafe', '2024-12-31', 1120386000145);

-- Insert into venda
INSERT INTO venda (codFunc_FK, totalVendido) VALUES (8854, 10);
INSERT INTO venda (codFunc_FK, totalVendido) VALUES (4567, 10);
INSERT INTO venda (codFunc_FK, totalVendido) VALUES (6586, 10);
INSERT INTO venda (codFunc_FK, totalVendido) VALUES (4488, 10);
INSERT INTO venda (codFunc_FK, totalVendido) VALUES (5568, 10);

-- Insert into itensVenda
INSERT INTO itensVenda (codVenda_Fk, codProd_Fk, hr_venda, qtd_vendida, subtotal) VALUES (1, 68, '12:00:00', 15, 127.5);
INSERT INTO itensVenda (codVenda_Fk, codProd_Fk, hr_venda, qtd_vendida, subtotal) VALUES (2, 75, '12:00:00', 28, 166.6);
INSERT INTO itensVenda (codVenda_Fk, codProd_Fk, hr_venda, qtd_vendida, subtotal) VALUES (3, 46, '12:00:00', 98, 343);
INSERT INTO itensVenda (codVenda_Fk, codProd_Fk, hr_venda, qtd_vendida, subtotal) VALUES (4, 25, '12:00:00', 45, 337.5);
INSERT INTO itensVenda (codVenda_Fk, codProd_Fk, hr_venda, qtd_vendida, subtotal) VALUES (5, 17, '12:00:00', 65, 422.5);

