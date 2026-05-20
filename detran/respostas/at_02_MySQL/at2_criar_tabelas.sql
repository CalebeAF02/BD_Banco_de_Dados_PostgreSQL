CREATE DATABASE IF NOT EXISTS DETRAN_AT2;

USE DETRAN_AT2;

CREATE TABLE PESSOA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    data_nascimento DATETIME NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

CREATE TABLE PROPRIETARIO (
    id_pessoa INT PRIMARY KEY,

    CONSTRAINT fk_proprietario_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES PESSOA(id)
);

CREATE TABLE CONDUTOR (
    id_pessoa INT PRIMARY KEY,

    CONSTRAINT fk_condutor_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES PESSOA(id)
);

CREATE TABLE TELEFONE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    id_pessoa INT,

    CONSTRAINT fk_telefone_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES PESSOA(id)
);

CREATE TABLE MODELO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo INT NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE CATEGORIA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE LOCAL (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    posicao_geografica VARCHAR(255) NOT NULL,
    velocidade_permitida INT
);

CREATE TABLE AGENTE_TRANSITO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    nome VARCHAR(100),
    data_contratacao DATE NOT NULL
);

CREATE TABLE TIPO_INFRACAO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    valor NUMERIC(10,2) NOT NULL
);

CREATE TABLE VEICULO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    chassi VARCHAR(50) NOT NULL UNIQUE,
    cor_predominante VARCHAR(50),
    id_modelo INT,
    id_categoria INT,
    ano_fabricacao INT,
    id_proprietario INT,

    CONSTRAINT fk_veiculo_modelo
        FOREIGN KEY (id_modelo)
        REFERENCES MODELO(id),

    CONSTRAINT fk_veiculo_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES CATEGORIA(id),

    CONSTRAINT fk_veiculo_proprietario
        FOREIGN KEY (id_proprietario)
        REFERENCES PROPRIETARIO(id_pessoa)
);

CREATE TABLE INFRACAO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT,
    id_condutor INT,
    data_hora DATETIME,
    id_tipo_infracao INT,
    id_local INT,
    velocidade INT,
    id_agente_transito INT,

    CONSTRAINT fk_infracao_veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES VEICULO(id),

    CONSTRAINT fk_infracao_condutor
        FOREIGN KEY (id_condutor)
        REFERENCES CONDUTOR(id_pessoa),

    CONSTRAINT fk_infracao_tipo
        FOREIGN KEY (id_tipo_infracao)
        REFERENCES TIPO_INFRACAO(id),

    CONSTRAINT fk_infracao_local
        FOREIGN KEY (id_local)
        REFERENCES LOCAL(id),

    CONSTRAINT fk_infracao_agente
        FOREIGN KEY (id_agente_transito)
        REFERENCES AGENTE_TRANSITO(id)
);