# Task API

Este projeto foi desenvolvido como parte da disciplina de DevOps, com o objetivo de aplicar conceitos de Integração Contínua (CI), testes automatizados, Docker e Infraestrutura como Código (IaC).

## Objetivo

O objetivo do projeto é desenvolver uma API simples para gerenciamento de tarefas e utilizá-la como base para demonstrar um processo automatizado de desenvolvimento e integração.

O projeto contempla:

- Desenvolvimento de uma API REST;
- Testes automatizados;
- Containerização utilizando Docker;
- Pipeline de Integração Contínua com GitHub Actions;
- Construção e publicação de imagem Docker no Amazon ECR;
- Provisionamento da infraestrutura utilizando Terraform.

## Tecnologias utilizadas

- Python 3.12
- Flask
- Pytest
- Docker
- GitHub
- GitHub Actions
- Terraform
- Amazon Web Services (AWS)
- Amazon Elastic Container Registry (ECR)

## Funcionalidades

A API possui as seguintes operações:

### Consultar tarefas

```http
GET /tasks
```

Retorna todas as tarefas cadastradas.

### Criar tarefa

```http
POST /tasks
```

Exemplo de requisição:

```json
{
    "title": "Estudar Docker"
}
```

### Atualizar tarefa

```http
PUT /tasks/<id>
```

Exemplo de requisição:

```json
{
    "completed": true
}
```

Também é possível alterar o título:

```json
{
    "title": "Estudar Terraform"
}
```

### Excluir tarefa

```http
DELETE /tasks/<id>
```

Remove a tarefa correspondente ao ID informado.