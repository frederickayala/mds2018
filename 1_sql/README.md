The first step is to connect to the virtual machine as [explained](../README.md#using-the-virual-machines-)

#### 1) Starting the database
- By default, the postgres database service is not running.
- Switch to root `sudo bash` 
- Enable and start the service: `systemctl enable postgresql && systemctl start postgresql`

#### 2) Creating the database
- Switch to root: `sudo bash`
- Switch to the postgres user: `su - postgres` 
- Create the database *movielens*: `createdb -E UTF8 -T template1 movielens` 
- Start the Postgres shell: `psql template1` 
- Create the login credentials `CREATE USER movielens_user WITH PASSWORD 'movi3s';` 
- Give permission to the user `movielens_user` on database `movielens`: `GRANT ALL PRIVILEGES ON DATABASE movielens to movielens_user;`
- Exit: `\q`
- Logout as postgres user: `exit`
- Logout as root: `exit`