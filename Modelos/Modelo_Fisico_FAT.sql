CREATE TABLE Financiamento (
Financiador VARCHAR(30),
num_parcelas INTEGER,
valor_parcela FLOAT,
Valor_total FLOAT,
id_financiamento INTEGER PRIMARY KEY
)

CREATE TABLE Tipo_Veiculo (
tipo_combustivel VARCHAR(15),
id_tipo INTEGER PRIMARY KEY,
nome_tipo VARCHAR(15)
)

CREATE TABLE Modelo (
altura FLOAT,
id_modelo INTEGER PRIMARY KEY,
marca VARCHAR(15),
largura FLOAT,
peso FLOAT,
capacidade FLOAT,
ano INTEGER,
eixos INTEGER,
nome_modelo VARCHAR(15),
comprimento FLOAT
)

CREATE TABLE Veiculo_Motorista (
id_veiculo_motorista INTEGER PRIMARY KEY,
id_veiculo INTEGER,
id_motorista INTEGER
)

CREATE TABLE Veiculo (
nome_veiculo VARCHAR(15),
placa VARCHAR(10),
chassi VARCHAR(15),
id_veiculo INTEGER PRIMARY KEY,
status INTEGER,
id_modelo INTEGER,
id_tipo INTEGER,
id_financiamento INTEGER,
id_seguro INTEGER,
FOREIGN KEY(id_modelo) REFERENCES Modelo (id_modelo),
FOREIGN KEY(id_tipo) REFERENCES Tipo_Veiculo (id_tipo),
FOREIGN KEY(id_financiamento) REFERENCES Financiamento (id_financiamento)
)

CREATE TABLE Servico (
data_ini DATE,
valor_contrato FLOAT,
id_servico INTEGER PRIMARY KEY,
data_fim DATE,
status INTEGER,
origem VARCHAR(30),
destino VARCHAR(30),
id_cliente INTEGER
)

CREATE TABLE Funcionario (
cargo VARCHAR(30),
id_funcionario INTEGER PRIMARY KEY,
id_usuario INTEGER
)

CREATE TABLE Motorista (
endereco VARCHAR(20),
status INTEGER,
refeicao FLOAT,
cpf INTEGER,
salario FLOAT,
num_contato VARCHAR(18),
id_motorista INTEGER PRIMARY KEY,
nome VARCHAR(20),
id_funcionario INTEGER,
FOREIGN KEY(id_funcionario) REFERENCES Funcionario (id_funcionario)
)

CREATE TABLE Seguro (
id_seguro INTEGER PRIMARY KEY,
Seguradora VARCHAR(20),
Plano VARCHAR(20),
Valor FLOAT,
Data_vencimento DATE,
Fim_contrato DATE,
status INTEGER
)

CREATE TABLE Cliente (
id_cliente INTEGER PRIMARY KEY,
id_usuario INTEGER
)

CREATE TABLE Usuario (
cnpj_cpf INTEGER,
tipo_usuario VARCHAR(15),
senha VARCHAR(15),
id_usuario INTEGER PRIMARY KEY,
nome VARCHAR(20),
status INTEGER,
email VARCHAR(35)
)

CREATE TABLE Veiculo_Servico (
id_veiculo_motorista INTEGER,
id_servico INTEGER,
FOREIGN KEY(id_veiculo_motorista) REFERENCES Veiculo_Motorista (id_veiculo_motorista),
FOREIGN KEY(id_servico) REFERENCES Servico (id_servico)
)

ALTER TABLE Veiculo_Motorista ADD FOREIGN KEY(id_veiculo) REFERENCES Veiculo (id_veiculo)
ALTER TABLE Veiculo_Motorista ADD FOREIGN KEY(id_motorista) REFERENCES Motorista (id_motorista)
ALTER TABLE Veiculo ADD FOREIGN KEY(id_seguro) REFERENCES Seguro (id_seguro)
ALTER TABLE Servico ADD FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
ALTER TABLE Funcionario ADD FOREIGN KEY(id_usuario) REFERENCES Usuario (id_usuario)
ALTER TABLE Cliente ADD FOREIGN KEY(id_usuario) REFERENCES Usuario (id_usuario)
