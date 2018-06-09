CREATE TABLE financiamento (
financiador VARCHAR(30),
num_parcelas INTEGER,
valor_parcela FLOAT,
valor_total FLOAT,
id_financiamento SERIAL PRIMARY KEY
)

CREATE TABLE tipo_veiculo (
tipo_combustivel VARCHAR(15),
id_tipo SERIAL PRIMARY KEY,
nome_tipo VARCHAR(15)
)

CREATE TABLE modelo (
altura FLOAT,
id_modelo SERIAL PRIMARY KEY,
marca VARCHAR(15),
largura FLOAT,
peso FLOAT,
capacidade FLOAT,
ano INTEGER,
eixos INTEGER,
nome_modelo VARCHAR(50),
comprimento FLOAT
)

CREATE TABLE veiculo_motorista (
id_veiculo_motorista SERIAL PRIMARY KEY,
id_veiculo INTEGER,
id_funcionario INTEGER
)

CREATE TABLE veiculo (
nome_veiculo VARCHAR(15),
placa VARCHAR(10),
chassi VARCHAR(15),
id_veiculo SERIAL PRIMARY KEY,
status INTEGER,
id_modelo INTEGER,
id_tipo INTEGER,
id_financiamento INTEGER,
id_seguro INTEGER,
FOREIGN KEY(id_modelo) REFERENCES Modelo (id_modelo),
FOREIGN KEY(id_tipo) REFERENCES Tipo_Veiculo (id_tipo),
FOREIGN KEY(id_financiamento) REFERENCES Financiamento (id_financiamento)
)

CREATE TABLE servico (
data_ini DATE,
valor_contrato FLOAT,
id_servico SERIAL PRIMARY KEY,
data_fim DATE,
status INTEGER,
origem VARCHAR(30),
destino VARCHAR(30),
id_cliente INTEGER
)

CREATE TABLE funcionario (
cargo VARCHAR(30),
id_funcionario SERIAL PRIMARY KEY,
id_usuario INTEGER,
endereco VARCHAR(30),
refeicao FLOAT,
salario FLOAT,
nome VARCHAR(50),
cpf BIGINT
)

CREATE TABLE seguro (
id_seguro SERIAL PRIMARY KEY,
Seguradora VARCHAR(20),
plano VARCHAR(20),
valor FLOAT,
data_vencimento DATE,
fim_contrato DATE,
status INTEGER
)

CREATE TABLE cliente (
id_cliente SERIAL PRIMARY KEY,
id_usuario INTEGER,
nome VARCHAR(50),
cnpj_cpf BIGINT,
tipo_cliente INTEGER, /* 1 para pessoa fisica e 0 para pessoa juridica */
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
)

CREATE TABLE usuario (
tipo_usuario VARCHAR(15),
senha VARCHAR(15),
id_usuario SERIAL PRIMARY KEY,
status INTEGER,
email VARCHAR(35)
)

CREATE TABLE veiculo_servico (
id_veiculo_motorista INTEGER,
id_servico INTEGER,
FOREIGN KEY(id_veiculo_motorista) REFERENCES veiculo_motorista (id_veiculo_motorista),
FOREIGN KEY(id_servico) REFERENCES servico (id_servico)
)

ALTER TABLE veiculo_motorista ADD FOREIGN KEY(id_veiculo) REFERENCES veiculo (id_veiculo)
ALTER TABLE veiculo_motorista ADD FOREIGN KEY(id_funcionario) REFERENCES funcionario (id_funcionario)
ALTER TABLE veiculo ADD FOREIGN KEY(id_seguro) REFERENCES seguro (id_seguro)
ALTER TABLE servico ADD FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente)
ALTER TABLE funcionario ADD FOREIGN KEY(id_usuario) REFERENCES usuario (id_usuario)
ALTER TABLE cliente ADD FOREIGN KEY(id_usuario) REFERENCES usuario (id_usuario)
