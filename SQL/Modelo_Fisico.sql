-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
cnpj_cpf VARCHAR(10),
tipo_cliente DECIMAL(10),
status INTEGER,
id_cliente INTEGER PRIMARY KEY,
nome VARCHAR(10)
)

CREATE TABLE Servico (
data_ini DATETIME,
status INTEGER,
id_servico INTEGER PRIMARY KEY,
valor_servico NUMERIC(10),
data_fim DATETIME,
id_cliente INTEGER,
FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
)

CREATE TABLE Financiamento (
Financiador VARCHAR(10),
num_parcelas DECIMAL(10),
valor_parcela NUMERIC(10),
Valor_total NUMERIC(10),
id_financiamento INTEGER PRIMARY KEY
)

CREATE TABLE Veiculo_Motorista (
id_veiculo_motorista INTEGER PRIMARY KEY,
id_motorista INTEGER,
id_veiculo INTEGER
)

CREATE TABLE Veiculo_Servico (
id_veiculo_motorista INTEGER,
id_servico INTEGER,
FOREIGN KEY(id_veiculo_motorista) REFERENCES Veiculo_Motorista (id_veiculo_motorista),
FOREIGN KEY(id_servico) REFERENCES Servico (id_servico)
)

CREATE TABLE seguro (
id_seguro INTEGER PRIMARY KEY,
Seguradora VARCHAR(10),
Plano VARCHAR(10),
Valor NUMERIC(10),
Data_vencimento DATETIME,
Fim_contrato DATETIME,
status INTEGER
)

CREATE TABLE Veiculo (
nome_veiculo VARCHAR(10),
placa VARCHAR(10),
status NUMERIC(10),
chassi VARCHAR(10),
id_veiculo INTEGER PRIMARY KEY,
id_modelo INTEGER,
id_tipo INTEGER,
id_financiamento INTEGER,
id_seguro INTEGER,
FOREIGN KEY(id_financiamento) REFERENCES Financiamento (id_financiamento),
FOREIGN KEY(id_seguro) REFERENCES seguro (id_seguro)
)

CREATE TABLE Tipo_Veiculo (
tipo_combustivel VARCHAR(10),
id_tipo INTEGER PRIMARY KEY,
nome_tipo VARCHAR(10)
)

CREATE TABLE Motorista (
endereco VARCHAR(10),
status INTEGER,
nome VARCHAR(10),
id_motorista INTEGER PRIMARY KEY,
refeicao NUMERIC(10),
cpf VARCHAR(10),
salario NUMERIC(10),
num_contato VARCHAR(10)
)

CREATE TABLE Modelo (
altura NUMERIC(10),
id_modelo INTEGER PRIMARY KEY,
marca VARCHAR(10),
largura NUMERIC(10),
peso NUMERIC(10),
capacidade NUMERIC(10),
ano NUMERIC(10),
eixos VARCHAR(10),
comprimento NUMERIC(10),
nome_modelo VARCHAR(10)
)

ALTER TABLE Veiculo_Motorista ADD FOREIGN KEY(id_motorista) REFERENCES Motorista (id_motorista)
ALTER TABLE Veiculo_Motorista ADD FOREIGN KEY(id_veiculo) REFERENCES Veiculo (id_veiculo)
ALTER TABLE Veiculo ADD FOREIGN KEY(id_modelo) REFERENCES Modelo (id_modelo)
ALTER TABLE Veiculo ADD FOREIGN KEY(id_tipo) REFERENCES Tipo_Veiculo (id_tipo)
