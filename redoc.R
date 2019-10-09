#########################################################################
# Project: Random R Tools
# Script purpose: redoc - Reversible Reproducible Documents
# Date: 2019-07-04  
# Author: Jon Leslie
#########################################################################

# https://noamross.github.io/redoc/

remotes::install_github("noamross/redoc")

library(redoc)

print(basename(redoc_example_docx()))
dedoc(redoc_example_docx())
dedoc("DataScienceObjectives.docx")
