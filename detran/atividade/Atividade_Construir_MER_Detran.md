# Lista de Exercício MER

## Projeto de Banco de Dados para o DETRAN-DF

O DETRAN do Distrito Federal deseja constituir um banco de dados para controlar as infrações ocorridas.

### Regras de negócio

- Veículos são identificados pela placa.
- Cada veículo é descrito por:
  - chassi
  - cor predominante
  - modelo
  - categoria
  - ano de fabricação
- Cada veículo possui um único proprietário.

### Proprietário

- O proprietário é identificado pelo CPF.
- Deve-se armazenar:
  - nome
  - endereço
  - bairro
  - cidade
  - estado
  - telefone(s)
  - sexo
  - data de nascimento
  - idade

### Modelo de veículo

- Todo veículo possui um único modelo.
- Exemplos:
  - GOL MI
  - GOL 1.8
  - UNO CS
- Cada modelo é codificado por um número de 6 dígitos.

### Categoria de veículo

- Cada veículo possui uma categoria.
- Exemplos:
  - AUTOMÓVEL
  - MOTOCICLETA
  - CAMINHÃO
- Cada categoria é codificada por um número de 2 dígitos.

### Infrações

- Existem diversos tipos de infração, como:
  - AVANÇO DE SINAL VERMELHO
  - PARADA SOBRE A FAIXA DE PEDESTRES
- Cada tipo de infração é identificado por um código associado.
- Cada infração tem um valor a ser cobrado no momento da ocorrência.

### Ocorrência de infração

- Uma infração é identificada por:
  - veículo infrator
  - data/hora
  - tipo de infração
- Também é importante registrar:
  - local
  - velocidade aferida (quando possível)
  - agente de trânsito

### Local

- Cada local é descrito por:
  - código
  - posição geográfica
  - velocidade permitida
- Um local é geralmente referenciado pelo código.

### Agente de trânsito

- Um agente de trânsito é conhecido através de sua matrícula.
- Descrição do agente:
  - nome
  - data de contratação
  - tempo de serviço

## Entidades sugeridas para o MER

- Veículo
- Proprietário
- Modelo
- Categoria
- Tipo de Infração
- Ocorrência de Infração
- Local
- Agente de Trânsito
- Telefone do Proprietário

## Possíveis relacionamentos

- Proprietário possui um ou mais veículos.
- Veículo tem um único proprietário.
- Veículo possui um único modelo.
- Veículo possui uma única categoria.
- Ocorrência de Infração envolve um veículo, um tipo de infração, um local e um agente.
- Local pode ser usado em várias ocorrências.
- Agente de Trânsito pode registrar várias infrações.
- Proprietário pode ter vários telefones.

## Observação final

Este arquivo é uma versão organizada e legível da atividade do PDF `Atividade_Construir_MER_Detran.pdf`, com a mesma informação reestruturada em seções claras e sugestões para o diagrama MER.