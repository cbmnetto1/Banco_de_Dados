const db = require('./db'); 

class Show {
    
    static create({ artista, Horario }) {
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO Shows (artista, Horario) VALUES (?, ?)`;
            db.query(sql, [artista, Horario], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

    
    static findAll() {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM Shows`;
            db.query(sql, (err, results) => {
                if (err) return reject(err);
                resolve(results);
            });
        });
    }
 
    static findById(id) {
        return new Promise((resolve, reject) => {
            const sql = `SELECT * FROM Shows WHERE ID_Show = ?`;
            db.query(sql, [id], (err, result) => {
                if (err) return reject(err);
                resolve(result[0]);
            });
        });
    }
 
    static update(id, { artista, Horario }) {
        return new Promise((resolve, reject) => {
            const sql = `UPDATE Shows SET artista = ?, Horario = ? WHERE ID_Show = ?`;
            db.query(sql, [artista, Horario, id], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }

 
    static delete(id) {
        return new Promise((resolve, reject) => {
            const sql = `DELETE FROM Shows WHERE ID_Show = ?`;
            db.query(sql, [id], (err, result) => {
                if (err) return reject(err);
                resolve(result);
            });
        });
    }
}

module.exports = Show;
