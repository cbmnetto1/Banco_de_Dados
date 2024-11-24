const db = require('./db');

class Ingrediente {
  
    static create({ Nome, Preco, Quantidade_Ingrediente }) {
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO Ingrediente (Nome, Preco, Quantidade_Ingrediente) VALUES (?, ?, ?)`;
            db.query(sql, [Nome, Preco, Quantidade_Ingrediente], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    
    static findAll() {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM Ingrediente`;
            db.query(sql, (err, results) => {
                if (err) return reject(err);
                resolve(results);
            });
        });
    }

     
    static findById(id) {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM Ingrediente WHERE ID_Ingrediente = ?`;
            db.query(sql, [id], (err, results) => {
                if (err) return reject(err);
                resolve(results[0]);  
            });
        });
    }
 
    static update(id, { Nome, Preco, Quantidade_Ingrediente }) {
        return new Promise((resolve, reject) => {
            const sql = `UPDATE Ingrediente SET Nome = ?, Preco = ?, Quantidade_Ingrediente = ? WHERE ID_Ingrediente = ?`;
            db.query(sql, [Nome, Preco, Quantidade_Ingrediente, id], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

   
    static delete(id) {
        return new Promise((resolve, reject) => {
            const sql = `DELETE FROM Ingrediente WHERE ID_Ingrediente = ?`;
            db.query(sql, [id], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }
}

module.exports = Ingrediente;
