const db = require('./db');

class Convenio {
    
    static create({ nome, CNPJ }) {
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO Convenio (nome, CNPJ) VALUES (?, ?)`;
            db.query(sql, [nome, CNPJ], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    
    static findAll() {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM Convenio`;
            db.query(sql, (err, results) => {
                if (err) return reject(err);
                resolve(results);
            });
        });
    }

    
    static findById(id) {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM Convenio WHERE ID_Convenio = ?`;
            db.query(sql, [id], (err, results) => {
                if (err) return reject(err);
                resolve(results[0]); // Retorna o primeiro resultado
            });
        });
    }

    
    static update(id, { nome, CNPJ }) {
        return new Promise((resolve, reject) => {
            const sql = `UPDATE Convenio SET nome = ?, CNPJ = ? WHERE ID_Convenio = ?`;
            db.query(sql, [nome, CNPJ, id], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    
    static delete(id) {
        return new Promise((resolve, reject) => {
            const sql = `DELETE FROM Convenio WHERE ID_Convenio = ?`;
            db.query(sql, [id], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }
}

module.exports = Convenio;
