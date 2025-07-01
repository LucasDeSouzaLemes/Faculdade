const mysql = require('mysql2/promise');

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  port: 3306,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Função para testar conexão
const testConnection = async () => {
  try {
    const connection = await pool.getConnection();
    console.log('✅ Conexão com banco de dados estabelecida com sucesso!');
    connection.release();
    return true;
  } catch (err) {
    console.error('❌ Erro ao conectar com o banco de dados:', err.message);
    return false;
  }
};

pool.testConnection = testConnection;

module.exports = pool;