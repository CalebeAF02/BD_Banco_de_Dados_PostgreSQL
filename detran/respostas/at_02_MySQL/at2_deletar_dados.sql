-- Usando o banco de dados correto
USE detran_at2;

-- =========================================================================
-- 3. APAGAR REGISTROS (5 Deletes conforme solicitado)
-- =========================================================================

-- Delete 1, 2 e 3: Apagamos as TRÊS infrações do sistema.
-- Isso libera os vínculos de chave estrangeira que bloqueavam os outros deletes.
DELETE FROM INFRACAO 
WHERE id = 1;

DELETE FROM INFRACAO 
WHERE id = 2;

DELETE FROM INFRACAO 
WHERE id = 3; -- <--- Apagando esta primeiro, o erro 1451 desaparece!

-- Delete 4: Removendo um telefone específico
DELETE FROM TELEFONE 
WHERE telefone = '31977773333';

-- Delete 5: Agora sim! Como a infração 3 já foi apagada, o tipo de infração está livre para ser removido
DELETE FROM TIPO_INFRACAO 
WHERE id = 3;