require('dotenv').config();
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');

// Import routes
const alunoRoutes = require('./routes/aluno.routes');
const notaRoutes = require('./routes/nota.routes');
const matriculaRoutes = require('./routes/matricula.routes');
const professorRoutes = require('./routes/professor.routes');
const presencaRoutes = require('./routes/presenca.routes');

// Initialize express app
const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(helmet()); // Security headers
app.use(cors()); // Enable CORS
app.use(morgan('dev')); // Logging
app.use(express.json()); // Parse JSON bodies
app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies

// Routes
app.use('/alunos', alunoRoutes);
app.use('/notas', notaRoutes);
app.use('/matriculas', matriculaRoutes);
app.use('/professores', professorRoutes);
app.use('/presencas', presencaRoutes);

// Root route
app.get('/', (req, res) => {
  res.json({ message: 'Bem-vindo à API do Sistema de Gerenciamento Escolar Infantil' });
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    error: true,
    message: 'Erro interno do servidor',
  });
});

// Start server
app.listen(PORT, async () => {
  console.log(`Servidor rodando na porta ${PORT}`);
  
  // Testar conexão com banco
  const db = require('./config/db.config');
  await db.testConnection();
});

module.exports = app;