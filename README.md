# datafun-05-sql

[![Workflow Guide](https://img.shields.io/badge/Pro--Guide-pro--analytics--02-green)](https://denisecase.github.io/pro-analytics-02/workflow-b-apply-example-project/)
[![Python 3.14](https://img.shields.io/badge/python-3.14%2B-blue?logo=python)](./pyproject.toml)
[![MIT](https://img.shields.io/badge/license-see%20LICENSE-yellow.svg)](./LICENSE)

> Professional Python project: relational data and SQL analytics.

Data analytics requires a variety of skills.
This course builds capabilities through working projects.

In the age of generative AI, durable skills are grounded in real work:
setting up a professional environment,
reading and running code,
understanding the logic,
and pushing work to a shared repository.
Each project follows the structure of professional Python projects.
We learn by doing.

## This Project

This project introduces **relational data and SQL** used when storing structured data in tables.
Analysts are typically highly skilled at both SQL and Python.

Sample datasets are provided in the `data/raw` folder
across several topic domains:

- **retail** - a store records many sales (the worked example)
- **library** - a library branch manages many checkouts
- **shelter** - a shelter manages many animal adoptions
- **civic_event** - an event manages many attendees

Each domain has two related tables in a 1-to-many relationship.
You will run the retail example, then implement the same pipeline for a domain you choose.

## Working Files

You'll work with just these areas:

- **data/raw/\*** - raw CSV input files
- **data/processed/** - processed data outputs, if created
- **artifacts/** - generated database files, logs, or reports
- **docs/** - the project narrative and documentation
- **sql/** - SQL query files
- **src/datafun/** - Python orchestration scripts
- **pyproject.toml** - update project metadata
- **zensical.toml** - update documentation site metadata

## Instructions (pro-analytics-02)

Follow the
[step-by-step workflow guide](https://denisecase.github.io/pro-analytics-02/workflow-b-apply-example-project/)
to complete:

1. Phase 1. **Start & Run**
2. Phase 2. **Change Authorship**
3. Phase 3. **Read & Understand**
4. Phase 4. **Modify**
5. Phase 5. **Apply**

## Challenges

Challenges are expected.
Sometimes instructions may not quite match your operating system.
When issues occur, share screenshots, error messages, and details about what you tried.
Working through issues is part of implementing professional projects.

## Success

After completing Phase 1. **Start & Run**, you'll have your own GitHub project,
running on your machine.

Running the examples should create generated database files in `artifacts/`.

A new file `project.log` will appear in the root project folder
and you should see:

```shell
========================
Executed successfully!
========================
```

A new file `project.log` will appear in the root project folder.

## Command Reference

The commands below are used in the workflow guide above.
They are provided here for convenience.

Follow the guide for the **full instructions**.

<details>
<summary>Show command reference</summary>

### In a machine terminal (open in your `Repos` folder)

After you get a copy of this repo in your own GitHub account,
open a machine terminal in your `Repos` folder:

```shell
# Replace username with YOUR GitHub username.
git clone https://github.com/hasacco/datafun-05-sql

cd datafun-05-sql
code .
```

### In a VS Code terminal

These are listed for convenience.
For best results, follow the detailed instructions in
[pro-analytics-02 guide](https://denisecase.github.io/pro-analytics-02/).

```shell
uv self update
uv python pin 3.14
uv lock --upgrade
uv sync --extra dev --extra docs --upgrade

uvx pre-commit install

git add -A
uvx pre-commit run --all-files
# repeat if changes were made
uvx pre-commit run --all-files

# run the example pipelines (duckdb and sqlite)
uv run python -m datafun.app_retail_duckdb_case
uv run python -m datafun.app_retail_sqlite_case

# do chores
uv run ruff format .
uv run ruff check . --fix
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build

# save progress
git add -A
git commit -m "update"
git push -u origin main
```

</details>

## Notes

- Use the **UP ARROW** and **DOWN ARROW** in the terminal to scroll through past commands.
- Use `CTRL+f` to find (and replace) text within a file.
- You do not need to add to or modify `tests/`. They are provided for example only.
- Many files are silent helpers. Explore as you like, but nothing is required.
- You do NOT not to understand everything; understanding builds naturally over time.

## Troubleshooting >>>

If you see something like this in your terminal: `>>>` or `...`
You accidentally started Python interactive mode.
It happens.
Press `Ctrl+c` (both keys together) or `Ctrl+Z` then `Enter` on Windows.

## DuckDB Example Output (Replace This with Yours and Describe)

```shell
| INFO | P05 | RUN SQL query: C:\Repos\datafun\datafun-05-sql\sql\duckdb\case_retail_query_sales_by_category.sql
| INFO | P05 | ====================================
| INFO | P05 | case_retail_query_sales_by_category.sql
| INFO | P05 | ====================================
| INFO | P05 | product_category, sale_count, total_revenue, avg_sale_amount
| INFO | P05 | Outdoors, 9, 3200.0, 355.56
| INFO | P05 | Clothing, 10, 1375.0, 137.5
| INFO | P05 | Food, 11, 652.0, 59.27
| INFO | P05 |
| INFO | P05 | RUN SQL query: C:\Repos\datafun\datafun-05-sql\sql\duckdb\case_retail_query_kpi_revenue.sql
| INFO | P05 | ====================================
| INFO | P05 | case_retail_query_kpi_revenue.sql
| INFO | P05 | ====================================
| INFO | P05 | store_id, store_name, city, region, sale_count, total_revenue, avg_sale_amount
| INFO | P05 | S003, Central Plaza, Mankato, South, 10, 1868.0, 186.8
| INFO | P05 | S001, North Market, Duluth, North, 10, 1834.0, 183.4
| INFO | P05 | S002, Lakeside Shop, Ely, North, 10, 1525.0, 152.5
| INFO | P05 | ========================
| INFO | P05 | Executed successfully!
| INFO | P05 | ========================
| INFO | P05 | END main()
```

## Technical Modification 6-11-26

The input raw data was changed from the retail data to the shelter data included in the raw folder.
Both bootstrap.sql files were changed to read in the new data by changing the names of the columns and tables.
New queries were built to:
- count animals by type and calculate total and average adoption fees
- count number of each type of animal by shelter
- determine the adoption rate by shelter
- debug when csv files were not being read in correctly (printing tables)

## DuckDB Example Output 6-11-26

```shell
2026-06-11 16:19:51 | INFO | P05 | === RUN START ===
2026-06-11 16:19:51 | INFO | P05 | project=P05 Pipeline Example (DuckDB)
2026-06-11 16:19:51 | INFO | P05 | repo_dir=datafun-05-sql
2026-06-11 16:19:51 | INFO | P05 | python=3.14.5
2026-06-11 16:19:51 | INFO | P05 | os=Windows 11
2026-06-11 16:19:51 | INFO | P05 | shell=powershell
2026-06-11 16:19:51 | INFO | P05 | cwd=.
2026-06-11 16:19:51 | INFO | P05 | github_actions=False
2026-06-11 16:19:51 | INFO | P05 | START main()
2026-06-11 16:19:51 | INFO | P05 | ROOT_DIR: C:\Repos\datafun-05-sql
2026-06-11 16:19:51 | INFO | P05 | DATA_RAW_DIR: C:\Repos\datafun-05-sql\data\raw\shelter
2026-06-11 16:19:51 | INFO | P05 | DATA_PROCESSED_DIR: C:\Repos\datafun-05-sql\data\processed\shelter
2026-06-11 16:19:51 | INFO | P05 | SQL_DIR: C:\Repos\datafun-05-sql\sql\duckdb
2026-06-11 16:19:51 | INFO | P05 | DB_PATH: C:\Repos\datafun-05-sql\artifacts\duckdb\shelterdb.duckdb
2026-06-11 16:19:51 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_shelter_clean.sql
2026-06-11 16:19:51 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_shelter_clean.sql
2026-06-11 16:19:51 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_shelter_bootstrap.sql
2026-06-11 16:19:51 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_shelter_bootstrap.sql
2026-06-11 16:19:51 | INFO | P05 |
2026-06-11 16:19:51 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_shelter_query_animals_by_type.sql
2026-06-11 16:19:51 | INFO | P05 | ====================================
2026-06-11 16:19:51 | INFO | P05 | hasacco_shelter_query_animals_by_type.sql
2026-06-11 16:19:51 | INFO | P05 | ====================================
2026-06-11 16:19:51 | INFO | P05 | animal_type, type_count, total_fees, avg_adoption_fee
2026-06-11 16:19:51 | INFO | P05 | Dog, 13, 1130.0, 86.92
2026-06-11 16:19:51 | INFO | P05 | Cat, 11, 565.0, 51.36
2026-06-11 16:19:51 | INFO | P05 | Rabbit, 6, 90.0, 15.0
2026-06-11 16:19:51 | INFO | P05 |
2026-06-11 16:19:51 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_shelter_query_animals_by_shelter.sql
2026-06-11 16:19:51 | INFO | P05 | ====================================
2026-06-11 16:19:51 | INFO | P05 | hasacco_shelter_query_animals_by_shelter.sql
2026-06-11 16:19:51 | INFO | P05 | ====================================
2026-06-11 16:19:51 | INFO | P05 | shelter_id, animal_type, type_count
2026-06-11 16:19:51 | INFO | P05 | H001, Cat, 3
2026-06-11 16:19:51 | INFO | P05 | H001, Rabbit, 2
2026-06-11 16:19:51 | INFO | P05 | H001, Dog, 5
2026-06-11 16:19:51 | INFO | P05 | H002, Rabbit, 2
2026-06-11 16:19:51 | INFO | P05 | H002, Dog, 5
2026-06-11 16:19:51 | INFO | P05 | H002, Cat, 3
2026-06-11 16:19:51 | INFO | P05 | H003, Dog, 3
2026-06-11 16:19:51 | INFO | P05 | H003, Rabbit, 2
2026-06-11 16:19:51 | INFO | P05 | H003, Cat, 5
2026-06-11 16:19:51 | INFO | P05 |
2026-06-11 16:19:51 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_shelter_query_kpi_adoptions.sql
2026-06-11 16:19:51 | INFO | P05 | ====================================
2026-06-11 16:19:51 | INFO | P05 | hasacco_shelter_query_kpi_adoptions.sql
2026-06-11 16:19:51 | INFO | P05 | ====================================
2026-06-11 16:19:51 | INFO | P05 | shelter_id, shelter_name, city, capacity, adoption_rate
2026-06-11 16:19:51 | INFO | P05 | H001, Pine Valley Shelter, Ely, 40, 0.175
2026-06-11 16:19:51 | INFO | P05 | H003, South Ridge Shelter, Mankato, 35, 0.17142857142857143
2026-06-11 16:19:51 | INFO | P05 | H002, Lake County Shelter, Duluth, 60, 0.1
2026-06-11 16:19:51 | INFO | P05 | ========================
2026-06-11 16:19:51 | INFO | P05 | Executed successfully!
2026-06-11 16:19:51 | INFO | P05 | ========================
2026-06-11 16:19:51 | INFO | P05 | END main()
```

## SQLite Example Output 6-11-26

```shell
2026-06-11 16:20:12 | INFO | P05 | === RUN START ===
2026-06-11 16:20:12 | INFO | P05 | project=P05 Pipeline Example (SQLite)
2026-06-11 16:20:12 | INFO | P05 | repo_dir=datafun-05-sql
2026-06-11 16:20:12 | INFO | P05 | python=3.14.5
2026-06-11 16:20:12 | INFO | P05 | os=Windows 11
2026-06-11 16:20:12 | INFO | P05 | shell=powershell
2026-06-11 16:20:12 | INFO | P05 | cwd=.
2026-06-11 16:20:12 | INFO | P05 | github_actions=False
2026-06-11 16:20:12 | INFO | P05 | START main()
2026-06-11 16:20:12 | INFO | P05 | ROOT_DIR: C:\Repos\datafun-05-sql
2026-06-11 16:20:12 | INFO | P05 | DATA_RAW_DIR: C:\Repos\datafun-05-sql\data\raw\shelter
2026-06-11 16:20:12 | INFO | P05 | DATA_PROCESSED_DIR: C:\Repos\datafun-05-sql\data\processed\shelter
2026-06-11 16:20:12 | INFO | P05 | SQL_DIR: C:\Repos\datafun-05-sql\sql\sqlite
2026-06-11 16:20:12 | INFO | P05 | DB_PATH: C:\Repos\datafun-05-sql\artifacts\sqlite\shelterdb.sqlite
2026-06-11 16:20:12 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_shelter_clean.sql
2026-06-11 16:20:12 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_shelter_clean.sql
2026-06-11 16:20:12 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_shelter_bootstrap.sql
2026-06-11 16:20:12 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_shelter_bootstrap.sql
2026-06-11 16:20:12 | INFO | P05 | LOAD CSV -> table shelter: C:\Repos\datafun-05-sql\data\raw\shelter\shelter.csv
2026-06-11 16:20:12 | INFO | P05 | DONE loading shelter rows: 3
2026-06-11 16:20:12 | INFO | P05 | LOAD CSV -> table adoption: C:\Repos\datafun-05-sql\data\raw\shelter\adoption.csv
C:\Repos\datafun-05-sql\src\datafun\app_shelter_sqlite_hasacco.py:168: DeprecationWarning: The default date adapter is deprecated as of Python 3.12; see the sqlite3 documentation for suggested replacement recipes
  con.executemany(
2026-06-11 16:20:12 | INFO | P05 | DONE loading adoption rows: 30
2026-06-11 16:20:12 | INFO | P05 | COMMIT: data load complete
2026-06-11 16:20:12 | INFO | P05 |
2026-06-11 16:20:12 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_shelter_query_animals_by_type.sql
2026-06-11 16:20:12 | INFO | P05 | ====================================
2026-06-11 16:20:12 | INFO | P05 | hasacco_shelter_query_animals_by_type.sql
2026-06-11 16:20:12 | INFO | P05 | ====================================
2026-06-11 16:20:12 | INFO | P05 | animal_type, type_count, total_fees, avg_adoption_fee
2026-06-11 16:20:12 | INFO | P05 | Dog, 13, 1130.0, 86.92
2026-06-11 16:20:12 | INFO | P05 | Cat, 11, 565.0, 51.36
2026-06-11 16:20:12 | INFO | P05 | Rabbit, 6, 90.0, 15.0
2026-06-11 16:20:12 | INFO | P05 |
2026-06-11 16:20:12 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_shelter_query_animals_by_shelter.sql
2026-06-11 16:20:12 | INFO | P05 | ====================================
2026-06-11 16:20:12 | INFO | P05 | hasacco_shelter_query_animals_by_shelter.sql
2026-06-11 16:20:12 | INFO | P05 | ====================================
2026-06-11 16:20:12 | INFO | P05 | shelter_id, animal_type, type_count
2026-06-11 16:20:12 | INFO | P05 | H001, Cat, 3
2026-06-11 16:20:12 | INFO | P05 | H001, Dog, 5
2026-06-11 16:20:12 | INFO | P05 | H001, Rabbit, 2
2026-06-11 16:20:12 | INFO | P05 | H002, Cat, 3
2026-06-11 16:20:12 | INFO | P05 | H002, Dog, 5
2026-06-11 16:20:12 | INFO | P05 | H002, Rabbit, 2
2026-06-11 16:20:12 | INFO | P05 | H003, Cat, 5
2026-06-11 16:20:12 | INFO | P05 | H003, Dog, 3
2026-06-11 16:20:12 | INFO | P05 | H003, Rabbit, 2
2026-06-11 16:20:12 | INFO | P05 |
2026-06-11 16:20:12 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_shelter_query_kpi_adoptions.sql
2026-06-11 16:20:12 | INFO | P05 | ====================================
2026-06-11 16:20:12 | INFO | P05 | hasacco_shelter_query_kpi_adoptions.sql
2026-06-11 16:20:12 | INFO | P05 | ====================================
2026-06-11 16:20:12 | INFO | P05 | shelter_id, shelter_name, city, capacity, adoption_rate
2026-06-11 16:20:12 | INFO | P05 | H001, Pine Valley Shelter, Ely, 40, 0.175
2026-06-11 16:20:12 | INFO | P05 | H003, South Ridge Shelter, Mankato, 35, 0.17142857142857143
2026-06-11 16:20:12 | INFO | P05 | H002, Lake County Shelter, Duluth, 60, 0.1
2026-06-11 16:20:12 | INFO | P05 | ========================
2026-06-11 16:20:12 | INFO | P05 | Executed successfully!
2026-06-11 16:20:12 | INFO | P05 | ========================
2026-06-11 16:20:12 | INFO | P05 | END main()
```

## Application to a New Project 6-14-26: Candy Sales

This new application uses SQLite, DuckDB, and Python to analyze a set of data in the public domain from Maven Analytics. This specific set of data was obtained from https://mavenanalytics.io/data-playground/us-candy-distributor. This data set contains multiple tables that provide information regarding customer and factory locations, sales order and goals, and product details for a candy manufacturer. While these 5 included tables could be used to perform many different types of analysis, this project focused on sales and profit, using only 3 of the provided tables.
This project will load data from CSV files into tables, and then use queries to determine the following:
  - Units sold by candy division (category) and deficit from sales targets per division
  - Units sold by product to aid in identification of top sellers and underperforming products
  - Manufacturer revenue, cost, and profit based on sales for each product
These queries are used to aid in making business decisions such as:
  - How to focus production time and resources to increase profit
  - Identifying products where manufacturing cost and/or sales price may need adjusted to maximize profit
  - Identifying products that may need to be discontinued based on units sold or profit

## Special Notes

artifacts/sqlite/candydb.sqlite (2376 KB) exceeds 2000 KB.
artifacts/duckdb/candydb.duckdb (3852 KB) exceeds 2000 KB.
Both of these files have been added to .gitignore

# In a machine terminal (open in your `Repos` folder)

After you get a copy of this repo in your own GitHub account,
open a machine terminal in your `Repos` folder:

```shell
# Replace username with YOUR GitHub username.
git clone https://github.com/hasacco/datafun-05-sql

cd datafun-05-sql
code .
```

# In a VS Code terminal

These are listed for convenience.
For best results, follow the detailed instructions in
[pro-analytics-02 guide](https://denisecase.github.io/pro-analytics-02/).

```shell
uv self update
uv python pin 3.14
uv lock --upgrade
uv sync --extra dev --extra docs --upgrade

uvx pre-commit install

git add -A
uvx pre-commit run --all-files
# repeat if changes were made
uvx pre-commit run --all-files

# run the pipelines (duckdb and sqlite)
uv run python -m datafun.app_candy_duckdb_hasacco
uv run python -m datafun.app_candy_sqlite_hasacco

# do chores
uv run ruff format .
uv run ruff check . --fix
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build

# save progress
git add -A
git commit -m "update"
git push -u origin main
```

## Example Output New Application 6-14-26

# DuckDB Output

```shell
2026-06-14 12:37:44 | INFO | P05 | === RUN START ===
2026-06-14 12:37:44 | INFO | P05 | project=P05 Pipeline Example (DuckDB)
2026-06-14 12:37:44 | INFO | P05 | repo_dir=datafun-05-sql
2026-06-14 12:37:44 | INFO | P05 | python=3.14.5
2026-06-14 12:37:44 | INFO | P05 | os=Windows 11
2026-06-14 12:37:44 | INFO | P05 | shell=powershell
2026-06-14 12:37:44 | INFO | P05 | cwd=.
2026-06-14 12:37:44 | INFO | P05 | github_actions=False
2026-06-14 12:37:44 | INFO | P05 | START main()
2026-06-14 12:37:44 | INFO | P05 | ROOT_DIR: C:\Repos\datafun-05-sql
2026-06-14 12:37:44 | INFO | P05 | DATA_RAW_DIR: C:\Repos\datafun-05-sql\data\raw\candy
2026-06-14 12:37:44 | INFO | P05 | DATA_PROCESSED_DIR: C:\Repos\datafun-05-sql\data\processed\candy
2026-06-14 12:37:44 | INFO | P05 | SQL_DIR: C:\Repos\datafun-05-sql\sql\duckdb
2026-06-14 12:37:44 | INFO | P05 | DB_PATH: C:\Repos\datafun-05-sql\artifacts\duckdb\candydb.duckdb
2026-06-14 12:37:44 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_candy_clean.sql
2026-06-14 12:37:44 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_candy_clean.sql
2026-06-14 12:37:44 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_candy_bootstrap.sql
2026-06-14 12:37:44 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_candy_bootstrap.sql
2026-06-14 12:37:44 | INFO | P05 |
2026-06-14 12:37:44 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_candy_query_sales_by_division.sql
2026-06-14 12:37:44 | INFO | P05 | ====================================
2026-06-14 12:37:44 | INFO | P05 | hasacco_candy_query_sales_by_division.sql
2026-06-14 12:37:44 | INFO | P05 | ====================================
2026-06-14 12:37:44 | INFO | P05 | Division, target_sales, sale_count, sales_deficit
2026-06-14 12:37:44 | INFO | P05 | Sugar, 15000, 137, 14863
2026-06-14 12:37:44 | INFO | P05 | Other, 3000, 1242, 1758
2026-06-14 12:37:44 | INFO | P05 | Chocolate, 27000, 37275, -10275
2026-06-14 12:37:44 | INFO | P05 |
2026-06-14 12:37:44 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_candy_query_sales_by_product.sql
2026-06-14 12:37:44 | INFO | P05 | ====================================
2026-06-14 12:37:44 | INFO | P05 | hasacco_candy_query_sales_by_product.sql
2026-06-14 12:37:44 | INFO | P05 | ====================================
2026-06-14 12:37:44 | INFO | P05 | Division, Product_ID, Product_Name, sale_count
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-MIL-31000, Wonka Bar - Milk Chocolate, 8267
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-SCR-58000, Wonka Bar -Scrumdiddlyumptious, 7743
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-TRI-54000, Wonka Bar - Triple Dazzle Caramel, 7596
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-FUD-51000, Wonka Bar - Fudge Mallows, 6914
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-NUT-13000, Wonka Bar - Nutty Crunch Surprise, 6755
2026-06-14 12:37:44 | INFO | P05 | Other, OTH-GUM-21000, Wonka Gum, 478
2026-06-14 12:37:44 | INFO | P05 | Other, OTH-LIC-15000, Lickable Wallpaper, 393
2026-06-14 12:37:44 | INFO | P05 | Other, OTH-KAZ-38000, Kazookles, 371
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-SWE-91000, SweeTARTS, 41
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-LAF-25000, Laffy Taffy, 27
2026-06-14 12:37:44 | INFO | P05 | Sugar, OTH-FIZ-56000, Fizzy Lifting Drinks, 21
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-HAI-55000, Hair Toffee, 17
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-EVE-47000, Everlasting Gobstopper, 13
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-NER-92000, Nerds, 10
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-FUN-75000, Fun Dip, 8
2026-06-14 12:37:44 | INFO | P05 |
2026-06-14 12:37:44 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\duckdb\hasacco_candy_query_profit_by_product.sql
2026-06-14 12:37:44 | INFO | P05 | ====================================
2026-06-14 12:37:44 | INFO | P05 | hasacco_candy_query_profit_by_product.sql
2026-06-14 12:37:44 | INFO | P05 | ====================================
2026-06-14 12:37:44 | INFO | P05 | Division, Product_ID, Product_Name, total_revenue, total_cost, manufacturer_profit
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-SCR-58000, Wonka Bar -Scrumdiddlyumptious, 27874.80, 8517.30, 19357.50
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-TRI-54000, Wonka Bar - Triple Dazzle Caramel, 28485.00, 9874.80, 18610.20
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-MIL-31000, Wonka Bar - Milk Chocolate, 26867.75, 9424.38, 17443.37
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-NUT-13000, Wonka Bar - Nutty Crunch Surprise, 23574.95, 6755.00, 16819.95
2026-06-14 12:37:44 | INFO | P05 | Chocolate, CHO-FUD-51000, Wonka Bar - Fudge Mallows, 24890.40, 8296.80, 16593.60
2026-06-14 12:37:44 | INFO | P05 | Other, OTH-LIC-15000, Lickable Wallpaper, 7860.00, 3930.00, 3930.00
2026-06-14 12:37:44 | INFO | P05 | Other, OTH-GUM-21000, Wonka Gum, 597.50, 286.80, 310.70
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-EVE-47000, Everlasting Gobstopper, 130.00, 26.00, 104.00
2026-06-14 12:37:44 | INFO | P05 | Other, OTH-KAZ-38000, Kazookles, 1205.75, 1113.00, 92.75
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-HAI-55000, Hair Toffee, 76.50, 17.00, 59.50
2026-06-14 12:37:44 | INFO | P05 | Sugar, OTH-FIZ-56000, Fizzy Lifting Drinks, 78.75, 31.50, 47.25
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-LAF-25000, Laffy Taffy, 53.73, 20.25, 33.48
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-SWE-91000, SweeTARTS, 61.50, 32.80, 28.70
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-NER-92000, Nerds, 15.00, 8.00, 7.00
2026-06-14 12:37:44 | INFO | P05 | Sugar, SUG-FUN-75000, Fun Dip, 12.00, 7.20, 4.80
2026-06-14 12:37:44 | INFO | P05 | ========================
2026-06-14 12:37:44 | INFO | P05 | Executed successfully!
2026-06-14 12:37:44 | INFO | P05 | ========================
2026-06-14 12:37:45 | INFO | P05 | END main()
```

# SQLite Output

```shell
2026-06-14 12:38:16 | INFO | P05 | === RUN START ===
2026-06-14 12:38:16 | INFO | P05 | project=P05 Pipeline Example (SQLite)
2026-06-14 12:38:16 | INFO | P05 | repo_dir=datafun-05-sql
2026-06-14 12:38:16 | INFO | P05 | python=3.14.5
2026-06-14 12:38:16 | INFO | P05 | os=Windows 11
2026-06-14 12:38:16 | INFO | P05 | shell=powershell
2026-06-14 12:38:16 | INFO | P05 | cwd=.
2026-06-14 12:38:16 | INFO | P05 | github_actions=False
2026-06-14 12:38:16 | INFO | P05 | START main()
2026-06-14 12:38:16 | INFO | P05 | ROOT_DIR: C:\Repos\datafun-05-sql
2026-06-14 12:38:16 | INFO | P05 | DATA_RAW_DIR: C:\Repos\datafun-05-sql\data\raw\candy
2026-06-14 12:38:16 | INFO | P05 | DATA_PROCESSED_DIR: C:\Repos\datafun-05-sql\data\processed\candy
2026-06-14 12:38:16 | INFO | P05 | SQL_DIR: C:\Repos\datafun-05-sql\sql\sqlite
2026-06-14 12:38:16 | INFO | P05 | DB_PATH: C:\Repos\datafun-05-sql\artifacts\sqlite\candy.sqlite
2026-06-14 12:38:16 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_candy_clean.sql
2026-06-14 12:38:16 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_candy_clean.sql
2026-06-14 12:38:16 | INFO | P05 | RUN SQL script: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_candy_bootstrap.sql
2026-06-14 12:38:16 | INFO | P05 | DONE SQL script: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_candy_bootstrap.sql
2026-06-14 12:38:16 | INFO | P05 | LOAD CSV -> table candy_targets: C:\Repos\datafun-05-sql\data\raw\candy\Candy_Targets.csv
2026-06-14 12:38:16 | INFO | P05 | DONE loading candy_targets rows: 3
2026-06-14 12:38:16 | INFO | P05 | LOAD CSV -> table candy_products: C:\Repos\datafun-05-sql\data\raw\candy\Candy_Products.csv
2026-06-14 12:38:16 | INFO | P05 | DONE loading candy_products rows: 15
2026-06-14 12:38:16 | INFO | P05 | LOAD CSV -> table candy_sales: C:\Repos\datafun-05-sql\data\raw\candy\Candy_Sales.csv
2026-06-14 12:38:16 | INFO | P05 | DONE loading candy_sales rows: 10194
2026-06-14 12:38:16 | INFO | P05 | COMMIT: data load complete
2026-06-14 12:38:16 | INFO | P05 |
2026-06-14 12:38:16 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_candy_query_sales_by_division.sql
2026-06-14 12:38:16 | INFO | P05 | ====================================
2026-06-14 12:38:16 | INFO | P05 | hasacco_candy_query_sales_by_division.sql
2026-06-14 12:38:16 | INFO | P05 | ====================================
2026-06-14 12:38:16 | INFO | P05 | Division, target_sales, sale_count, sales_deficit
2026-06-14 12:38:16 | INFO | P05 | Sugar, 15000, 137, 14863
2026-06-14 12:38:16 | INFO | P05 | Other, 3000, 1242, 1758
2026-06-14 12:38:16 | INFO | P05 | Chocolate, 27000, 37275, -10275
2026-06-14 12:38:16 | INFO | P05 |
2026-06-14 12:38:16 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_candy_query_sales_by_product.sql
2026-06-14 12:38:16 | INFO | P05 | ====================================
2026-06-14 12:38:16 | INFO | P05 | hasacco_candy_query_sales_by_product.sql
2026-06-14 12:38:16 | INFO | P05 | ====================================
2026-06-14 12:38:16 | INFO | P05 | Division, Product_ID, Product_Name, sale_count
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-MIL-31000, Wonka Bar - Milk Chocolate, 8267
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-SCR-58000, Wonka Bar -Scrumdiddlyumptious, 7743
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-TRI-54000, Wonka Bar - Triple Dazzle Caramel, 7596
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-FUD-51000, Wonka Bar - Fudge Mallows, 6914
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-NUT-13000, Wonka Bar - Nutty Crunch Surprise, 6755
2026-06-14 12:38:16 | INFO | P05 | Other, OTH-GUM-21000, Wonka Gum, 478
2026-06-14 12:38:16 | INFO | P05 | Other, OTH-LIC-15000, Lickable Wallpaper, 393
2026-06-14 12:38:16 | INFO | P05 | Other, OTH-KAZ-38000, Kazookles, 371
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-SWE-91000, SweeTARTS, 41
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-LAF-25000, Laffy Taffy, 27
2026-06-14 12:38:16 | INFO | P05 | Sugar, OTH-FIZ-56000, Fizzy Lifting Drinks, 21
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-HAI-55000, Hair Toffee, 17
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-EVE-47000, Everlasting Gobstopper, 13
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-NER-92000, Nerds, 10
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-FUN-75000, Fun Dip, 8
2026-06-14 12:38:16 | INFO | P05 |
2026-06-14 12:38:16 | INFO | P05 | RUN SQL query: C:\Repos\datafun-05-sql\sql\sqlite\hasacco_candy_query_profit_by_product.sql
2026-06-14 12:38:16 | INFO | P05 | ====================================
2026-06-14 12:38:16 | INFO | P05 | hasacco_candy_query_profit_by_product.sql
2026-06-14 12:38:16 | INFO | P05 | ====================================
2026-06-14 12:38:16 | INFO | P05 | Division, Product_ID, Product_Name, total_revenue, total_cost, manufacturer_profit
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-SCR-58000, Wonka Bar -Scrumdiddlyumptious, 27874.8, 8517.3, 19357.5
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-TRI-54000, Wonka Bar - Triple Dazzle Caramel, 28485.0, 9874.8, 18610.2
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-MIL-31000, Wonka Bar - Milk Chocolate, 26867.75, 9424.38, 17443.37
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-NUT-13000, Wonka Bar - Nutty Crunch Surprise, 23574.95, 6755.0, 16819.95
2026-06-14 12:38:16 | INFO | P05 | Chocolate, CHO-FUD-51000, Wonka Bar - Fudge Mallows, 24890.4, 8296.8, 16593.6
2026-06-14 12:38:16 | INFO | P05 | Other, OTH-LIC-15000, Lickable Wallpaper, 7860.0, 3930.0, 3930.0
2026-06-14 12:38:16 | INFO | P05 | Other, OTH-GUM-21000, Wonka Gum, 597.5, 286.8, 310.7
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-EVE-47000, Everlasting Gobstopper, 130.0, 26.0, 104.0
2026-06-14 12:38:16 | INFO | P05 | Other, OTH-KAZ-38000, Kazookles, 1205.75, 1113.0, 92.75
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-HAI-55000, Hair Toffee, 76.5, 17.0, 59.5
2026-06-14 12:38:16 | INFO | P05 | Sugar, OTH-FIZ-56000, Fizzy Lifting Drinks, 78.75, 31.5, 47.25
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-LAF-25000, Laffy Taffy, 53.73, 20.25, 33.48
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-SWE-91000, SweeTARTS, 61.5, 32.8, 28.7
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-NER-92000, Nerds, 15.0, 8.0, 7.0
2026-06-14 12:38:16 | INFO | P05 | Sugar, SUG-FUN-75000, Fun Dip, 12.0, 7.2, 4.8
2026-06-14 12:38:16 | INFO | P05 | ========================
2026-06-14 12:38:16 | INFO | P05 | Executed successfully!
2026-06-14 12:38:16 | INFO | P05 | ========================
2026-06-14 12:38:16 | INFO | P05 | END main()
```

## Insights and Findings

The pipeline used for both the DuckDB and SQLite portions of this project require only minor changes to file path names and table names when applying to new projects.
The queries for DuckDB and SQLite use the same code. The boostraps have minor differences in that the DuckDB requires additional code to load the tables.
Once this pipeline is built, it can be easily modified and applied to any size data set in virtually any field of study and application.
