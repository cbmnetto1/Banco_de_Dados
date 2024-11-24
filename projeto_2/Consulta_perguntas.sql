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

-- 6 pergunta
SELECT 
    i.Nome AS Nome_Item,
    ing.Nome AS Nome_Ingrediente,
    SUM(ing.Quantidade) AS Quantidade_Total_Utilizada,
    SUM(ing.Quantidade * ing.Preco) AS Custo_Total_Ingrediente
FROM 
    Contem_Item ci
JOIN 
    Pedido p ON ci.fk_Pedido_ID_Pedido = p.ID_Pedido
JOIN 
    Item i ON ci.fk_Item_ID_Item = i.ID_Item
JOIN 
    Contem_Ingrediente ci_ing ON i.ID_Item = ci_ing.fk_Item_ID_Item
JOIN 
    Ingrediente ing ON ci_ing.fk_Ingrediente_ID_Ingrediente = ing.ID_Ingrediente
GROUP BY 
    i.ID_Item, i.Nome, ing.Nome
ORDER BY 
    SUM(p.ID_Pedido) DESC, Custo_Total_Ingrediente DESC;

-- 7 pergunta
SELECT 
    conv.nome AS Nome_Convenio,
    COUNT(cons.ID_Consulta) AS Frequencia_Visitas,
    AVG(itens.preco * itens.Quantidade_Item) AS Custo_Medio_Atendimento
FROM 
    Consulta cons
JOIN 
    Pessoa p ON cons.fk_Pessoa_ID_pessoa = p.ID_pessoa
JOIN 
    Convenio conv ON p.fk_Convenio_ID_Convenio = conv.ID_Convenio
LEFT JOIN 
    Pedido ped ON ped.fk_Pessoa_ID_pessoa = p.ID_pessoa
LEFT JOIN 
    Item itens ON itens.fk_Pedido_ID_Pedido = ped.ID_Pedido
GROUP BY 
    conv.nome
ORDER BY 
    Frequencia_Visitas DESC;

-- 8 pergunta
SELECT 
    m.numero AS Numero_Mesa,
    COUNT(r.ID_Reserva) AS Total_Reservas_Eventos
FROM 
    Reserva r
JOIN 
    Mesa m ON r.ID_Mesa = m.ID_Mesa
JOIN 
    Participa p ON r.fk_Pessoa_ID_pessoa = p.fk_Pessoa_ID_pessoa
JOIN 
    Evento e ON p.fk_Evento_ID_Evento = e.ID_Evento
GROUP BY 
    m.numero
ORDER BY 
    Total_Reservas_Eventos DESC;

-- 9 pergunta
SELECT 
    e.Local AS Tipo_Evento,
    SUM(i.preco * i.Quantidade_Item) AS Receita_Gerada
FROM 
    Evento e
JOIN 
    Participa p ON e.ID_Evento = p.fk_Evento_ID_Evento
JOIN 
    Pedido ped ON p.fk_Pessoa_ID_pessoa = ped.fk_Pessoa_ID_pessoa
JOIN 
    Item i ON i.fk_Pedido_ID_Pedido = ped.ID_Pedido
GROUP BY 
    e.Local
ORDER BY 
    Receita_Gerada DESC;

-- 10 pergunta
SELECT 
    r.Medicamento AS Nome_Medicamento,
    COUNT(r.ID_Receita) AS Total_Prescricoes
FROM 
    Receita r
GROUP BY 
    r.Medicamento
ORDER BY 
    Total_Prescricoes DESC;
