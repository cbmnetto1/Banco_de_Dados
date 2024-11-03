/* ModeloLogico_2: */

CREATE TABLE Pessoa (
    ID_pessoa INT PRIMARY KEY,
    Nome VARCHAR(50),
    CPF VARCHAR(11),
    Telefone VARCHAR(9),
    Endereco VARCHAR(80),
    fk_Convenio_ID_Convenio INT
);

CREATE TABLE Funcionario (
    ID_Funcionario INT,
    Nome VARCHAR(50),
    Cargo VARCHAR(50),
    CPF VARCHAR(11),
    telefone VARCHAR(9),
    Departamento VARCHAR(50),
    ID_medico INT,
    CRM INT,
    Especialidade VARCHAR(20),
    Funcionario_TIPO INT,
    PRIMARY KEY (ID_Funcionario, ID_medico)
);

CREATE TABLE Evento (
    ID_Evento INT PRIMARY KEY,
    Data DATE,
    Local VARCHAR(80),
    fk_Show_ID_Show INT
);

CREATE TABLE Consulta (
    ID_Consulta INT PRIMARY KEY,
    Data DATE,
    Hora TIME,
    ID_Medico INT,
    fk_Pessoa_ID_pessoa INT,
    fk_Funcionario_ID_Funcionario INT,
    fk_Funcionario_ID_medico INT
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Data_pedido DATE,
    Hora_Pedido TIME,
    ID_Mesa INT,
    fk_Pessoa_ID_pessoa INT
);

CREATE TABLE Patrocinador (
    ID_Patrocinador INT PRIMARY KEY,
    nome VARCHAR(50),
    Empresa VARCHAR(50)
);

CREATE TABLE Show (
    ID_Show INT PRIMARY KEY,
    artista VARCHAR(50),
    Horario TIME
);

CREATE TABLE Convenio (
    ID_Convenio INT PRIMARY KEY,
    nome VARCHAR(50),
    CNPJ VARCHAR(14)
);

CREATE TABLE Receita (
    ID_Receita INT PRIMARY KEY,
    Quantidade INT,
    Medicamento VARCHAR(50),
    ID_medico INT,
    fk_Funcionario_ID_Funcionario INT,
    fk_Funcionario_ID_medico INT
);

CREATE TABLE Item (
    ID_Item INT PRIMARY KEY,
    nome VARCHAR(50),
    preco DECIMAL,
    Quantidade_Item INT,
    fk_Pedido_ID_Pedido INT
);

CREATE TABLE Ingrediente (
    ID_Ingrediente INT PRIMARY KEY,
    Nome VARCHAR(50),
    Preco DECIMAL,
    Quantidade_Ingrediente INT
);

CREATE TABLE Fornecedor (
    ID_Fornecedor INT PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(80)
);

CREATE TABLE Reserva (
    ID_Reserva INT PRIMARY KEY,
    Data DATE,
    Hora TIME,
    ID_Mesa INT,
    ID_Cliente INT,
    fk_Pessoa_ID_pessoa INT
);

CREATE TABLE Mesa (
    ID_Mesa INT PRIMARY KEY,
    numero INT,
    Capacidade INT,
    fk_Reserva_ID_Reserva INT
);

CREATE TABLE Participa (
    fk_Evento_ID_Evento INT,
    fk_Pessoa_ID_pessoa INT
);

CREATE TABLE trabalhaEm (
    fk_Funcionario_ID_Funcionario INT,
    fk_Funcionario_ID_medico INT,
    fk_Evento_ID_Evento INT
);

CREATE TABLE Atende (
    fk_Funcionario_ID_Funcionario INT,
    fk_Funcionario_ID_medico INT,
    fk_Pedido_ID_Pedido INT
);

CREATE TABLE Patrocina (
    ID_Evento INT,
    ID_Patrocinador INT,
    PRIMARY KEY (ID_Evento, ID_Patrocinador),
    FOREIGN KEY (ID_Evento) REFERENCES Evento(ID_Evento),
    FOREIGN KEY (ID_Patrocinador) REFERENCES Patrocinador(ID_Patrocinador)
);

CREATE TABLE contem (
    fk_Item_ID_Item INT,
    fk_Ingrediente_ID_Ingrediente INT
);

