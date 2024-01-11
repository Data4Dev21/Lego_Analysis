# Lego Analysis


![Lego Analysis Logo](<https://media.istockphoto.com/id/537596303/photo/pile-of-colorful-lego-bricks.jpg?s=612x612&w=0&k=20&c=sr-i3947aL4h5pKYxdLxezHutJJ3S-HAnVh_O0AByYQ=>)

## Overview

This project focused on creating a Schema, its associated tables and anlysing the data to find unique lego parts and lego sets. A visualisation would be the final goal to give a pictorial representation of insights.

## Table of Contents

- [Setting up Schema](#setting-up-schema)
- [Lego Set Analysis](#lego-set-analysis)
- [Data Visualisation](#data-visualisation)
- [Record Project on Git-Hub](#record-project-on-git-hub)

## Setting up Schema

The schema will be set up and associated tables will be created and populated using a Snowflake database to gain our LEGO database.

### Key Steps
### 1. Create Your Schema:

The TIL_PORTFOLIO_PROJECTS database contains a STAGING schema which has all data.
My personal schema is created under this same database to house all my tables needed for the project.

Hint: Use the CREATE SCHEMA command to create a schema.

```bash
CREATE SCHEMA database.schema_name;
```

### 2. Create Tables:

Based on the existing data, create the following tables in your schema:

a. LEGO_COLOURS

b. LEGO_INVENTORIES

c. LEGO_INVENTORY_PARTS

d. LEGO_INVENTORY_SETS

e. LEGO_PARTS

f. LEGO_PART_CATEGORIES

g. LEGO_SETS

h. LEGO_THEMES

Ensure you define the correct data types for each column in these tables.

Hint: Use the CREATE TABLE command. STAGING schema serves as a guide on the data types and column names needed.

```bash
CREATE TABLE database.schema.table (
	column_1 integer,
	column_2 VARCHAR(44)
);

-- Check column character length, for varchar() length
SELECT MAX(LENGTH(part_num))
FROM TIL_PORTFOLIO_PROJECTS.STAGING.LEGO_PARTS;
```

### 3. Insert Data:
   
The created tables needs to be populated with data from the corresponding tables in the STAGING schema.

Hint: Use the INSERT INTO command combined with a SELECT * FROM query to pull in the data from the STAGING tables.

```bash
INSERT INTO database.schema.destination_table (
SELECT *
FROM  database.schema.source_table
);
```

### 4. Set Primary and Foreign Keys
   
Its now time to set up the relational database by defining primary and foreign keys.

Use the diagram below for guidance, not all tables will have a primary key.

![Lego Analysis ERDiagram](<https://github.com/Data4Dev21/Lego_Analysis/blob/main/Lego-ER%20Diagram.png>)


```bash
--Set a primary key:

ALTER TABLE table_name ADD PRIMARY KEY (column_name);

--Set a foreign key:

ALTER TABLE table_name ADD FOREIGN KEY (column_name)
REFERENCES another_table(another_tables_primary_key_column);
```

### 5. Create ER Diagram:
   
After the completion of the above 4 points, download and use [DBeaver](<https://dbeaver.io/>) to create an ER diagram to visualize the relationships between your tables.

### Key Steps

a. Download DBeaver

b. Create connection > SQL > Snowflake

c. Host: the first part of your snowflake login url, ending ".snowflakecomputing.com" without "https://"

d. Database: TIL_PORTFOLIO_PROJECTS

e. Warehouse: DATASCHOOL_WH or CORE_WH

f. Schema: the schema you created earlier

g. Authentication: SSO (Browser)

h. Username: your TIL email

i. Role: DATASCHOOL or CORE

You may be prompted to login multiple times in the browser.

Navigate to your schema: right click > View Schema


### Deliverable

At the end of this section, you should have:

a. A schema in the TIL_PORTFOLIO_PROJECTS database filled with tables populated with LEGO data.

b. A SQL script creating your schema, tables, inserting data and creating primary and foreign keys

c. A DBeaver ER diagram showing the relationships between your tables


### My Solution

[SQL Script](<https://github.com/Data4Dev21/Lego_Analysis/blob/main/Lego_Analysis.sql>) 

[ER-Diagram](<https://github.com/Data4Dev21/Lego_Analysis/blob/main/Lego-ER%20Diagram.png>)

## Lego Set Analysis

Now that you have a fully populated and linked database, the next step is to produce some analysis.
LEGO production involves creating many different parts, and as you can imagine, producing new, unique parts can be costly versus reusing existing parts. In this challenge, we want to investigate which LEGO sets include the most unique parts, and how this trend is changing over time.

### Key Steps

### 1. Unique Parts Identification:

Identify parts that appear in only one LEGO set. Note the quantity of the part does not matter.

Hint: You'll need to use an aggregate function to count the number of distinct sets each part appears in. A part is unique if it appears in exactly one set.

### 2. Set Analysis:

For each LEGO set, calculate the number of unique parts it includes and the total number of parts (we're looking for a count of the parts, not quantity). Calculate the ratio of unique parts to total parts as a measure of 'uniqueness' for each set. Enrich your query with the set year and theme name.

Hint: You can join the unique parts list to the inventory parts table on the part number. Use a LEFT JOIN so that you include all parts, not just the unique ones.

### 3. Create a View:

Lastly, you'll want to create a view of your final query, which includes the set name, year of release, theme, number of unique parts, total number of parts, and 'uniqueness' ratio.

Hint: Use the CREATE VIEW statement to make your final query results easily accessible for future analysis.

```bash
CREATE VIEW my_well_named_view AS
<Your SQL Query>
```

### 4. Download your data and save it locally as a .csv file.

Run a query to extract the data from your view and save it to a csv file, we'll be adding this to our GitHub repo later.

```bash
SELECT *
FROM my_well_named_view;
```

### My Solution

[My-view-script](<https://github.com/Data4Dev21/Lego_Analysis/blob/main/Lego_view.sql>)


## Data Visualisation

Next is the creation of a Tableau dashboard to explore the unique parts in various LEGO sets.

Go to the TIL Tableau Server, connect to Snowflake and the view you've created. The connection details will be the same as in part 1 when connecting to DBeaver. Since the view has been downloaded as .csv file, one can access that locally for this task too.

The goal is to produce three charts exploring unique Lego parts:

a. change over time

b. compared to the total parts in a set

c. by set theme

Add titles and interactions to the visualisation.

Save the results as a Tableau dashboard. Record a screenshot of the visualisation.

You can add this to your Tableau Public portfolio by replacing the datasource with the csvfrom part 2, opening the .twbx file in Tableau Public and saving the workbook.


## Record Project on Git-Hub

If you haven't already please sign up to GitHub first at [https://github.com/signup](<https://github.com/signup>) and watch this intro video [Git, GitHub, & GitHub Desktop for beginners](<https://www.youtube.com/watch?v=8Dd7KRpKeaE>)

Create a repository:

Create a New repository for this analysis (something like "LEGO-SQL-Analysis")
Select the visibility as 'Public'
Initialize the repository with a README
Add files to your repository

Please ensure any files, notes, in fact, anything you put on GitHub does not have any passwords or login information. If you do this view the login as compromised, please delete the repo and create a new password/login.

On Github.com on your repository click on 'Add file' > 'Upload files' and upload your:

a. SQL scripts

b. Schema Diagram

c. solution csv

Edit your README.md

GitHub provides a readme file which is rendered when a user views your repository, it's a great way to document your project and looks great for a portfolio project, like this one.

Note the readme file must be called "README.md" to appear on rendered on the repository home page.
