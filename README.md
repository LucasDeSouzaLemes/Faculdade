# 🏫 Sistema de Gerenciamento Escolar

## 📋 O que é este projeto?
Um sistema completo para gerenciar uma escola infantil com:
- ✅ Cadastro de **alunos**
- ✅ Cadastro de **professores** (30 já incluídos!)
- ✅ Controle de **matrículas**
- ✅ Registro de **notas**
- ✅ Controle de **presenças**
- ✅ **Relatórios** com dados relacionados

---

## ESTRUTURA DO PROJETO

```
Faculdade/
├── app/
│   ├── config/
│   │   └── db.config.js
│   ├── controllers/
│   │   ├── aluno.controller.js
│   │   ├── matricula.controller.js
│   │   └── nota.controller.js
│   ├── models/
│   │   ├── aluno.model.js
│   │   ├── matricula.model.js
│   │   └── nota.model.js
│   ├── routes/
│   │   ├── aluno.routes.js
│   │   ├── matricula.routes.js
│   │   └── nota.routes.js
│   └── index.js
├── docs/
│   ├── DFD.png
│   └── MER.png
├── sql/
│   ├── init.sql
│   └── usuario.sql
├── Dockerfile
├── Dockerfile.db
├── Dockerfile.nginx
├── nginx.conf
├── docker-compose.yml
├── .env
├── package.json
└── README.md
```

---

## 🚀 COMO EXECUTAR (PASSO A PASSO)

