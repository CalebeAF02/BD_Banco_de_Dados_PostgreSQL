# Análise Teórica das Escolhas no MER/MR
Universidade de Brasília Instituto de Ciências Exatas Departamento de Ciência da Computação Disciplina: Banco de Dados

Este arquivo responde de forma teórica às decisões tomadas no modelo MER/MR do DETRAN.

## 1. Uso de chave substituta (`id`) em vez de chaves naturais (placa / CPF)

### O que o enunciado diz
- O enunciado afirma que:
  - "Veículos são identificados pela placa"
  - "O proprietário é identificado pelo CPF"
- Isso indica que, no mundo real, placa e CPF são identificadores naturais e únicos.

### O risco com a professora
- Se a professora for muito teórica, ela pode interpretar o enunciado como uma recomendação a usar placa como PK em `veiculos` e CPF como PK em `pessoas` ou `proprietarios`.
- Nessa visão, usar `id` substituto pode parecer que você ignorou as chaves naturais explicitamente mencionadas.
- Em correções mais tradicionais, isso pode custar alguns pontos se a professora valorizar chaves naturais no modelo conceitual.

### A realidade de mercado
- No mercado, o uso de chaves substitutas é comum e, em muitos casos, recomendado.
- `id` numérico simples gera índices mais eficientes e facilita referências entre tabelas.
- Usar CPF como PK em herança ou em várias tabelas pode tornar o modelo mais frágil e mais lento, especialmente em joins e alterações de tamanho do campo.
- Para sistemas reais, a prática usual é:
  - manter `id` como chave primária técnica,
  - manter `placa` e `cpf` como campos `UNIQUE NOT NULL` para garantir unicidade e integridade de negócio.

### Como se defender em apresentação
- Explique que a escolha foi feita para garantir desempenho e robustez:
  - chaves substitutas geram índices compactos e estáveis;
  - evitam dependência direta de atributos do mundo real que podem mudar ou ter formatação diversa.
- Reforce que `placa` e `cpf` continuam presentes no modelo como atributos obrigatórios e únicos.
- Diga que você respeitou a regra de negócio: a placa e o CPF ainda identificam unicamente o veículo e o proprietário no domínio, mesmo que não sejam as PKs físicas.

### Recomendação prática
- Se quiser agradar uma correção muito literal, mantenha o `id` como PK e adicione `UNIQUE` em `placa`/`cpf`.
- Em resumo: a escolha é tecnicamente correta e defensável, desde que a modelagem preserve a unicidade natural.

## 2. Criação de `condutores` e `proprietarios` (herança de pessoas)

### O que o enunciado diz
- O enunciado não fala explicitamente em `condutor`.
- Ele diz que a infração é identificada pelo veículo infrator, data/hora e tipo de infração.
- Isso sugere que o foco do problema é o veículo e não necessariamente a pessoa que estava dirigindo.

### O risco com a professora
- Essa é a decisão mais arriscada do modelo.
- Introduzir `condutores` como entidade nova significa que você está adicionando uma regra de negócio não pedida.
- Se a professora espera apenas o mínimo do enunciado, ela pode considerar isso como uma complicação desnecessária ou uma extrapolação.
- O mais crítico: agora a infração deixa de ser apenas do carro e passa a depender do condutor, o que não está no texto original.

### A realidade do mundo real
- No mundo real do DETRAN, existem dois papéis distintos:
  - o proprietário do veículo (quem possui o carro e paga multas)
  - o condutor (quem dirige e recebe a pontuação na CNH)
- Essa distinção é real e muito válida para um sistema de trânsito.
- Assim, a sua visão é sistematicamente correta para um modelo mais completo e realista.

### Como se defender em apresentação
- Explique que sua modelagem reflete a separação entre propriedade e direção.
- Diga que, no mundo real, multas/fotos capturam placa, mas a responsabilidade penal e de pontos envolve o condutor.
- Informe que o modelo principal do exercício ficou preservado, e `condutor` foi tratado como uma extensão lógica para o contexto real do DETRAN.
- Se for questionado, diga que a inclusão é opcional e que o sistema poderia funcionar sem ela, mas que sua solução precisa suportar um contexto mais completo.

### Recomendação prática
- Se sua nota depender de seguir estritamente o enunciado, considere deixar `condutor` como um módulo estendido ou opcional.
- Para apresentação, destaque que `condutor` é uma melhoria de modelagem, não uma exigência do enunciado.

## Conclusão geral
- Sua modelagem com `id` substituto é aceitável e apropriada para sistemas reais; apenas justifique que `placa` e `cpf` continuam únicos.
- A inclusão de `condutor` é uma escolha de modelagem mais avançada; ela é válida, mas deve ser explicada como uma extensão realista do problema.
- Se quiser jogar mais seguro na correção, deixe claro que o modelo básico do enunciado está preservado e que as decisões extras são melhorias, não violações.

> Em uma apresentação, a melhor defesa é demonstrar que você entendeu o enunciado e a prática do mercado, e que suas escolhas foram feitas para tornar o banco de dados mais consistente e escalável.
