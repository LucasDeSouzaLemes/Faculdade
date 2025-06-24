-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS escola_infantil;
USE escola_infantil;

-- Tabela de Alunos
CREATE TABLE IF NOT EXISTS alunos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  data_nascimento DATE NOT NULL,
  endereco VARCHAR(255),
  telefone VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela de Matrículas (mantida porque tem relação com alunos)
CREATE TABLE IF NOT EXISTS matriculas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  aluno_id INT NOT NULL,
  data_matricula DATE NOT NULL,
  status VARCHAR(20) DEFAULT 'Ativa',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);

-- Tabela de Professores
CREATE TABLE IF NOT EXISTS professores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  telefone VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela de Notas (mantida porque tem relação com alunos)
CREATE TABLE IF NOT EXISTS notas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  aluno_id INT NOT NULL,
  professor_id INT,
  nota_aluno DECIMAL(4,2) NOT NULL,
  data_avaliacao DATE,
  observacao TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (aluno_id) REFERENCES alunos(id),
  FOREIGN KEY (professor_id) REFERENCES professores(id)
);

-- Tabela de Presença
CREATE TABLE IF NOT EXISTS presencas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  aluno_id INT NOT NULL,
  professor_id INT,
  data_aula DATE NOT NULL,
  presente BOOLEAN DEFAULT FALSE,
  observacao TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (aluno_id) REFERENCES alunos(id),
  FOREIGN KEY (professor_id) REFERENCES professores(id)
);

-- Inserção de 30 professores
INSERT INTO professores (nome, email, telefone) VALUES
('Ana Silva', 'ana.silva@escola.com', '(11) 99999-0001'),
('Carlos Santos', 'carlos.santos@escola.com', '(11) 99999-0002'),
('Maria Oliveira', 'maria.oliveira@escola.com', '(11) 99999-0003'),
('João Pereira', 'joao.pereira@escola.com', '(11) 99999-0004'),
('Fernanda Costa', 'fernanda.costa@escola.com', '(11) 99999-0005'),
('Roberto Lima', 'roberto.lima@escola.com', '(11) 99999-0006'),
('Juliana Alves', 'juliana.alves@escola.com', '(11) 99999-0007'),
('Pedro Rodrigues', 'pedro.rodrigues@escola.com', '(11) 99999-0008'),
('Camila Ferreira', 'camila.ferreira@escola.com', '(11) 99999-0009'),
('Lucas Martins', 'lucas.martins@escola.com', '(11) 99999-0010'),
('Patrícia Souza', 'patricia.souza@escola.com', '(11) 99999-0011'),
('Rafael Gomes', 'rafael.gomes@escola.com', '(11) 99999-0012'),
('Beatriz Dias', 'beatriz.dias@escola.com', '(11) 99999-0013'),
('Thiago Ribeiro', 'thiago.ribeiro@escola.com', '(11) 99999-0014'),
('Larissa Cardoso', 'larissa.cardoso@escola.com', '(11) 99999-0015'),
('Marcos Barbosa', 'marcos.barbosa@escola.com', '(11) 99999-0016'),
('Gabriela Rocha', 'gabriela.rocha@escola.com', '(11) 99999-0017'),
('Diego Nascimento', 'diego.nascimento@escola.com', '(11) 99999-0018'),
('Renata Castro', 'renata.castro@escola.com', '(11) 99999-0019'),
('Bruno Araújo', 'bruno.araujo@escola.com', '(11) 99999-0020'),
('Amanda Teixeira', 'amanda.teixeira@escola.com', '(11) 99999-0021'),
('Gustavo Mendes', 'gustavo.mendes@escola.com', '(11) 99999-0022'),
('Vanessa Pinto', 'vanessa.pinto@escola.com', '(11) 99999-0023'),
('Felipe Moreira', 'felipe.moreira@escola.com', '(11) 99999-0024'),
('Priscila Cunha', 'priscila.cunha@escola.com', '(11) 99999-0025'),
('André Freitas', 'andre.freitas@escola.com', '(11) 99999-0026'),
('Tatiana Lopes', 'tatiana.lopes@escola.com', '(11) 99999-0027'),
('Rodrigo Silva', 'rodrigo.silva@escola.com', '(11) 99999-0028'),
('Carla Monteiro', 'carla.monteiro@escola.com', '(11) 99999-0029'),
('Fábio Correia', 'fabio.correia@escola.com', '(11) 99999-0030');

