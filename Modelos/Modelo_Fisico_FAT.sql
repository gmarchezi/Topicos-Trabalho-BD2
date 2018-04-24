-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Financiamento (
Financiador VARCHAR(10),
num_parcelas VARCHAR(10),
valor_parcela VARCHAR(10),
Valor_total VARCHAR(10),
id_financiamento VARCHAR(10) PRIMARY KEY
)

CREATE TABLE Tipo_Veiculo (
tipo_combustivel Texto(1),
id_tipo Texto(1) PRIMARY KEY,
nome_tipo Texto(1)
)

CREATE TABLE Modelo (
altura Texto(1),
id_modelo Texto(1) PRIMARY KEY,
marca Texto(1),
largura Texto(1),
peso Texto(1),
capacidade Texto(1),
ano Texto(1),
eixos Texto(1),
nome_modelo Texto(1),
comprimento VARCHAR(10)
)

CREATE TABLE Veiculo_Motorista (
id_veiculo_motorista INTEGER PRIMARY KEY,
id_veiculo INTEGER,
id_motorista INTEGER
)

CREATE TABLE Veiculo (
nome_veiculo Texto(1),
placa Texto(1),
chassi Texto(1),
id_veiculo INTEGER PRIMARY KEY,
status Texto(1),
id_modelo Texto(1),
id_tipo Texto(1),
id_financiamento VARCHAR(10),
id_seguro VARCHAR(10),
FOREIGN KEY(id_modelo) REFERENCES Modelo (id_modelo),
FOREIGN KEY(id_tipo) REFERENCES Tipo_Veiculo (id_tipo),
FOREIGN KEY(id_financiamento) REFERENCES Financiamento (id_financiamento)
)

CREATE TABLE Servico (
data_ini Texto(1),
valor_contrato Texto(1),
id_servico Texto(1) PRIMARY KEY,
data_fim Texto(1),
status Texto(1),
origem VARCHAR(10),
destino VARCHAR(10),
id_cliente Texto(1)
)

CREATE TABLE Funcionario (
cargo VARCHAR(10),
id_funcionario VARCHAR(10) PRIMARY KEY,
id_usuario VARCHAR(10)
)

CREATE TABLE Motorista (
endereco Texto(1),
status Texto(1),
refeicao Texto(1),
cpf Texto(1),
salario Texto(1),
num_contato VARCHAR(10),
id_motorista INTEGER PRIMARY KEY,
nome Texto(1),
id_funcionario VARCHAR(10),
FOREIGN KEY(id_funcionario) REFERENCES Funcionario (id_funcionario)
)

CREATE TABLE Seguro (
id_seguro VARCHAR(10) PRIMARY KEY,
Seguradora VARCHAR(10),
Plano VARCHAR(10),
Valor VARCHAR(10),
Data_vencimento VARCHAR(10),
Fim_contrato VARCHAR(10),
status VARCHAR(10)
)

CREATE TABLE Cliente (
id_cliente Texto(1) PRIMARY KEY,
id_usuario VARCHAR(10)
)

CREATE TABLE Usuario (
cnpj_cpf VARCHAR(10),
tipo_usuario VARCHAR(10),
senha VARCHAR(10),
id_usuario VARCHAR(10) PRIMARY KEY,
nome VARCHAR(10),
status VARCHAR(10),
email VARCHAR(10)
)

CREATE TABLE Veiculo_Servico (
id_veiculo_motorista INTEGER,
id_servico Texto(1),
FOREIGN KEY(id_veiculo_motorista) REFERENCES Veiculo_Motorista (id_veiculo_motorista),
FOREIGN KEY(id_servico) REFERENCES Servico (id_servico)
)

ALTER TABLE Veiculo_Motorista ADD FOREIGN KEY(id_veiculo) REFERENCES Veiculo (id_veiculo)
ALTER TABLE Veiculo_Motorista ADD FOREIGN KEY(id_motorista) REFERENCES Motorista (id_motorista)
ALTER TABLE Veiculo ADD FOREIGN KEY(id_seguro) REFERENCES Seguro (id_seguro)
ALTER TABLE Servico ADD FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
ALTER TABLE Funcionario ADD FOREIGN KEY(id_usuario) REFERENCES Usuario (id_usuario)
ALTER TABLE Cliente ADD FOREIGN KEY(id_usuario) REFERENCES Usuario (id_usuario)