CREATE TABLE fornece (
    fk_Ingrediente_ID_Ingrediente INT,
    fk_Fornecedor_ID_Fornecedor INT,
    Quantidade_Fornecida INT
);
 
ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_2
    FOREIGN KEY (fk_Convenio_ID_Convenio)
    REFERENCES Convenio (ID_Convenio)
    ON DELETE CASCADE;
 
ALTER TABLE Evento ADD CONSTRAINT FK_Evento_2
    FOREIGN KEY (fk_Show_ID_Show)
    REFERENCES Show (ID_Show)
    ON DELETE RESTRICT;
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_2
    FOREIGN KEY (fk_Pessoa_ID_pessoa)
    REFERENCES Pessoa (ID_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE Consulta ADD CONSTRAINT FK_Consulta_3
    FOREIGN KEY (fk_Funcionario_ID_Funcionario, fk_Funcionario_ID_medico)
    REFERENCES Funcionario (ID_Funcionario, ID_medico)
    ON DELETE RESTRICT;
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2
    FOREIGN KEY (fk_Pessoa_ID_pessoa)
    REFERENCES Pessoa (ID_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE Receita ADD CONSTRAINT FK_Receita_2
    FOREIGN KEY (fk_Funcionario_ID_Funcionario, fk_Funcionario_ID_medico)
    REFERENCES Funcionario (ID_Funcionario, ID_medico)
    ON DELETE RESTRICT;
 
ALTER TABLE Item ADD CONSTRAINT FK_Item_2
    FOREIGN KEY (fk_Pedido_ID_Pedido)
    REFERENCES Pedido (ID_Pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2
    FOREIGN KEY (fk_Pessoa_ID_pessoa)
    REFERENCES Pessoa (ID_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE Mesa ADD CONSTRAINT FK_Mesa_2
    FOREIGN KEY (fk_Reserva_ID_Reserva)
    REFERENCES Reserva (ID_Reserva)
    ON DELETE RESTRICT;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_1
    FOREIGN KEY (fk_Evento_ID_Evento)
    REFERENCES Evento (ID_Evento)
    ON DELETE RESTRICT;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_2
    FOREIGN KEY (fk_Pessoa_ID_pessoa)
    REFERENCES Pessoa (ID_pessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE trabalhaEm ADD CONSTRAINT FK_trabalhaEm_1
    FOREIGN KEY (fk_Funcionario_ID_Funcionario, fk_Funcionario_ID_medico)
    REFERENCES Funcionario (ID_Funcionario, ID_medico)
    ON DELETE RESTRICT;
 
ALTER TABLE trabalhaEm ADD CONSTRAINT FK_trabalhaEm_2
    FOREIGN KEY (fk_Evento_ID_Evento)
    REFERENCES Evento (ID_Evento)
    ON DELETE RESTRICT;
 
ALTER TABLE Atende ADD CONSTRAINT FK_Atende_1
    FOREIGN KEY (fk_Funcionario_ID_Funcionario, fk_Funcionario_ID_medico)
    REFERENCES Funcionario (ID_Funcionario, ID_medico)
    ON DELETE RESTRICT;
 
ALTER TABLE Atende ADD CONSTRAINT FK_Atende_2
    FOREIGN KEY (fk_Pedido_ID_Pedido)
    REFERENCES Pedido (ID_Pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_1
    FOREIGN KEY (fk_Item_ID_Item)
    REFERENCES Item (ID_Item)
    ON DELETE RESTRICT;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_2
    FOREIGN KEY (fk_Ingrediente_ID_Ingrediente)
    REFERENCES Ingrediente (ID_Ingrediente)
    ON DELETE RESTRICT;
 
ALTER TABLE fornece ADD CONSTRAINT FK_fornece_1
    FOREIGN KEY (fk_Ingrediente_ID_Ingrediente)
    REFERENCES Ingrediente (ID_Ingrediente)
    ON DELETE RESTRICT;
 
ALTER TABLE fornece ADD CONSTRAINT FK_fornece_2
    FOREIGN KEY (fk_Fornecedor_ID_Fornecedor)
    REFERENCES Fornecedor (ID_Fornecedor)
    ON DELETE RESTRICT;