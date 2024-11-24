const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const Patrocinador = require('./patrocinador'); // Importa a classe
const Show = require('./Show');
const Convenio = require('./Convenio');
const Ingrediente = require('./Ingrediente');

const app = express();
const port = 3000;


 
app.use(cors());
app.use(bodyParser.json());

 
app.post('/patrocinadores', async (req, res) => {
    try {
        const result = await Patrocinador.create(req.body);
        res.status(201).json({ message: 'Patrocinador criado com sucesso!', id: result.insertId });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao criar patrocinador.');
    }
});

 
app.get('/patrocinadores', async (req, res) => {
    try {
        const patrocinadores = await Patrocinador.findAll();
        res.json(patrocinadores);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao buscar patrocinadores.');
    }
});
 
app.get('/patrocinadores/:id', async (req, res) => {
    try {
        const patrocinador = await Patrocinador.findById(req.params.id);
        if (patrocinador) {
            res.json(patrocinador);
        } else {
            res.status(404).send('Patrocinador não encontrado.');
        }
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao buscar patrocinador.');
    }
});

 
app.put('/patrocinadores/:id', async (req, res) => {
    try {
        await Patrocinador.update(req.params.id, req.body);
        res.send('Patrocinador atualizado com sucesso.');
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao atualizar patrocinador.');
    }
});

 
app.delete('/patrocinadores/:id', async (req, res) => {
    try {
        await Patrocinador.delete(req.params.id);
        res.send('Patrocinador deletado com sucesso.');
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao deletar patrocinador.');
    }
});

app.post('/shows', async (req, res) => {
    try {
        const result = await Show.create(req.body);
        res.status(201).json({ message: 'Show criado com sucesso!', id: result.insertId });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao criar o show.');
    }
});

app.get('/shows', async (req, res) => {
    try {
        const results = await Show.findAll();
        res.status(200).json(results);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao buscar shows.');
    }
});

app.get('/shows/:id', async (req, res) => {
    try {
        const result = await Show.findById(req.params.id);
        if (!result) return res.status(404).send('Show não encontrado.');
        res.status(200).json(result);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao buscar o show.');
    }
});

app.put('/shows/:id', async (req, res) => {
    try {
        const result = await Show.update(req.params.id, req.body);
        if (result.affectedRows === 0) return res.status(404).send('Show não encontrado.');
        res.status(200).json({ message: 'Show atualizado com sucesso!' });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao atualizar o show.');
    }
});

app.delete('/shows/:id', async (req, res) => {
    try {
        const result = await Show.delete(req.params.id);
        if (result.affectedRows === 0) return res.status(404).send('Show não encontrado.');
        res.status(200).json({ message: 'Show excluído com sucesso!' });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao excluir o show.');
    }
});

app.post('/convenios', async (req, res) => {
    try {
        const result = await Show.create(req.body);
        res.status(201).json({ message: 'Convenio criado com sucesso!', id: result.insertId });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao criar convenio.');
    }
});

app.get('/convenios', async (req, res) => {
    try {
        const results = await Convenio.findAll();
        res.status(200).json(results);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao buscar convênios.');
    }
});

app.get('/convenios/:id', async (req, res) => {
    try {
        const result = await Convenio.findById(req.params.id);
        if (!result) return res.status(404).send('Convênio não encontrado.');
        res.status(200).json(result);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao buscar o convênio.');
    }
});

app.put('/convenios/:id', async (req, res) => {
    try {
        const result = await Convenio.update(req.params.id, req.body);
        if (result.affectedRows === 0) return res.status(404).send('Convênio não encontrado.');
        res.status(200).json({ message: 'Convênio atualizado com sucesso!' });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao atualizar o convênio.');
    }
});

app.delete('/convenios/:id', async (req, res) => {
    try {
        const result = await Convenio.delete(req.params.id);
        if (result.affectedRows === 0) return res.status(404).send('Convênio não encontrado.');
        res.status(200).json({ message: 'Convênio excluído com sucesso!' });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao excluir o convênio.');
    }
});

app.post('/ingredientes', async (req, res) => {
    try {
        const result = await Ingrediente.create(req.body);
        res.status(201).json({ message: 'Ingrediente criado com sucesso!', id: result.insertId });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao criar ingrediente.');
    }
});

app.get('/ingredientes', async (req, res) => {
    try {
        const results = await Ingrediente.findAll();
        res.status(200).json(results);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao buscar ingredientes.');
    }
});

app.get('/ingredientes/:id', async (req, res) => {
    try {
        const result = await Ingrediente.findById(req.params.id);
        if (!result) return res.status(404).send('Ingrediente não encontrado.');
        res.status(200).json(result);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao buscar o ingrediente.');
    }
});

app.put('/ingredientes/:id', async (req, res) => {
    try {
        const result = await Ingrediente.update(req.params.id, req.body);
        if (result.affectedRows === 0) return res.status(404).send('Ingrediente não encontrado.');
        res.status(200).json({ message: 'Ingrediente atualizado com sucesso!' });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao atualizar o ingrediente.');
    }
});

app.delete('/ingredientes/:id', async (req, res) => {
    try {
        const result = await Ingrediente.delete(req.params.id);
        if (result.affectedRows === 0) return res.status(404).send('Ingrediente não encontrado.');
        res.status(200).json({ message: 'Ingrediente excluído com sucesso!' });
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao excluir o ingrediente.');
    }
});





 

// Iniciar o servidor
app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});
