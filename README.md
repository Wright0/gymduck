# project-gymduck

![GymDuck Lesson Information Page](https://i.imgur.com/uwpFNZ2.png)

## Project overview

Built using Ruby, Sinatra and PostgreSQL, Gym Duck is made to manage a gym’s members, classes and class bookings.

https://gym-duck.herokuapp.com/

Features include: 
- Membership types which give the gym more control over which classes a member can be booked into.
- The ability to suspend gym memberships.

## Set up the project locally 

To start the project, you will need to have the following Ruby gems installed:
- pg (for using PostgreSQL with ruby)
- sinatra
- sinatra-contrib (for hot reloading)
- pry (for debugging)

When you download the project, you will need to change the sql_runner file (comments are in the file indicating what needs to be swapped. You will need to create a database on your local machine and use that name.

To create your database from the command line, use: `createdb databasename`. You can also delete databases using: `dropdb databasename`

You will then need to uncomment the lines at the top of the model files to use pry and enable hot reloading.

Once those are done, use the following lines in the command line:

1. Prepare the tables in your database: `psql -d yourDatabaseName -f db/gymduck.sql `

2. Seed your data: `ruby db/seeds.rb`

3. Run the server: `ruby app.rb`

Finally, to see the app running, open the following url in a web browser: http://localhost:4567/
