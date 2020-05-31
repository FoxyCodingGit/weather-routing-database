# WeatherRoutingDatabase
This is a "SQL Change Automation" project generated on the SQL-Server Database I created. "SQL Change Automation" is used for easier verison control of the code and to gain marks.

The script includes the creaiton of database tables, relationships, stored procedures and funcitons. The data is not saved.

## Design
I have designed the database to meet the requirements of third normalised form. There are 5 tables and also five relations between the tables (there are two relations between route and coordinate for start and end latLngCoordId).

## Stored Procedures
Stored procedures are programmed in T-SQL and allow access and manipulation of data. This logic is defined here to best confine logic to the correct layer. Helping with enforcing areas of concern.

## Functions
I have created a function to reduce the repeating of code.

## Database Password Hashing and Salting
Database passwords are hashed and have salts applied to them, the salt stops birthday attacks from being effective, further increasing the security of the database. If a hacker was to access the database, they do not have access to anyones password. Another step would be reqiured to know this. This is vital for database security.
The salt and hash are both saved as both are needed on the process of comparison of user entered details on the website.

## Using SQL Change Automation
To run this script you will need to use "SQL Change Automation". I used Visual Studio to perform the actions through a graphical interface.

### Installing SQL Change Automation (Visual Studio)
1. Install the "SQL Toolbelt" from "Redgate". (https://www.red-gate.com/products/sql-development/sql-change-automation/)
2. After installing the toolbelt choose to download "SQL Change Automation".
3. Install the Visual Studio Extensiton (https://marketplace.visualstudio.com/items?itemName=vs-publisher-306627.RedgateSqlChangeAutomation)

### Generating the Database
Using the "SQL Change Automation" GUI you set the destination database and name to state which server and under what name the database will be created. After doing this pressing the "Deploy Project" button will create the database.

### Saving Changes
When you perform changes to the database, these will be saved as a migration script.

1. Click "Update".
2. If there are any changes they will appear. They will be divided into the different SQL structures such as tables and stored procedrues.
3. After viewing and approving all changes, press the "Generate Migrations" buttton.
4. A migraiton script is created outlining the changes. You can verify that the migration was successful by pressing the "Verify Migration" button.

### Applying changes to other database instances
Migrations state are saved to show if they have already been applied to a destination database. If you point to an existing out-of-date database the project will know which migrations have already been run. Press the "Apply Migrations" to bring the database up-to-date.