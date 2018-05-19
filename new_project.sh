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

