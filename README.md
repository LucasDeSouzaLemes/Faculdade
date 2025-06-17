# Sistema de Gerenciamento de Alunos

## Descrição do Projeto
Este projeto consiste em um sistema de gerenciamento de alunos, desenvolvido como backend com API RESTful. O sistema permite gerenciar alunos, suas matrículas e notas.

## Estrutura de Pastas
- **app/**: Contém todos os arquivos fonte do sistema backend
  - **config/**: Configurações do sistema, incluindo conexão com banco de dados
  - **controllers/**: Controladores que implementam a lógica de negócio
  - **models/**: Modelos que representam as entidades do sistema
  - **routes/**: Definição das rotas da API
  - **middlewares/**: Middlewares para processamento de requisições
  - **index.js**: Arquivo principal que inicializa o servidor
- **docs/**: Documentação técnica do projeto
- **sql/**: Scripts SQL para criação e inicialização do banco de dados
  - **init.sql**: Script para criação das tabelas principais
- **Dockerfile**: Instruções para construir a imagem Docker do backend
- **Dockerfile.db**: Instruções para construir a imagem Docker do banco de dados
- **Dockerfile.nginx**: Instruções para construir a imagem Docker do servidor Nginx
- **nginx.conf**: Configuração do servidor Nginx para proxy reverso
- **docker-compose.yml**: Configuração para orquestração dos containers
- **.env**: Variáveis de ambiente para configuração do sistema

## Como Executar o Projeto

### Pré-requisitos
- Docker
- Docker Compose

### Passos para Execução
1. Clone o repositório
- https://github.com/LucasDeSouzaLemes/Faculdade.git
2. Navegue até a pasta do projeto
- cd Projeto-faculdade
3. Construa e inicie os containers:
   ```
   docker-compose up -d --build
   ```
4. Para parar os containers:
   ```
   docker-compose down
   ```
5. Para reiniciar os containers:
   ```
   docker-compose restart
   ```
6. O sistema estará disponível em:
   - API: http://localhost/api
   - Ou diretamente: http://localhost:8080 (porta exposta pelo container da aplicação)

### Interagindo com a API

#### Alunos
- **Listar todos os alunos**: GET http://localhost/api/alunos
- **Buscar aluno por ID**: GET http://localhost/api/alunos/{id}
- **Criar aluno**: POST http://localhost/api/alunos
  ```json
  {
    "nome": "Nome do Aluno",
    "data_nascimento": "YYYY-MM-DD",
    "endereco": "Rua Exemplo, 123",
    "telefone": "(11) 98765-4321"
  }
  ```
- **Atualizar aluno**: PUT http://localhost/api/alunos/{id}
- **Excluir aluno**: DELETE http://localhost/api/alunos/{id}

#### Matrículas
- **Listar todas as matrículas**: GET http://localhost/api/matriculas
- **Buscar matrícula por ID**: GET http://localhost/api/matriculas/{id}
- **Criar matrícula**: POST http://localhost/api/matriculas
  ```json
  {
    "aluno_id": 1,
    "data_matricula": "YYYY-MM-DD",
    "status": "Ativa"
  }
  ```
- **Atualizar matrícula**: PUT http://localhost/api/matriculas/{id}
- **Excluir matrícula**: DELETE http://localhost/api/matriculas/{id}

#### Notas
- **Listar todas as notas**: GET http://localhost/api/notas
- **Buscar nota por ID**: GET http://localhost/api/notas/{id}
- **Buscar notas por aluno**: GET http://localhost/api/notas/aluno/{id}
- **Criar nota**: POST http://localhost/api/notas
  ```json
  {
    "aluno_id": 1,
    "valor": 9.5,
    "data_avaliacao": "YYYY-MM-DD",
    "observacao": "Excelente desempenho"
  }
  ```
- **Atualizar nota**: PUT http://localhost/api/notas/{id}
- **Excluir nota**: DELETE http://localhost/api/notas/{id}

## Tecnologias Utilizadas
- Node.js
- Express.js
- MySQL
- Docker
- Nginx

## Solução de Problemas

### Erro ao acessar a API
- Verifique se todos os containers estão rodando: `docker-compose ps`
- Verifique os logs da aplicação: `docker logs escola-app`
- Verifique os logs do nginx: `docker logs escola-nginx`
- Verifique os logs do banco de dados: `docker logs escola-db`

### Erro de conexão com o banco de dados
- Verifique se o container do banco de dados está rodando
- Verifique se as variáveis de ambiente estão configuradas corretamente no arquivo .env
- Tente reiniciar o container da aplicação: `docker-compose restart app`

### Portas em uso
- Se alguma porta já estiver em uso, modifique o arquivo docker-compose.yml para usar portas diferentes