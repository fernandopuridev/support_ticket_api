# Support Tickets API

API Ruby on Rails para o sistema de chamados de suporte técnico, listagem de tickets, tela de detalhe e mensagens entre cliente e suporte. O projeto foi pensado para facilitar a comunicação entre clientes e atendentes para a resolução de dúvidas e problemas em viagens da Amazon Trips 

## Stack

- Ruby on Rails API
- Devise + JWT
- PostgreSQL

## Funcionalidades

- cadastro e login de usuários
- roles `user` e `admin`
- criação e listagem de tickets
- atualização de status por admin
- mensagens entre user e admin via ticket

## Rotas principais

- `POST /auth/sign_up`
- `POST /auth/sign_in`
- `DELETE /auth/sign_out`
- `GET /api/v1/tickets`
- `GET /api/v1/tickets/:id`
- `POST /api/v1/tickets`
- `PATCH /api/v1/tickets/:id`
- `GET /api/v1/tickets/:ticket_id/messages`
- `POST /api/v1/tickets/:ticket_id/messages`

## Setup

1. Instale as dependências:

```bash
bundle install
```

2. Crie o arquivo `.env` na raiz do backend e gere a chave JWT:

```bash
bundle exec rails secret
```

Adicione o valor gerado ao `.env`:

```env
DEVISE_JWT_SECRET_KEY=chave_gerada
```

3. Prepare o banco e rode a aplicação:

```bash
bin/rails db:create db:migrate
bin/rails db:seed
bin/rails s
```

## User e Admin

Ao rodar o seeds, irá criar o Admin:
  email: "admin@email.com",
  password: "123456",

E user:
  email: "joao@email.com",
  password: "123456",

Para criar outro Admin entre no console:
```bash
bin/rails console
```
E digite:
```rb
admin = User.create!(
  name: "Admin 2",
  email: "admin2@email.com",
  password: "123456",
  role: :admin
)
```
