const mysql = require('mysql');
const { Client } = require('pg');

function createDatabaseConnection(dbType, config) {
    if (dbType === 'mysql') {
        const db = mysql.createConnection({
            host: config.host,
            user: config.user,
            password: config.password,
            database: config.database
        });
        db.connect(err => {
            if (err) throw err;
            console.log('Conectado ao banco de dados MySQL!');
        });
        return db;
    } else if (dbType === 'postgresql') {
        const db = new Client({
            host: config.host,
            user: config.user,
            password: config.password,
            database: config.database,
            port: config.port || 5432 // Porta padrão do PostgreSQL
        });
        db.connect(err => {
            if (err) throw err;
            console.log('Conectado ao banco de dados PostgreSQL!');
        });
        return db;
    } else {
        throw new Error('Tipo de banco de dados não suportado');
    }
}

const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'modeloLogico2',
    port: 5432
}
const dbType = process.env.DB_TYPE || 'mysql';

const db = createDatabaseConnection(dbType, dbConfig);

module.exports = db;
