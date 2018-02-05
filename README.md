#### The repository is organized as follows
- Each folder contains the presentation, code, and instructions for the tutorials and assignments:
    - `1_sql`: SQL and semi-structured data using *PostgresDB 10* 09/02/2018.
    - `2_search`: Information retrieval and search with *ElasticSearch* 05/03/2018.
    - `3_bigdata`: Big Data processing with *Apache Spark* 19/03/2018.
    
- For **Windows 10** users
    - Installing Linux subsystem:
        - Go to Settings -> For Developers: Enable *Developer Mode*. Restart the machine after the installation.
        - Turn Windows Features on or off, and check the box of `Windows Subsystem for Linux`, click OK and restart.
        - Open the windows menu and type `Command Prompt`, right-click and select `Run as adminsitrator`.
        - In the terminal, run the following command `lxrun /install /y` type a username and password for the root user.
    - Installing X environment:
        - Download *vcxsrv* from `https://sourceforge.net/projects/vcxsrv/` and install it
        - To start the X environment run the application `VcXsrv`
    - Starting the linux subsystem:
        - Press `Windows + R` and run `cmd`
        - Run the command `bash`, this gives you access to the linux terminal on Windows.        
    - From here, Windows users can follow the linux instructions, 
    just be sure to start the `VcXsrv` and run the instructions on the bash terminal.
    - If copy/past does not work on Chromium or pgAdmin, right-click on the `VcXsrv` icon in the task bar and un-check `Clipboard may use PRIMARY selection`
    - If you do not want to use the linux subsystem, try cygwin.

#### Using the Virual Machines </h4>
Students can access a Linux Virtual Machine that contains all the necessary software for the assignments and tutorials.
- First, configure a valid SSH public key added to https://version.aalto.fi service (see: https://version.aalto.fi/gitlab/help/ssh/README.md).
    - Configuration at a glance:
        - Start a terminal (Windows 10 users should be in `bash`)
        - `cd`
        - `mkdir ~/.ssh/` #If it does not exist
        - `cd ~/.ssh/`
        - `ssh-keygen -t rsa -C "your.name@aalto.fi" -b 4096` 
            - By default, the credentials ]will be named id_rsa and id_rsa.pub
        - Paste the following lines in `~/.ssh/config`. Create the file if it does not exists. 
        Replace aaltouser with your aalto user:
        ``` 
        Host mds
            HostName mds.cs.aalto.fi
            IdentityFile ~/.ssh/id_rsa
            IdentitiesOnly yes
            Port 22
            User aaltouser
        ```
        - Copy the content of ~/.ssh/id_rsa.pub and add it as a new key to https://version.aalto.fi/gitlab/profile/keys
- To access the VM:
    - Note:You have to be inside Aalto's network. At home, use the VPN (https://inside.aalto.fi/display/ITServices/VPN).
    - `export DISPLAY=127.0.0.1:0; ssh -X mds` # Fix the *DISPLAY* variable as required
        - The first time you connect, you will see a message "The authenticity of host ... ... Are you sure you want to continue connecting (yes/no)?"
        - Type `yes`
- Starting *Jupyter Notebook*
    - In the VM run the command `source ~/env35/bin/activate; jupyter notebook`
    - This should prompt a Chromium Web Browser, if not, check your configuration. 
    - The password is `db2018`