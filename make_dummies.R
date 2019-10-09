#########################################################################
# Project: Make dummy variables from a column of a data frame
# Script purpose: Examples of a workflow
# Date: 2019-06-21
# Author: Jon Leslie
#########################################################################

library(tidyverse)
library(fastDummies)

crime <- data.frame(city = c("SF", "SF", "NYC"),
                    year = c(1990, 2000, 1990),
                    crime = 1:3)
dummy_cols(crime)
# Include year column
dummy_cols(crime, select_columns = c("city", "year"))
