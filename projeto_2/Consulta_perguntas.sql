-- 1 pergunta

SELECT f.fk_Pessoa_ID AS Funcionario_ID, p.Nome, COUNT(t.fk_Evento_ID_Evento) AS Qtd_Eventos
FROM Funcionario f
JOIN Pessoa p ON f.fk_Pessoa_ID = p.ID
JOIN Trabalha t ON t.fk_Funcionario_fk_Pessoa_ID = f.fk_Pessoa_ID
GROUP BY f.fk_Pessoa_ID, p.Nome
ORDER BY Qtd_Eventos DESC;

-- 2 pergunta: Itens Mais Pedidos
SELECT i.nome, SUM(i.Quantidade) AS Total_Pedidos
FROM Item i
GROUP BY i.nome
ORDER BY Total_Pedidos DESC;

-- 2 pergunta: Ingredientes mais pedidos
SELECT ing.Nome, COUNT(*) AS Total_Requisicoes
FROM Ingrediente ing
JOIN Contem_Ingrediente c ON c.fk_Ingrediente_ID_Ingrediente = ing.ID_Ingrediente
GROUP BY ing.Nome
ORDER BY Total_Requisicoes DESC;

-- 3 pergunta
SELECT Hora, COUNT(ID_Consulta) AS Total_Consultas
FROM Consulta
GROUP BY Hora
ORDER BY Total_Consultas DESC;

-- 4 pergunta

SELECT p.Nome, COUNT(pe.ID_Evento) AS Total_Eventos
FROM Patrocinador p
JOIN Patrocina pe ON pe.fk_Patrocina_ID_Patrocinador = p.ID_Patrocinador
GROUP BY p.Nome
ORDER BY Total_Eventos DESC
LIMIT 1;

-- 5 pergunta
SELECT Nome, Preco
FROM Ingrediente
ORDER BY Preco DESC;