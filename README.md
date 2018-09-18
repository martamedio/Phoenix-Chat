# Elixir & Phoenix Chat Example
Developed live during a [Meetup](https://www.meetup.com/es-ES/Elixir-Asturias/events/254005415/) of [Elixir Asturias](https://github.com/elixirasturias/propuestas/issues/3)

### Getting Started

##### Prerequisities

1. **Elixir** on your machine:
    * Mac:  `brew install elixir`
    * Windows: [Download the installer](https://repo.hex.pm/elixir-websetup.exe)
     
2. **Phoenix framework** installed: 
```mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez```

3. **PostgreSQL** (Database Server) installed (to save messages): [Download it](http://postgresapp.com/)

### Running it!
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

You can visit [localhost:4000](http://localhost:4000) from your browser and open the Chat web.
It is recommended open the app in two separate browser windows to try it (if your machine only has one browser try using an "incognito" tab).
