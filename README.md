# BinaLand Backend

## Installation

Clone this repo

```bash
git clone https://github.com/zyq-m/bina-land-backend.git
```

Install Poetry if you haven't already:

```bash
pip install poetry
```

Install the dependencies specified in the pyproject.toml file:

```bash
poetry install
```

### Database

-   type: MySQL
-   name: bina_land_dev
-   tools: Laragon
-   collation: utf8mb4_0900_ai_ci

## Start develop

```bash
flask -A app run --debug
```

## Get latest update

```bash
git pull origin master
```