-- CONSULTAS COM JOIN

-- 1. Alunos com suas matrículas
CREATE VIEW view_alunos_matriculas AS
SELECT 
    a.id,
    a.nome AS nome_aluno,
    a.data_nascimento,
    m.data_matricula,
    m.status
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id;

-- 2. Notas com aluno e professor
CREATE VIEW view_notas_completas AS
SELECT 
    n.id,
    a.nome AS nome_aluno,
    p.nome AS nome_professor,
    n.nota_aluno,
    n.data_avaliacao,
    n.observacao
FROM notas n
INNER JOIN alunos a ON n.aluno_id = a.id
LEFT JOIN professores p ON n.professor_id = p.id;

-- 3. Presenças com aluno e professor
CREATE VIEW view_presencas_completas AS
SELECT 
    pr.id,
    a.nome AS nome_aluno,
    p.nome AS nome_professor,
    pr.data_aula,
    pr.presente,
    pr.observacao
FROM presencas pr
INNER JOIN alunos a ON pr.aluno_id = a.id
LEFT JOIN professores p ON pr.professor_id = p.id;

-- 4. Relatório completo do aluno
CREATE VIEW view_relatorio_aluno AS
SELECT 
    a.id,
    a.nome AS nome_aluno,
    a.data_nascimento,
    m.data_matricula,
    m.status AS status_matricula,
    COUNT(DISTINCT n.id) AS total_notas,
    AVG(n.nota_aluno) AS media_notas,
    COUNT(DISTINCT pr.id) AS total_presencas,
    SUM(CASE WHEN pr.presente = 1 THEN 1 ELSE 0 END) AS presencas_confirmadas
FROM alunos a
LEFT JOIN matriculas m ON a.id = m.aluno_id
LEFT JOIN notas n ON a.id = n.aluno_id
LEFT JOIN presencas pr ON a.id = pr.aluno_id
GROUP BY a.id, a.nome, a.data_nascimento, m.data_matricula, m.status;

-- DADOS DE EXEMPLO PARA TESTAR OS JOINS

-- Inserir alguns alunos
INSERT INTO alunos (nome, data_nascimento, endereco, telefone) VALUES
('João Silva', '2015-03-15', 'Rua A, 123', '(11) 98888-1111'),
('Maria Santos', '2014-07-22', 'Rua B, 456', '(11) 98888-2222'),
('Pedro Costa', '2016-01-10', 'Rua C, 789', '(11) 98888-3333');

-- Inserir matrículas
INSERT INTO matriculas (aluno_id, data_matricula, status) VALUES
(1, '2024-01-15', 'Ativa'),
(2, '2024-01-20', 'Ativa'),
(3, '2024-02-01', 'Ativa');

-- Inserir algumas notas
INSERT INTO notas (aluno_id, professor_id, nota_aluno, data_avaliacao, observacao) VALUES
(1, 1, 8.5, '2024-03-15', 'Boa participação'),
(1, 2, 7.0, '2024-03-20', 'Precisa melhorar'),
(2, 1, 9.0, '2024-03-15', 'Excelente aluno'),
(3, 3, 6.5, '2024-03-18', 'Regular');

-- Inserir algumas presenças
INSERT INTO presencas (aluno_id, professor_id, data_aula, presente, observacao) VALUES
(1, 1, '2024-03-15', TRUE, 'Presente'),
(1, 2, '2024-03-16', FALSE, 'Faltou'),
(2, 1, '2024-03-15', TRUE, 'Presente'),
(3, 3, '2024-03-18', TRUE, 'Presente');

-- CONSULTAS PARA TESTAR OS JOINS
-- Execute estas consultas no MySQL Workbench:

-- SELECT * FROM view_alunos_matriculas;
-- SELECT * FROM view_notas_completas;
-- SELECT * FROM view_presencas_completas;
-- SELECT * FROM view_relatorio_aluno;
