===============
Getting started
===============

We've created a data science like bash script for linux to start the template for projects in Python. This script contains the three above template types. Your analysis doesn't have to be in Python, but the templates do provide some Python boilerplates.

Requirements
============

 * Python 2.7 or 3.5
 * `cookiecutter Python package`_ >= 1.4.0: pip install cookiecutter
 * Linux OS (We use Centos 7 but whatever you want will do the job)



.. code-block :: bash

    name: sphinx
    dependencies:
      - python=3.5   # or 2.7
      - pip:
        - sphinx==1.5.6
        - Flask-Sphinx-Themes *(optional, is only an example!)*
        - recommonmark

and execute:

.. code-block :: bash

    $ conda env create --file environment.yml
    $ source activate sphinx


The Script
==========

In the **new_project.sh** script there are simple instructions to start a new project from scratch.

.. code-block :: bash

    #!/bin/bash

    #2018, Parrondo https://github.com/parrondo/quant-trading-project-structure
    #Starting a new project is as easy as running this command at the command line. No need to create a directory first,
    #the cookiecutter will do it for you.

    #Conda python environment activation where cookiecutter lives.
    source activate cookiecutter 



    echo -e "What kind of new project do you want? \nData-Science [ds] \nDeepLearning [dl] \nData-Science-Luigi [lu] \nSphinx [sp]: "
    read answer
    case $answer in

            ds|Ds|dS|DS)
                    echo "Agreed, you want a Data-Science new project"
                    #Creating files and project folder structure with cookiecutter-data-science
                    cookiecutter https://github.com/drivendata/cookiecutter-data-science
                    ;;

            dl|Dl|dL|DL)
                    echo echo "Agreed, you want a DeepLearning new project"
                    #Creating files and project folder structure with cookiecutter-deeplearning
                    cookiecutter https://github.com/tdeboissiere/cookiecutter-deeplearning.git
                    ;;

            lu|Lu|lU|LU)
                    echo "Agreed, you want a Data-Science with Luigi new project"
                    cookiecutter https://github.com/ffmmjj/luigi_data_science_project_cookiecutter
                    ;;

            sp|Sp|sP|SP)
                    echo "Agreed, you want a Sphinx documentation new project"
                    cookiecutter https://github.com/carschar/cookiecutter-sphinx.git
                    ;;

            *) echo "Invalid input"
                ;;
    esac



Starting a new project
======================

Starting a new project is as easy as running this command at the command line. No need to create a directory first, the cookiecutter you select in the dialog will do it for you. Remember to change the file new_project.sh as executable file, also you'll place the file into the parent folder of the new project structure. Then, execute:

.. code-block :: bash

    $ ./new_project.sh

this command will create *my_project* structure (see example below)



Example of Directory structure (Data Science type project)
==========================================================

After finishing setup, some build folders should be ignored during git commit. By default, these folders are

.. toctree::

   structure.md


Data is immutable
=================

Don't ever edit your carefully and usually expensive downloaded raw data, especially not manually, and especially not in Excel or whatever whorksheet. Don't overwrite your raw data ever. Don't save multiple versions of the raw data. Treat the data (and its format) as immutable. The code you write should move the raw data through a pipeline to your final analysis (Luigi is perfect for this task). You shouldn't have to run all of the steps every time you want to make a new figure, but anyone should be able to reproduce the final products with only the code in **src** and the data in **data/raw**.

Also, if data is immutable, it doesn't need source control in the same way that code does. Therefore, **by default, the data folder is included in the .gitignore file**. If you have a small amount of data that rarely changes, you may want to include the data in the repository. Github currently warns if files are over 50MB and rejects files over 100MB. 


Notebooks are for exploration and communication
===============================================

Notebook packages like the Jupyter notebook, are very effective for exploratory data analysis. However, these tools can be less effective for reproducing an analysis. When we use notebooks in our work, we identify the notebooks files. For example, 01-ram-exploratory.ipynb contains initial explorations, whereas 01-ram-reports.ipynb is final work that can be exported as html to the reports directory.
Since notebooks are challenging objects for source control (e.g., diffs of the json are often not human-readable and merging is near impossible), we recommended not collaborating directly with others on Jupyter notebooks. There are two steps we recommend for using notebooks effectively:

