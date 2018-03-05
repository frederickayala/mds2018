### Working on the VM
##### 1) Connect to the virtual machine as [explained](../README.md#using-the-virual-machines-)
- Alternatively, is to use VirtualBox and the provided VM as [explained in the forum](https://mycourses.aalto.fi/mod/forum/discuss.php?d=95344).
##### 2) Starting *Jupyter Notebook*
- In the VM run command `source ~/env35/bin/activate; jupyter notebook`
- This should prompt a Chromium Web Browser:
    - Check your X11 configuration if the browser does not start. Try `pgAdmin4`, if the user interface appears, then the problem is with the browser.
    - If you are having an error: `Trace/breakpoint trap (core dumped)`, please install firefox `sudo apt install firefox`
- The password is `db2018`

### Working on your personal computer
##### 1) Download Elasticsearch
- *Make sure that you have Java 1.8 installed on your computer*
- Download and unzip [Elasticsearch](https://www.elastic.co/downloads/elasticsearch)
- Run: `bin/elasticsearch` or `bin\elasticsearch.bat` on Windows
- Check that it is working. Open http://localhost:9200/ in your browser
##### 2) Install Python:
- The suggested approach is to install miniconda or anacoda for Python 3.6 version from [here](https://anaconda.com/download/)
- Create a Python enviroment for the course: `conda create -n tutorial python=3.5`
    - If conda is not recognized, add the following paths to your `PATH` variable:
        - On Windows: `C:\Users\your_user\Anaconda3\Scripts`
        - On Linux/macOS: `/home/your_user/anaconda3/bin:$PATH`
- Activate the enviroment: `source activate tutorial` or `activate tutorial` for Windows
- Install the required packages using conda: `conda install jupyter ipykernel pandas psycopg2`
- Install additional packages with `pip install elasticsearch findspark`
- Configure jupyter notebook: 
    - `python -m ipykernel install --name tutorial`
    - `jupyter notebook --generate-config`
    - `jupyter notebook password`
        - Set a password, we are using: `db2018`
- Start the notebook: `jupyter notebook`
- This should open a browser to `http://localhost:8888`