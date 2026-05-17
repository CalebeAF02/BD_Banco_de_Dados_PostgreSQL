INSERT INTO pessoas 
(cpf, nome, sexo, data_nascimento, bairro, estado, cidade)
VALUES
('12345678901', 'Joao Silva', 'Masculino', '1990-05-10', 'Asa Sul', 'DF', 'Brasilia'),
('98765432100', 'Maria Oliveira', 'Feminino', '1985-08-22', 'Taguatinga', 'DF', 'Brasilia'),
('45678912300', 'Carlos Souza', 'Masculino', '1998-11-15', 'Ceilandia', 'DF', 'Brasilia');

INSERT INTO proprietarios (id_pessoa)
VALUES
(1),
(2),
(3);

INSERT INTO condutores (id_pessoa)
VALUES
(1),
(2),
(3);

INSERT INTO telefones (telefone, id_pessoa)
VALUES
('61999990001', 1),
('61999990002', 2),
('61999990003', 3);

INSERT INTO modelos (codigo, nome)
VALUES
(100001, 'Gol 1.0'),
(100002, 'Uno Mille'),
(100003, 'Civic LX');

INSERT INTO categorias (codigo, nome)
VALUES
('01', 'Automovel'),
('02', 'Motocicleta'),
('03', 'Caminhao');

INSERT INTO locais 
(codigo, posicao_geografica, velocidade_permitida)
VALUES
('L001', '-15.793889,-47.882778', 60),
('L002', '-15.780000,-47.930000', 80),
('L003', '-15.760000,-47.900000', 50);

INSERT INTO agentes_de_transito
(matricula, nome, data_contratacao)
VALUES
('AG001', 'Ricardo Mendes', '2015-03-10'),
('AG002', 'Fernanda Lima', '2018-07-21'),
('AG003', 'Paulo Henrique', '2020-01-15');

INSERT INTO tipos_de_infracoes
(codigo, nome, valor)
VALUES
('INF001', 'Excesso de velocidade', 195.23),
('INF002', 'Avanco de sinal vermelho', 293.47),
('INF003', 'Parada sobre faixa', 130.16);

INSERT INTO veiculos
(placa, chassi, cor_predominante, id_modelo, id_categoria, ano_fabricacao, id_proprietario)
VALUES
('ABC1D23', 'CHASSI001', 'Prata', 1, 1, 2018, 1),
('DEF4G56', 'CHASSI002', 'Preto', 2, 1, 2020, 2),
('GHI7J89', 'CHASSI003', 'Branco', 3, 2, 2022, 3);

INSERT INTO infracoes
(id_veiculo, id_condutor, data_hora, id_tipo_de_infracao, id_local, velocidade, id_agente_de_transito)
VALUES
(1, 1, '2026-05-10 14:30:00', 1, 1, 85, 1),
(2, 2, '2026-05-11 09:15:00', 2, 2, 110, 2),
(3, 3, '2026-05-12 22:45:00', 3, 3, 70, 3);