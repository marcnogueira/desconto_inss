# Especificação funcional

## 1. Cadastro de proponente(CRUD)

Nome, CPF, Data de nascimento, endereço(logradouro, número, bairro, cidade, estado, CEP), telefones para contato(pessoais, referências), salário.
A listagem dos proponentes deve ser utilizada paginação, exibindo apenas 5 resultados por página.

## 2. Calculo de desconto de INSS

No formulário de cadastro do proponente, ao ser informado o valor do salário deve ser feita uma requisição ajax(XHR), que deverá retornar o valor do desconto do INSS. Esse valor deve ser exibido no formulário e registrado no cadastro.

Como calcular passo a passo:

### Tabela para Empregado, Empregado Doméstico e Trabalhador Avulso de 1o de janeiro 2020 a 29 de fevereiro de 2020

|  Salário de Contribuição (R$)   | Alíquota |
|---------------------------------|----------|
|  Até R$ 1.045,00                |   7,5%   |
|  De R$ 1.045,01 a R$ 2.089,60   |   9%     |
|  De R$ 2.089,61 até R$ 3.134,40 |   12%    |
|  De R$ 3.134,41 até R$ 6.101,06 |   14%    |
<https://www.inss.gov.br/servicos-do-inss/calculo-da-guia-da-previdencia-social-gps/tabela-de-contribuicao-mensal/>

Com as novas alíquotas e a nova forma de cálculo progressivo, o desconto do INSS deve ser calculado para cada faixa até que se atinja o valor do salário bruto.
Entre cada parcela, o cálculo é feito considerando o máximo e o mínimo destas e a alíquota a ser aplicada. Enquanto o valor do salário não é atingido, é considerado o teto da faixa salarial.

Veja como fica o cálculo para um salário de R$ 3.000,00 como exemplo, que se encontra na 3a faixa:

  ● 1a faixa salarial: 1.045,00 x 0,075 = 78,37
  ● 2a faixa salarial: [2.089,60 - 1.045,00] x 0,09 = 1.044,60 x 0,09 = 94,01
  ● Faixa que atinge o salário: [3.000,00 - 2.089,60] x 0,12 = 910,40 x 0,12 = 109,24
  ● Total a recolher: 109,24 + 94,01 + 78,37 = 281,62

## 3. Relatório dos funcionários

Deve ser criado um relatório para exibir os funcionários agrupando-os por faixas salariais, exibindo quantos funcionários existem em cada faixa salarial, seguindo as faixas:
  • Até R$ 1.045,00;
  • De R$ 1.045,01 a R$ 2.089,60;
  • De R$ 2.089,61 até R$ 3.134,40;
  • De R$ 3.134,41 até R$ 6.101,06.
Importante: O relatório deve exibir as informações em listagem assim como em gráfico.
