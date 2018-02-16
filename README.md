#### The repository is organized as follows
- Each folder contains the presentation, code, and instructions for the tutorials and assignments:
    - [1_sql](./1_sql): SQL and semi-structured data using *PostgreSQL 10* 09/02/2018.
    - [2_search](./2_search): Information retrieval and search with *ElasticSearch* 05/03/2018.
    - [3_bigdata](./3_bigdata): Big Data processing with *Apache Spark* 19/03/2018.
- Dataset:
    - For the tree tutorials and programming assignments we will be working with the [MovieLens 1M Dataset](http://grouplens.org/datasets/movielens/1m/) dataset provided by GroupLens Research.
    - Check the [README](http://files.grouplens.org/datasets/movielens/ml-1m-README.txt) file of the dataset for additional information.
    - A pre-processed version of the dataset is available in [data](./data) and that is the file that we will use.
    - The pre-processed version includes a knowledge base of [DBpedia](https://dbpedia.org). The mapping between movies and DBpedia Resources was taken from [here](https://github.com/sisinflab/LODrecsys-datasets/tree/master/Movielens1M).

#### Special instructions for **Windows 10** users
In this course we provide a VM to the students. To access it follow the next steps: 
##### 1) Install the Linux subsystem:
- Go to Settings -> For Developers: Enable *Developer Mode*. Restart the machine after the installation.
- Turn Windows Features on or off, and check the box of `Windows Subsystem for Linux`, click OK and restart.
- Open the windows menu and type `Command Prompt`, right-click and select `Run as adminsitrator`.
- In the terminal, run the following command `lxrun /install /y` type a username and password for the root user.
##### 2) Install an X environment:
- Download *vcxsrv* from `https://sourceforge.net/projects/vcxsrv/` and install it
- To start the X environment run the application `VcXsrv`
##### 3) Starting the linux subsystem:
- Press `Windows + R` and run `cmd`
- Run the command `bash`, this gives you access to the linux terminal on Windows.        
- From here, Windows users can follow the same commands than linux/macOS users, 
just be sure to start the `VcXsrv` and run the commands on the bash terminal.
- If copy/past does not work on Chromium or pgAdmin, right-click on the `VcXsrv` icon in the task bar and un-check `Clipboard may use PRIMARY selection`
- Note: If you do not want to use the linux subsystem, use any other approach for using `ssh` and `X` enviroment on Windows.

### Using the Virtual Machines </h4>
Students can access a Linux Virtual Machine that contains all the necessary software for the assignments and tutorials.
#### 1) SSH/Credential Setup 
- Accessing the VM requires *password-less ssh login*. To do this, you are required to configure a SSH credential in https://version.aalto.fi service (see: https://version.aalto.fi/gitlab/help/ssh/README.md).
    - At a glance, the configurations steps for *password-less ssh login* are the following:
        - Start a terminal (Windows 10 users should be in `bash`)
        - `cd`
        - `mkdir ~/.ssh/` #If it does not exist
        - `cd ~/.ssh/`
        - `ssh-keygen -t rsa -C "your.name@aalto.fi" -b 4096` 
            - Replace the placeholder `your.name@aalto.fi` with your Aalto e-mail.
            - By default, the credentials will be named id_rsa and id_rsa.pub, you can use other name if needed.
        - Copy the content of `~/.ssh/id_rsa.pub` (or the name you used) and add it as a new key to https://version.aalto.fi/gitlab/profile/keys
        - Paste the following lines in `~/.ssh/config`. Create the file if it does not exists. 
        Replace the placeholder `your-aalto-username` with your Aalto user name.
	For `IdentityFile`, use the private key of the corresponding public key that you added to [http://version.aalto.fi](http://version.aalto.fi):
        ``` 
        Host mds
            HostName mds.cs.aalto.fi
            IdentityFile ~/.ssh/id_rsa
            IdentitiesOnly yes
            Compression yes
            ForwardX11 yes
            Port 22
            User your-aalto-username
        ```

#### 2) Accessing the VM 
- Note: You have to be using a machine inside Aalto's domain. At home and in personal computers, use the VPN (https://inside.aalto.fi/display/ITServices/VPN).
- `export DISPLAY=127.0.0.1:0; ssh -X mds` # Fix the *DISPLAY* variable as required
    - The value of `DISPLAY` environment variable could vary across different operating systems and fix the *DISPLAY* variable as required. In Linux machines set `DISPLAY` to `:0` (`export DISPLAY=:0`) and in macOS set `DISPLAY` to `127.0.0.1:0` (`export DISPLAY=127.0.0.1:0`).
    - The first time you connect, you will see a message "The authenticity of host ... ... Are you sure you want to continue connecting (yes/no)?"
    - Type `yes`

#### 3) Starting *Jupyter Notebook*
- In the VM run command `source ~/env35/bin/activate; jupyter notebook`
- This should prompt a Chromium Web Browser, if not, check your configuration. 
- The password is `db2018`

Further instructions are provided in the corresponding session folders.

You could also work in your personal computer, just clone the repo to your machine and install the required software.
