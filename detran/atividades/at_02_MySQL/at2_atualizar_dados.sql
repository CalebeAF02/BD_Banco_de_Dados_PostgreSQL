-- Usando o banco de dados correto
USE detran_at2;

-- =========================================================================
-- 2. ATUALIZAR REGISTROS (5 Updates conforme solicitado)
-- =========================================================================

SET SQL_SAFE_UPDATES = 0;

-- Update 1: Mudando o bairro e cidade de uma pessoa específica pelo CPF
UPDATE PESSOA 
SET bairro = 'Lago Sul', cidade = 'Brasília'
WHERE cpf = '11122233344';

-- Update 2: Alterando a velocidade permitida de um local pelo código do radar
UPDATE LOCAL 
SET velocidade_permitida = 50
WHERE codigo = 'RADAR-01';

-- Update 3: Atualizando o valor de uma multa por conta de reajuste
UPDATE TIPO_INFRACAO 
SET valor = 145.50
WHERE codigo = 'INF-001';

-- Update 4: Mudando a cor de um veículo baseado na placa
UPDATE VEICULO 
SET cor_predominante = 'Azul Marinho'
WHERE placa = 'XYZ9W87';

-- Update 5: Atualizando o nome de um agente pela matrícula dele
UPDATE AGENTE_TRANSITO 
SET nome = 'Inspetor Marcos Silva'
WHERE matricula = 'AGT-2026-01';