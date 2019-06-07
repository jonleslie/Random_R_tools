#########################################################################
# Project: Janitor pull request iss_295
# Script purpose: fix examples on README.md
# Date: 26/4/2019
# Author: Jon Leslie
#########################################################################

library(pacman) # for loading packages
p_load(readxl, janitor, dplyr, here)

# Explore name cleaning ---------------------------------------------------

roster_raw <- read_excel(here("data", "dirty_data.xlsx"))
roster_raw <- read_excel(here("data", "dirty_data.xlsx"), 
                           .name_repair = make_clean_names)
# Tells read_excel() how to repair repetitive column names, overriding the
# default repair setting

roster_raw

glimpse(roster_raw)

# repaired:
roster <- roster_raw %>%
  clean_names() %>%
  remove_empty(c("rows", "cols")) %>%
  mutate(hire_date = excel_numeric_to_date(hire_date),
         cert = coalesce(certification, certification_2)) %>% # from dplyr
  select(-certification, -certification_2) # drop unwanted columns

roster

data("iris")
head(iris)

iris %>% 
  clean_names() %>% 
  head()

make_clean_names(names(iris))

iris %>% 
  names() %>% 
  make_clean_names()

iris %>% 
  structure(names = make_clean_names(names(iris))) %>% 
  head()

