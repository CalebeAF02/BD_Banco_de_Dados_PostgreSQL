CREATE TABLE pessoas (
    id SERIAL PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    data_nascimento TIMESTAMP NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

CREATE TABLE proprietarios (
    id_pessoa INT PRIMARY KEY,

    CONSTRAINT fk_proprietario_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoas(id)
);

CREATE TABLE condutores (
    id_pessoa INT PRIMARY KEY,

    CONSTRAINT fk_condutor_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoas(id)
);

CREATE TABLE telefones (
    id SERIAL PRIMARY KEY,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    id_pessoa INT,

    CONSTRAINT fk_telefone_pessoa
        FOREIGN KEY (id_pessoa)
        REFERENCES pessoas(id)
);

CREATE TABLE modelos (
    id SERIAL PRIMARY KEY,
    codigo INT NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE locais (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    posicao_geografica VARCHAR(255) NOT NULL,
    velocidade_permitida INT
);

CREATE TABLE agentes_de_transito (
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    nome VARCHAR(100),
    data_contratacao DATE NOT NULL
);

CREATE TABLE tipos_de_infracoes (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    valor NUMERIC(10,2) NOT NULL
);

CREATE TABLE veiculos (
    id SERIAL PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    chassi VARCHAR(50) NOT NULL UNIQUE,
    cor_predominante VARCHAR(50),
    id_modelo INT,
    id_categoria INT,
    ano_fabricacao INT,
    id_proprietario INT,

    CONSTRAINT fk_veiculo_modelo
        FOREIGN KEY (id_modelo)
        REFERENCES modelos(id),

    CONSTRAINT fk_veiculo_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id),

    CONSTRAINT fk_veiculo_proprietario
        FOREIGN KEY (id_proprietario)
        REFERENCES proprietarios(id_pessoa)
);

CREATE TABLE infracoes (
    id SERIAL PRIMARY KEY,
    id_veiculo INT,
    id_condutor INT,
    data_hora TIMESTAMP,
    id_tipo_de_infracao INT,
    id_local INT,
    velocidade INT,
    id_agente_de_transito INT,

    CONSTRAINT fk_infracao_veiculo
        FOREIGN KEY (id_veiculo)
        REFERENCES veiculos(id),

    CONSTRAINT fk_infracao_condutor
        FOREIGN KEY (id_condutor)
        REFERENCES condutores(id_pessoa),

    CONSTRAINT fk_infracao_tipo
        FOREIGN KEY (id_tipo_de_infracao)
        REFERENCES tipos_de_infracoes(id),

    CONSTRAINT fk_infracao_local
        FOREIGN KEY (id_local)
        REFERENCES locais(id),

    CONSTRAINT fk_infracao_agente
        FOREIGN KEY (id_agente_de_transito)
        REFERENCES agentes_de_transito(id)
);