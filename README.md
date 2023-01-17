# Pokemon_API

This project exposes a list of Pokemon through an API based on the requirements from Petal team as listed in these [instructions](./INSTRUCTIONS).

## Getting started

Use the following commands to install dependancies, seed the database and implement a local web API serving CRUD operations on the list of pokemons.

```bash
    bundle install
    rails db:seed
    rails s
```
### Tests
A series of test has been written and can be executed with this command.
```bash
    rails test
```

### Testing with Postman

A postman [workspace](postman/Pokemon%20API.postman_collection.json) and [environment variables](postman/PokemonsAPI.postman_environment.json) is provided in the `/postman` folder.

Import the two files to your postman environment to start testing.
