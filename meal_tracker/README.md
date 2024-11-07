# MealTracker

## Setup

### Install dependencies

```bash
mix deps.get
```

## Run Local Server

```bash
mix phx.server
```

## Run Unit Tests

```bash
mix test
```

### Coverage

```bash
mix test --coverage
```

### Gen Coverage file

#### JSON

```bash
mix coveralls.json
```

#### HTML

```coveralls
mix test.html
```

## Manual Test

### Create a new meal

```bash
curl --header "Content-Type: application/json" -X POST -d '{"descricao": "Test", "calorias": 1}' http://localhost:4000/api/meals
```

### Get meal by id

```bash
curl http://localhost:4000/api/meals/<uuid>
```

### Get all meals

```bash
curl http://localhost:4000/api/meals/
```

### Update meal

```bash
curl --header "Content-Type: application/json" -X PUT -d '{"descricao": "Test", "calorias": 2000}' http://localhost:4000/api/meals/<uuid>
```

### Delete meal

```bash
curl -X DELETE http://localhost:4000/api/meals/<uuid>
```

### Misc

- Bad Request (HTTP 500)

```bash
curl --header "Content-Type: application/json" -X POST -d '{"descricao": "Test", "calorias": "a"}' -s -o /dev/null -w "%{http_code}" http://localhost:4000/api/meals
```