1. Follow a naming convention that shows the owner and the order the analysis
   was done in. We use the format:
   <step>-<user>-<description>.ipynb (e.g., "01-ram-data-preparation.ipynb", "03-ram-returns-visualization.ipynb").


2. Refactor the good parts. Don't write code to do the same task in multiple notebooks.
   If it's a data preprocessing task, put it in the pipeline at src/data/make_dataset.py
   and load data from data/interim. 


Build from a Conda environment
==============================

The first step in reproducing an analysis is always reproducing the computational environment it was run in. You need the same tools, the same libraries, and the same versions to make everything play nicely together.
One effective approach to this is use `Anaconda`_. By listing all of your requirements in the repository (it is include a requirements.txt file) you can easily track the packages needed to recreate the analysis. Here is an example of  good workflow:


.. code-block :: bash

    1. $ conda create --name myenv (when creating a new project)
    2. $ source activate myenv (to activate the environtment)
    3. (myenv)$ pip install the packages that your analysis needs 
    4. Run pip freeze > requirements.txt (to pin the exact package versions used to recreate the analysis)
    5. If you find you need to install another package:
       run pip freeze > requirements.txt again and commit the changes to version control. 

Usually you have more complex requirements for recreating your environment, then you should consider a virtual machine based approach such as `Docker`_ or `Vagrant`_. Both of these tools use text-based formats (Dockerfile and Vagrantfile respectively) you can easily add to source control to describe how to create a virtual machine with the requirements you need. Once you are familiarized with this virtual machine techniques, they works like a charm.

If you need orchestration then us `Kubernetes`_, `Mesos`_, and `Docker Swarm`_. These last ones are more for production scale and so, out of the scope of this document.

Secrets and configuration should be kept out of version control
===============================================================

You really don't want to leak your username and password on Github. Here's how to do this:

Store your secrets and config variables in a special file
---------------------------------------------------------

Create a .env file in the project root folder. Thanks to the .gitignore, this file should never get committed into the version control repository. Here's an example:

.. code-block :: bash

    # example .env file
    DATABASE_URL=mongodb://username:password@localhost:5432/dbname
    AWS_ACCESS_KEY=myaccesskey
    AWS_SECRET_ACCESS_KEY=mysecretkey
    OTHER_VARIABLE=something

Use a package to load these variables automatically
---------------------------------------------------

If you look at the stub script in *src/data/make_dataset.py*, it uses a package called `python-dotenv`_ to load up all the entries in this file as environment variables so they are accessible with os.environ.get. Here's an example snippet adapted from the python-dotenv documentation:

.. code-block :: python

    # src/data/dotenv_example.py
    import os
    from dotenv import load_dotenv, find_dotenv

    # find .env automagically by walking up directories until it's found
    dotenv_path = find_dotenv()

    # load up the entries as environment variables
    load_dotenv(dotenv_path)

    database_url = os.environ.get("DATABASE_URL")
    other_variable = os.environ.get("OTHER_VARIABLE")


Default folder structure cuasi-inmutability
===========================================

To keep this structure broadly applicable for many different kinds of projects, we think the best approach is to adapt the folders to your project, but be very conservative in changing the default basic structure for all projects. This is what we say cuasi-inmutable.
Now you have a folder-layout label specifically for your trading development works to add, subtract, rename, or move folders around.

**Be careful and be consistent!**


.. _`cookiecutter Python package`: http://cookiecutter.readthedocs.org/en/latest/installation.html
.. _`Anaconda`: https://conda.io/docs/index.html
.. _`Docker`: https://www.docker.com/
.. _`Vagrant`: https://www.vagrantup.com/
.. _`Kubernetes`: http://kubernetes.io/
.. _`Mesos`: http://mesos.apache.org/
.. _`Docker Swarm`: https://www.docker.com/products/docker-swarm
.. _`python-dotenv`: https://github.com/theskumar/python-dotenv