### ⚠️ ANTES DE COMEÇAR
**Você precisa ter instalado:**
1. **Docker Desktop** - [Baixar aqui](https://www.docker.com/products/docker-desktop/)
2. **Git** - [Baixar aqui](https://git-scm.com/downloads)

### 📥 PASSO 1: BAIXAR O PROJETO
```bash
# 1. Abra o Terminal/Prompt de Comando
# 2. Cole este comando e pressione ENTER:
git clone https://github.com/LucasDeSouzaLemes/Faculdade.git

# 3. Entre na pasta do projeto:
cd Faculdade
```

### 🐳 PASSO 2: EXECUTAR O SISTEMA
```bash
# Cole este comando e pressione ENTER:
docker-compose up -d --build

# ⏳ Aguarde 2-3 minutos para tudo inicializar...
```

### ✅ PASSO 3: VERIFICAR SE FUNCIONOU
1. **Abra seu navegador**
2. **Acesse:** http://localhost/api/professores
3. **Se aparecer uma lista com 30 professores = FUNCIONOU!** 🎉

---

## 🗄️ CONECTAR NO BANCO DE DADOS

### Para MySQL Workbench:
```
🔗 Host: localhost
🔢 Porta: 3306
👤 Usuário: root
🔐 Senha: 0000
🗃️ Banco: escola_infantil
```

### ✨ O que você vai encontrar:
- **30 professores** já cadastrados
- **5 tabelas** criadas automaticamente
- **4 views** com relatórios prontos
- **Dados de exemplo** para testar

---

## 🌐 TESTANDO A API

### 🔍 URLs Principais:
- **Ver todos os professores:** http://localhost/api/professores
- **Ver todos os alunos:** http://localhost/api/alunos
- **Ver todas as matrículas:** http://localhost/api/matriculas
- **Ver todas as notas:** http://localhost/api/notas
- **Ver todas as presenças:** http://localhost/api/presencas

### 📝 Como Criar Dados (POST)

**🧑‍🎓 Criar Aluno:**
```json
POST http://localhost/api/alunos
{
  "nome": "João Silva",
  "data_nascimento": "2015-03-15",
  "endereco": "Rua das Flores, 123",
  "telefone": "(11) 98765-4321"
}
```

**📚 Criar Matrícula:**
```json
POST http://localhost/api/matriculas
{
  "aluno_id": 1,
  "data_matricula": "2024-01-15",
  "status": "Ativa"
}
```

**📝 Criar Nota:**
```json
POST http://localhost/api/notas
{
  "aluno_id": 1,
  "professor_id": 1,
  "valor": 8.5,
  "data_avaliacao": "2024-03-15",
  "observacao": "Boa participação"
}
```

**✅ Registrar Presença:**
```json
POST http://localhost/api/presencas
{
  "aluno_id": 1,
  "professor_id": 1,
  "data_aula": "2024-03-15",
  "presente": true,
  "observacao": "Presente"
}
```

---

## 🧪 TESTES COMPLETOS DAS ROTAS

### 👨‍🏫 PROFESSORES
```bash
# ✅ Listar todos (30 já incluídos)
GET http://localhost/api/professores

# ✅ Buscar por ID
GET http://localhost/api/professores/1

# ✅ Criar novo professor
POST http://localhost/api/professores
{
  "nome": "Maria Silva",
  "email": "maria@escola.com",
  "telefone": "(11) 99999-9999"
}

# ✅ Atualizar professor
PUT http://localhost/api/professores/1
{
  "nome": "Ana Silva Atualizada",
  "email": "ana.nova@escola.com",
  "telefone": "(11) 88888-8888"
}

# ✅ Deletar professor
DELETE http://localhost/api/professores/31
```

### 🧑‍🎓 ALUNOS
```bash
# ✅ Listar todos
GET http://localhost/api/alunos

# ✅ Buscar por ID
GET http://localhost/api/alunos/1

# ✅ Criar novo aluno
POST http://localhost/api/alunos
{
  "nome": "Pedro Santos",
  "data_nascimento": "2016-05-20",
  "endereco": "Rua das Palmeiras, 456",
  "telefone": "(11) 97777-7777"
}

# ✅ Atualizar aluno
PUT http://localhost/api/alunos/1
{
  "nome": "João Silva Atualizado",
  "data_nascimento": "2015-03-15",
  "endereco": "Rua Nova, 789",
  "telefone": "(11) 96666-6666"
}

# ✅ Deletar aluno
DELETE http://localhost/api/alunos/4
```

### 📚 MATRÍCULAS
```bash
# ✅ Listar todas
GET http://localhost/api/matriculas

# ✅ Buscar por ID
GET http://localhost/api/matriculas/1

# ✅ Criar nova matrícula
POST http://localhost/api/matriculas
{
  "aluno_id": 2,
  "data_matricula": "2024-02-01",
  "status": "Ativa"
}

# ✅ Atualizar matrícula
PUT http://localhost/api/matriculas/1
{
  "aluno_id": 1,
  "data_matricula": "2024-01-15",
  "status": "Inativa"
}

# ✅ Deletar matrícula
DELETE http://localhost/api/matriculas/4
```

### 📝 NOTAS
```bash
# ✅ Listar todas
GET http://localhost/api/notas

# ✅ Buscar por ID
GET http://localhost/api/notas/1

# ✅ Buscar notas por aluno
GET http://localhost/api/notas/aluno/1

# ✅ Criar nova nota
POST http://localhost/api/notas
{
  "aluno_id": 2,
  "professor_id": 2,
  "valor": 9.0,
  "data_avaliacao": "2024-03-20",
  "observacao": "Excelente desempenho"
}

# ✅ Atualizar nota
PUT http://localhost/api/notas/1
{
  "aluno_id": 1,
  "professor_id": 1,
  "valor": 9.5,
  "data_avaliacao": "2024-03-15",
  "observacao": "Participação excepcional"
}

# ✅ Deletar nota
DELETE http://localhost/api/notas/5
```

### ✅ PRESENÇAS
```bash
# ✅ Listar todas
GET http://localhost/api/presencas

# ✅ Buscar por ID
GET http://localhost/api/presencas/1

# ✅ Criar nova presença
POST http://localhost/api/presencas
{
  "aluno_id": 2,
  "professor_id": 2,
  "data_aula": "2024-03-20",
  "presente": false,
  "observacao": "Faltou por motivo médico"
}

# ✅ Atualizar presença
PUT http://localhost/api/presencas/1
{
  "aluno_id": 1,
  "professor_id": 1,
  "data_aula": "2024-03-15",
  "presente": true,
  "observacao": "Presente e participativo"
}

# ✅ Deletar presença
DELETE http://localhost/api/presencas/5
```

### 🔧 COMO TESTAR

**Opção 1 - Navegador (apenas GET):**
- Cole as URLs GET diretamente no navegador

**Opção 2 - Postman/Insomnia:**
1. Baixe o [Postman](https://www.postman.com/downloads/)
2. Importe as requisições acima
3. Execute os testes

**Opção 3 - cURL (Terminal):**
```bash
# Exemplo GET
curl http://localhost/api/professores

# Exemplo POST
curl -X POST http://localhost/api/alunos \
  -H "Content-Type: application/json" \
  -d '{"nome":"Teste","data_nascimento":"2015-01-01","endereco":"Rua Teste","telefone":"11999999999"}'
```

### 📋 SEQUÊNCIA DE TESTES RECOMENDADA
1. **GET /api/professores** (deve mostrar 30 professores)
2. **POST /api/alunos** (criar aluno)
3. **POST /api/matriculas** (matricular o aluno)
4. **POST /api/notas** (dar nota ao aluno)
5. **POST /api/presencas** (registrar presença)
6. **GET /api/alunos** (verificar se aluno foi criado)
7. Testar as views no MySQL Workbench

---

## 📊 RELATÓRIOS PRONTOS (MySQL Workbench)

**Execute estas consultas no MySQL Workbench:**

```sql
-- 📋 Alunos com suas matrículas
SELECT * FROM view_alunos_matriculas;

-- 📝 Notas com nome do aluno e professor
SELECT * FROM view_notas_completas;

-- ✅ Presenças com nome do aluno e professor
SELECT * FROM view_presencas_completas;

-- 📈 Relatório completo (médias, total de presenças, etc.)
SELECT * FROM view_relatorio_aluno;
```

---

## 🗃️ ESTRUTURA DO BANCO

### 📊 Tabelas Criadas Automaticamente:
| Tabela | Descrição | Registros |
|--------|-----------|----------|
| 🧑‍🎓 **alunos** | Dados dos alunos | Vazio (você adiciona) |
| 👨‍🏫 **professores** | Dados dos professores | **30 já incluídos!** |
| 📚 **matriculas** | Matrículas dos alunos | Vazio (você adiciona) |
| 📝 **notas** | Notas dos alunos | 4 exemplos incluídos |
| ✅ **presencas** | Controle de presença | 4 exemplos incluídos |

### 📈 Relatórios (Views) Prontos:
- **view_alunos_matriculas** - Alunos + Matrículas
- **view_notas_completas** - Notas + Nomes
- **view_presencas_completas** - Presenças + Nomes  
- **view_relatorio_aluno** - Relatório Completo

---

## 🛠️ TECNOLOGIAS
- 🟢 **Node.js** - Backend
- ⚡ **Express.js** - API REST
- 🗄️ **MySQL 8.0** - Banco de dados
- 🐳 **Docker** - Containerização
- 🌐 **Nginx** - Proxy reverso

---

## 🚨 PROBLEMAS COMUNS

### ❌ "Não consigo acessar http://localhost/api/professores"
```bash
# Verifique se os containers estão rodando:
docker-compose ps

# Se não estiverem, execute:
docker-compose up -d --build
```

### ❌ "Erro de conexão com banco"
```bash
# Reinicie tudo:
docker-compose down
docker-compose up -d --build

# Aguarde 2-3 minutos
```

### ❌ "Porta já está em uso"
```bash
# Pare tudo que estiver usando as portas:
docker-compose down

# Ou mude as portas no arquivo docker-compose.yml.
```

### 🔍 **Ver logs de erro:**
```bash
# Logs da aplicação:
docker logs escola-app

# Logs do banco:
docker logs escola-db

# Logs do nginx:
docker logs escola-nginx
```

---

## 🛑 PARAR O SISTEMA
```bash
# Para parar tudo:
docker-compose down

# Para parar e remover dados:
docker-compose down -v
```

---

## 📞 SUPORTE
Se ainda assim não funcionar:
1. ✅ Verifique se o Docker Desktop está rodando
2. ✅ Tente reiniciar o Docker Desktop
3. ✅ Execute: `docker system prune -f`
4. ✅ Execute novamente: `docker-compose up -d --build`

**🎯 Se funcionou, você verá 30 professores em: http://localhost/api/professores**