const db = require('./db'); 

class Patrocinador {
    
    static create({ nome, Empresa }) {
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO Patrocinador (nome, Empresa) VALUES (?, ?)`;
            db.query(sql, [nome, Empresa], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

   
    static findAll() {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM Patrocinador`;
            db.query(sql, (err, results) => {
                if (err) return reject(err);
                resolve(results);
            });
        });
    }

    
    static findById(id) {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM Patrocinador WHERE ID_Patrocinador = ?`;
            db.query(sql, [id], (err, result) => {
                if (err) return reject(err);
                resolve(result[0]);
            });
        });
    }

  
    static update(id, { nome, Empresa }) {
        return new Promise((resolve, reject) => {
            const sql = `UPDATE Patrocinador SET nome = ?, Empresa = ? WHERE ID_Patrocinador = ?`;
            db.query(sql, [nome, Empresa, id], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

   
    static delete(id) {
        return new Promise((resolve, reject) => {
            const sql = `DELETE FROM Patrocinador WHERE ID_Patrocinador = ?`;
            db.query(sql, [id], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }
}

module.exports = Patrocinador;
