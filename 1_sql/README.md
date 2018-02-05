The first step is to connect to the virtual machine as [explained](../README.md#using-the-virual-machines-)

#### 1) Starting the database
- By default, the PostgreSQL database service is not running.
- Switch to root `sudo bash` 
- Enable and start the service: `systemctl enable postgresql && systemctl start postgresql`

#### 2) Creating the database
- Switch to root: `sudo bash`
- Switch to the PostgreSQL user: `su - postgres` 
- Create the database *movielens*: `createdb -E UTF8 -T template1 movielens` 
- Start the PostgreSQL shell: `psql template1` 
- Create the login credentials `CREATE USER movielens_user WITH PASSWORD 'movi3s';` 
- Give permission to the user `movielens_user` on database `movielens`: `GRANT ALL PRIVILEGES ON DATABASE movielens to movielens_user;`
- Exit: `\q`
- Logout as PostgreSQL user: `exit`
- Logout as root: `exit`

#### 3) Creating the tables and importing the data
- Extract the dataset:
    - `tar -zxvf /home/ubuntu/mds2018/data/movielens.tar.gz -C /home/ubuntu/`
- Start the PostgreSQL shell as movielens_user: `psql -h localhost -d movielens -U movielens_user -W` and type the password `movi3s` 
- Paste the following commands:
```
DROP TABLE IF EXISTS movie CASCADE;
CREATE TABLE movie
(movie_id int not null unique, title varchar, genres varchar, PRIMARY KEY(movie_id));
-- PostgreSQL creates an index on PRIMARY KEYS automatically, so there is no need to run:
-- CREATE INDEX movie_id ON movie USING btree (movie_id);

DROP TABLE IF EXISTS user_profile CASCADE;
CREATE TABLE user_profile
(user_profile_id int not null unique, gender varchar, age int, occupation int, zip_code varchar, PRIMARY KEY(user_profile_id));
-- PostgreSQL creates an index on PRIMARY KEYS automatically, so there is no need to run:
-- CREATE INDEX user_profile_user_profile_id ON user_profile USING btree (user_profile_id);

DROP TABLE IF EXISTS rating;
CREATE TABLE rating
(user_profile_id  int not null, movie_id int not null, rating int, rating_timestamp timestamp, 
 FOREIGN KEY (user_profile_id) REFERENCES user_profile(user_profile_id),
 FOREIGN KEY (movie_id) REFERENCES movie(movie_id));

CREATE INDEX rating_user_profile_id ON rating USING btree (user_profile_id);
CREATE INDEX rating_movie_id ON rating USING btree (movie_id);

DROP TABLE IF EXISTS dbpedia;
CREATE TABLE dbpedia
(movie_id int not null unique, title varchar, dbpedia_url varchar, json_url varchar,  dbpedia_content json,
 FOREIGN KEY (movie_id) REFERENCES movie(movie_id));
 
CREATE INDEX dbpedia_movie_id ON dbpedia USING btree (movie_id);
```
- Load data to the movies table `\copy movie from '/home/ubuntu/movielens/movie.csv' csv header;`
- Load data to the user_profile table `\copy user_profile from '/home/ubuntu/movielens/user.csv' csv header;`
- Load data to the movies table (It can take few minutes) `\copy rating from '/home/ubuntu/movielens/rating.csv' csv header;`
- Load data to the movies table `\copy dbpedia from '/home/ubuntu/movielens/dbpedia.csv' csv header;`

#### 4) Doing the assignment
You can use the PostgreSQL Shell (psql) or if you prefer pgAdmin4.

#### 4.1) Doing the assignment with psql
- Start the PostgreSQL shell as movielens_user: `psql -h localhost -d movielens -U movielens_user -W` and type the password `movi3s`
- Work on the assignment 

#### 4.2) Doing the assignment with pgAdmin4
- Note: Remember to access the VM with X11 forwarding: `export DISPLAY=127.0.0.1:0; ssh mds` and to set *Compression* and *ForwardingX11* to yes in the `~\.ssh\config` file
- Run the command: `pgAdmin4`
- Right click on `Servers` and then click on `Create->Server...`
- In `General->Name` write `localhost`
- Switch to the `Connections` tab and fill the form:
    - `Host name/address`: `localhost`
    - `Maintenance database`: `movielens`
    - `Username`: `movielens_user`
    - `Password`: `movi3s`
    - Check `Save password`
- Expand `localhost->Databases`, right click on `movielens` and then `Query Tool...`
- Work on the assignment