#05/11/26
Select * FROM enderecos;

-- Selecionar as casa com números
-- iguais ou maiores qe 150;
select * FROM enderecos
where bairro = ("Sao jose") or estado = "PE";

# quais estados estao na regiao sul?#

SELECT * FROM enderecos





/*Qual o ticket médio das pessoas na plataforma*/
SELECT * FROM alugueis;

SELECT cliente_id, AVG(preco_total) AS ticket_medico
FROM alugueis
GROUP BY cliente_id;


/*Quais dias tem maiores reservas*/
SELECT cliente_id, AVG(datediff(data_fim,data_inicio))
AS media_dias_estadias
FROM alugueis 
GROUP BY cliente_id
ORDER BY media_dias_estadias DESC;


/*Exibir os 10 proprietários com muitas propriedades ativas*/

SELECT * FROM proprietarios;

SELECT * FROM hospedagens;
SELECT * FROM hospedagens WHERE ativos = 1;

/*p = proprietário; selecionar os nomes dos proprietarios*/
SELECT p.nome AS nome_proprietario
FROM proprietarios p;
-- Contar quantas hospedagens cada proprietário tem
SELECT COUNT(h.hospedagem_id) AS total_hosp_atv
FROM hospedagens h;

-- Juntando as duas consultas
SELECT p.nome AS nome_proprietario,
COUNT(h.hospedagem_id) AS total_hosp_atv
FROM proprietarios p 
JOIN hospedagens h 
ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 1
GROUP BY p.nome
ORDER BY total_hosp_atv DESC
LIMIT 10;

/*Encontrar as propriedades inativas para entender por que estão com propriedades sem atividade*/
SELECT p.nome AS nome_proprietario,
COUNT(h.hospedagem_id) AS total_hosp_inatv
FROM proprietarios p
JOIN hospedagens h 
ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 0
GROUP BY p.nome
ORDER BY total_hosp_inatv DESC; 

/*COnsulte os meses com maior e menor demanda de alugueis*/
SELECT YEAR(data_inicio) AS ano,
MONTH(data_inicio) AS mes,
COUNT(*)
FROM alugueis
GROUP BY ano, mes
ORDER BY total_alugueis DESC
 


#Exercícios plataforma hospedagens - 19/11/2026

/*Para resolução dos exercícios, utilize a função "Reverse Engineer"
disponível em "Database" localizado na parte superior do MySQL,
para gerar os Diagramas Lógicos e facilitar a resolução dos problemas.*/

/*
1. Exiba somente os campos com o valor mais alto
de aluguel.
*/
SELECT * FROM reservas
ORDER BY preco_total DESC
LIMIT 10;

/*
2. Realize uma consulta que mostre o nome do cliente que mais
gastou, além de exibir o total de dias passados na hospedagem
*/
SELECT nome AS nome_cliente,
SUM(preco_total) AS total_gasto,
SUM(DATEDIFF(data_fim, data_inicio)) AS total_dias
FROM clientes 
INNER JOIN reservas ON cliente_id = cliente_id
GROUP BY cliente_id, nome
ORDER BY total_gasto DESC 
LIMIT 1;


/*
3. Desenvolva uma consulta em que sejam exibidos os tipos 
de imóveis mais bem avaliados, junto com os comentários.
*/
SELECT tipo AS tipo_imovel,
nota,
comentario
FROM avaliacoes INNER JOIN hospedagens h ON hospedagem_id = hospedagem_id
WHERE nota =(SELECT MAX(nota))
FROM avaliacoes
);
/*
4.Agora, realize uma consulta que retorne, além das 
avaliações e comentários, o nome do proprietario
e cidade da hospedagem dos tipos hoteis.
*/
SELECT nota AS avaliacao,
comentario,nome AS nome_proprietario,
cidade
FROM avaliacoes
INNER JOIN hospedagens ON hospedagem_id = hospedagem_id
INNER JOIN proprietarios ON proprietario_id = proprietario_id
INNER JOIN enderecos ON endereco_id = endereco_id
WHERE tipo LIKE '%hospedagens%';















SELECT * FROM proprietários;


#alterar o email do proprietário de id 1009
#para daniela_@email.com
UPDATE proprietários

