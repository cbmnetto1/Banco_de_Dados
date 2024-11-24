CREATE TABLE Pessoa (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Telefone VARCHAR(15),
    Endereco VARCHAR(80),
    fk_Convenio_ID_Convenio INT
);

CREATE TABLE Funcionario (
    Cargo VARCHAR(50),
    Departamento VARCHAR(50),
    fk_Pessoa_ID INT PRIMARY KEY
);

CREATE TABLE Medico (
    Especialidade VARCHAR(30),
    CRM VARCHAR(15) NOT NULL,
    fk_Funcionario_fk_Pessoa_ID INT PRIMARY KEY
);

CREATE TABLE Convenio (
    ID_Convenio INT PRIMARY KEY,
    Nome VARCHAR(50),
    CNPJ VARCHAR(14)
);

CREATE TABLE Consulta (
    ID_Consulta INT PRIMARY KEY,
    Hora TIME,
    Data DATE,
    fk_Pessoa_ID INT NOT NULL,
    fk_Medico_fk_Funcionario_fk_Pessoa_ID INT NOT NULL
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Data DATE,
    Hora TIME,
    Conteudo VARCHAR(20),
    fk_Pessoa_ID INT
);

CREATE TABLE Item (
    ID_Item INT PRIMARY KEY,
    Nome VARCHAR(20),
    Quantidade INT,
    Preco DECIMAL(10,2)
);

CREATE TABLE Ingrediente (
    ID_Ingrediente INT PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    Preco DECIMAL(10,2),
    Quantidade INT
);

CREATE TABLE Fornecedor (
    ID_Fornecedor INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50) NOT NULL
);

CREATE TABLE Evento (
    ID_Evento INT PRIMARY KEY,
    Data DATE,
    Hora TIME,
    Local VARCHAR(50) NOT NULL
);

CREATE TABLE Patrocinador (
    ID_Patrocinador INT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Empresa VARCHAR(30)
);

CREATE TABLE Atende (
    fk_Funcionario_fk_Pessoa_ID INT,
    fk_Pedido_ID_Pedido INT
    PRIMARY KEY (fk_Funcionario_ID, fk_Pedido_ID)
);

CREATE TABLE Contem_Item (
    fk_Pedido_ID_Pedido INT,
    fk_Item_ID_Item INT
    PRIMARY KEY (fk_Pedido_ID, fk_Item_ID)
);

CREATE TABLE Contem_Ingrediente (
    fk_Ingrediente_ID_Ingrediente INT,
    fk_Item_ID_Item INT
    PRIMARY KEY (fk_Ingrediente_ID, fk_Item_ID)
);

CREATE TABLE Fornece (
    fk_Fornece_ID_Fornecedor INT,
    fk_Ingrediente_ID_Ingrediente INT
    PRIMARY KEY (fk_Fornecedor_ID, fk_Ingrediente_ID)
);

CREATE TABLE Participa (
    fk_Evento_ID_Evento INT,
    fk_Pessoa_ID INT
    PRIMARY KEY (fk_Evento_ID, fk_Pessoa_ID)
);

CREATE TABLE Trabalha (
    fk_Evento_ID_Evento INT,
    fk_Funcionario_fk_Pessoa_ID INT
    PRIMARY KEY (fk_Evento_ID, fk_Funcionario_ID)
);

CREATE TABLE Patrocina (
    fk_Patrocina_ID_Patrocinador INT,
    fk_Evento_ID_Evento INT
    PRIMARY KEY (fk_Patrocinador_ID, fk_Evento_ID)
);
 
ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_2
    FOREIGN KEY (fk_Convenio_ID_Convenio)
    REFERENCES Convenio (ID_Convenio)
    ON DELETE CASCADE;
 
ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_2
    FOREIGN KEY (fk_Pessoa_ID)
    REFERENCES Pessoa (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Medico ADD CONSTRAINT FK_Medico_2
    FOREIGN KEY (fk_Funcionario_fk_Pessoa_ID)
    REFERENCES Funcionario (fk_Pessoa_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_2
    FOREIGN KEY (fk_Pessoa_ID)
    REFERENCES Pessoa (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_3
    FOREIGN KEY (fk_Medico_fk_Funcionario_fk_Pessoa_ID)
    REFERENCES Medico (fk_Funcionario_fk_Pessoa_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2
    FOREIGN KEY (fk_Pessoa_ID)
    REFERENCES Pessoa (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Atende ADD CONSTRAINT FK_Atende_1
    FOREIGN KEY (fk_Funcionario_fk_Pessoa_ID)
    REFERENCES Funcionario (fk_Pessoa_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Atende ADD CONSTRAINT FK_Atende_2
    FOREIGN KEY (fk_Pedido_ID_Pedido)
    REFERENCES Pedido (ID_Pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem_Item ADD CONSTRAINT FK_Contem_Item_1
    FOREIGN KEY (fk_Pedido_ID_Pedido)
    REFERENCES Pedido (ID_Pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem_Item ADD CONSTRAINT FK_Contem_Item_2
    FOREIGN KEY (fk_Item_ID_Item)
    REFERENCES Item (ID_Item)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem_Ingrediente ADD CONSTRAINT FK_Contem_Ingrediente_1
    FOREIGN KEY (fk_Ingrediente_ID_Ingrediente)
    REFERENCES Ingrediente (ID_Ingrediente)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem_Ingrediente ADD CONSTRAINT FK_Contem_Ingrediente_2
    FOREIGN KEY (fk_Item_ID_Item)
    REFERENCES Item (ID_Item)
    ON DELETE RESTRICT;
 
ALTER TABLE Fornece ADD CONSTRAINT FK_Fornece_1
    FOREIGN KEY (fk_Fornece_ID_Fornecedor)
    REFERENCES Fornecedor (ID_Fornecedor)
    ON DELETE RESTRICT;
 
ALTER TABLE Fornece ADD CONSTRAINT FK_Fornece_2
    FOREIGN KEY (fk_Ingrediente_ID_Ingrediente)
    REFERENCES Ingrediente (ID_Ingrediente)
    ON DELETE RESTRICT;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_1
    FOREIGN KEY (fk_Evento_ID_Evento)
    REFERENCES Evento (ID_Evento)
    ON DELETE RESTRICT;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_2
    FOREIGN KEY (fk_Pessoa_ID)
    REFERENCES Pessoa (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Trabalha ADD CONSTRAINT FK_Trabalha_1
    FOREIGN KEY (fk_Evento_ID_Evento)
    REFERENCES Evento (ID_Evento)
    ON DELETE RESTRICT;
 
ALTER TABLE Trabalha ADD CONSTRAINT FK_Trabalha_2
    FOREIGN KEY (fk_Funcionario_fk_Pessoa_ID)
    REFERENCES Funcionario (fk_Pessoa_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Patrocina ADD CONSTRAINT FK_Patrocina_1
    FOREIGN KEY (fk_Patrocina_ID_Patrocinador)
    REFERENCES Patrocinador (ID_Patrocinador)
    ON DELETE RESTRICT;
 
ALTER TABLE Patrocina ADD CONSTRAINT FK_Patrocina_2
    FOREIGN KEY (fk_Evento_ID_Evento)
    REFERENCES Evento (ID_Evento)
    ON DELETE RESTRICT;    