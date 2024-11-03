/*1 pergunta*/
SELECT p.nome, COUNT(pe.ID_Evento) AS Total_Eventos
FROM Patrocinador p
JOIN Patrocina pe ON pe.ID_Patrocinador = p.ID_Patrocinador
GROUP BY p.nome
ORDER BY Total_Eventos DESC
LIMIT 1;


/*2 pergunta: Itens em estoque*/
SELECT i.nome, SUM(i.Quantidade_Item) AS Total_Pedidos
FROM Item i
GROUP BY i.nome
ORDER BY Total_Pedidos DESC;

/*2 pergunta: Ingredientes mais pedidos*/
SELECT ing.Nome, COUNT(c.fk_Ingrediente_ID_Ingrediente) AS Total_Requisicoes
FROM Ingrediente ing
JOIN contem c ON c.fk_Ingrediente_ID_Ingrediente = ing.ID_Ingrediente
GROUP BY ing.Nome
ORDER BY Total_Requisicoes DESC;

/*3 pergunta: Hora de pico consultas*/
SELECT Hora, COUNT(ID_Consulta) AS Total_Consultas
FROM Consulta
GROUP BY Hora
ORDER BY Total_Consultas DESC;

/*3 pergunta: Hora de pico reservas*/
SELECT Hora, COUNT(ID_Reserva) AS Total_Reservas
FROM Reserva
GROUP BY Hora
ORDER BY Total_Reservas DESC;

/*4 pergunta*/
SELECT Nome, Preco
FROM Ingrediente
ORDER BY Preco DESC;


/*5 pergunta*/
SELECT f.nome AS Fornecedor, SUM(fr.Quantidade_Fornecida) AS Total_Fornecido
FROM Fornecedor f
JOIN fornece fr ON fr.fk_Fornecedor_ID_Fornecedor = f.ID_Fornecedor
GROUP BY f.nome
ORDER BY Total_Fornecido DESC;
