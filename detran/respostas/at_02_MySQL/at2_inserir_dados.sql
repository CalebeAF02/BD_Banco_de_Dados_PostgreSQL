-- Usando o banco de dados correto
USE detran_at2;

-- =========================================================================
-- 1. INSERIR REGISTROS (3 em cada tabela para garantir massa de dados)
-- =========================================================================

-- Inserindo na tabela PESSOA
INSERT INTO PESSOA (id, cpf, nome, sexo, data_nascimento, bairro, estado, cidade)
VALUES 
(10, '11122233344', 'Carlos Silva', 'Masculino', '1990-05-15 10:00:00', 'Asa Sul', 'DF', 'Brasília'),
(11, '55566677788', 'Ana Souza', 'Feminino', '1985-08-22 14:30:00', 'Copacabana', 'RJ', 'Rio de Janeiro'),
(12, '99988877766', 'Roberto Oliveira', 'Masculino', '1998-12-01 18:15:00', 'Savassi', 'MG', 'Belo Horizonte');

-- Inserindo na tabela PROPRIETARIO
INSERT INTO PROPRIETARIO (id_pessoa)
VALUES 
(10),
(11),
(12);

-- Inserindo na tabela CONDUTOR
INSERT INTO CONDUTOR (id_pessoa)
VALUES 
(10),
(11),
(12);

-- Inserindo na tabela TELEFONE
INSERT INTO TELEFONE (id, telefone, id_pessoa)
VALUES 
(1, '61999991111', 10),
(2, '21988882222', 11),
(3, '31977773333', 12);

-- Inserindo na tabela MODELO
INSERT INTO MODELO (id, codigo, nome)
VALUES 
(1, 101, 'Onix'),
(2, 102, 'Corolla'),
(3, 103, 'HB20');

-- Inserindo na tabela CATEGORIA
INSERT INTO CATEGORIA (id, codigo, nome)
VALUES 
(1, 'CAT-A', 'Particular'),
(2, 'CAT-B', 'Aluguel / Táxi'),
(3, 'CAT-C', 'Oficial');

-- Inserindo na tabela LOCAL
INSERT INTO LOCAL (id, codigo, posicao_geografica, velocidade_permitida)
VALUES 
(1, 'RADAR-01', '-15.7942,-47.8822', 60),
(2, 'RADAR-02', '-22.9068,-43.1729', 80),
(3, 'RADAR-03', '-19.9167,-43.9333', 70);

-- Inserindo na tabela AGENTE_TRANSITO
INSERT INTO AGENTE_TRANSITO (id, matricula, nome, data_contratacao)
VALUES 
(1, 'AGT-2026-01', 'Agente Marcos', '2020-02-10'),
(2, 'AGT-2026-02', 'Agente Patricia', '2018-06-15'),
(3, 'AGT-2026-03', 'Agente Lucas', '2022-11-01');

-- Inserindo na tabela TIPO_INFRACAO
INSERT INTO TIPO_INFRACAO (id, codigo, nome, valor)
VALUES 
(1, 'INF-001', 'Velocidade Superior à Máxima em até 20%', 130.16),
(2, 'INF-002', 'Avançar o Sinal Vermelho', 293.47),
(3, 'INF-003', 'Estacionar em Local Proibido', 130.16);

-- Inserindo na tabela VEICULO
INSERT INTO VEICULO (id, placa, chassi, cor_predominante, id_modelo, id_categoria, ano_fabricacao, id_proprietario)
VALUES 
(1, 'ABC1D23', '9BWZZZ111AAAAA001', 'Preto', 1, 1, 2022, 10),
(2, 'XYZ9W87', '9BWZZZ222BBBBB002', 'Prata', 2, 1, 2021, 11),
(3, 'MNO5K44', '9BWZZZ333CCCCC003', 'Branco', 3, 2, 2023, 12);

-- Inserindo na tabela INFRACAO
INSERT INTO INFRACAO (id, id_veiculo, id_condutor, data_hora, id_tipo_infracao, id_local, velocidade, id_agente_transito)
VALUES 
(1, 1, 10, '2026-05-10 15:30:00', 1, 1, 72, 1),
(2, 2, 11, '2026-05-11 09:45:00', 2, 2, NULL, 2),
(3, 3, 12, '2026-05-12 21:10:00', 3, 3, NULL, 3);