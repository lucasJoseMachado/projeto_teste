Status do projeto

[![Build Status](https://travis-ci.org/lucasJoseMachado/projeto_teste.svg?branch=master)](https://travis-ci.org/lucasJoseMachado/projeto_teste)
[![Test Coverage](https://codeclimate.com/github/lucasJoseMachado/projeto_teste/badges/coverage.svg)](https://codeclimate.com/github/lucasJoseMachado/projeto_teste/coverage)
[![Code Climate](https://codeclimate.com/github/lucasJoseMachado/projeto_teste/badges/gpa.svg)](https://codeclimate.com/github/lucasJoseMachado/projeto_teste)
[![security](https://hakiri.io/github/lucasJoseMachado/projeto_teste/master.svg)](https://hakiri.io/github/lucasJoseMachado/projeto_teste/master)

---

# Descrição

* Projeto feito como teste de desenvolvedor web para a empresa Meus Pedidos.
* Um demo deste projeto pode ser acessado no site http://myapp-testeasd.rhcloud.com/

---

# Requisitos

* Ruby 2.1.2
* Rails 4.2.3

---

# Variáveis de ambiente

## Adicione as variáveis de ambiente:
* gmail_username - email utilizado como emitente no sistema;
* gmail_password - senha do email utilizado como emitente no sistema;

---

# Como usar

* Execute bundle install para instalar as gems do projeto.
* Inicie o servidor redis local (utilizado por padrão pelo sidekiq) ou defina a variável de ambiente REDIS_URL para o endereço do servidor redis utilizado (caso queira, utilize 'redis://redistogo:8d9bbe3c8c4c63324b555bc817fb1541@tarpon.redistogo.com:11321/' para o servidor redis).
* Inicie o sidekiq, executando bundle exec sidekiq.
* Execute rails s para iniciar o servidor.
