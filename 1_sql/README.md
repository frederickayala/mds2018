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
- Start the Postgres shell as movielens_user: `psql -h localhost -d movielens -U movielens_user -W` and type the password `movi3s` 
- Paste the following commands:
```
    DROP TABLE IF EXISTS movie CASCADE;
CREATE TABLE movie
(movie_id int not null unique, title varchar, genres varchar, PRIMARY KEY(movie_id));
-- Postgres create an index on PRIMARY KEYS automatically, so there is no need to run:
-- CREATE INDEX movie_id ON movie USING btree (movie_id);

DROP TABLE IF EXISTS user_profile CASCADE;
CREATE TABLE user_profile
(user_profile_id int not null unique, gender varchar, age int, occupation int, zip_code varchar, PRIMARY KEY(user_profile_id));
-- Postgres create an index on PRIMARY KEYS automatically, so there is no need to run:
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
- Exit postgres shell `\q`
- Go to the git repo of the course `cd /home/ubuntu/mds2018`
- Pull the last version of the code `git pull`
- activate the python environment `source /home/ubuntu/bin/activate`
- run the loading data script `python /home/ubuntu/mds2018/1_sql/load_data.py`

#### 3) Starting pgAdmin4
- Note: Remember to access the VM with X11 forwarding: `export DISPLAY=127.0.0.1:0; ssh mds` and to set *Compression* and *ForwardingX11* to yes in the `~\.ssh\config` file
- Run the command: `pgAdmin4`

#### 4) Adding the localhost server
- Right click on `Servers` and then click on `Create->Server...`
- In `General->Name` write `localhost`
- Switch to the `Connections` tab and fill the form:
    - `Host name/address`: `localhost`
    - `Maintenance database`: `movielens`
    - `Username`: `movielens_user`
    - `Password`: `movi3s`
    - Check `Save password`
- Now you can start the Query Tool from `Tools->Query Tool`