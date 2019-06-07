#########################################################################
# Project: Janitor
# Script purpose: Exploring janitor functions
# Date: 24/4/2019
# Author: Jon Leslie
#########################################################################

library(pacman) # for loading packages
p_load(readxl, janitor, dplyr, here)

roster_raw <- read_excel(here("data", "dirty_data.xlsx")) # available at http://github.com/sfirke/janitor

glimpse(roster_raw)

# Doesn't work:
roster <- roster_raw %>%
  clean_names() %>%
  remove_empty(c("rows", "cols")) %>%
  mutate(hire_date = excel_numeric_to_date(hire_date),
         cert = coalesce(certification, certification_1)) %>% # from dplyr
  select(-certification, -certification_1) # drop unwanted columns

roster

# Fixed version:
roster <- roster_raw %>%
  clean_names() %>%
  remove_empty(c("rows", "cols")) %>%
  mutate(hire_date = excel_numeric_to_date(hire_date),
         cert = coalesce(certification_9, certification_10)) %>% # from dplyr
  select(-certification_9, -certification_10) # drop unwanted columns

roster


# reprex ------------------------------------------------------------------

reprex(outfile = NA)


# Explore name cleaning ---------------------------------------------------

roster_raw <- read_excel(here("data", "dirty_data.xlsx"))
roster_raw_2 <- read_excel(here("data", "dirty_data.xlsx"), 
                           .name_repair = make_clean_names)
# Tells read_excel() how to repair repetitive column names, overriding the
# default repair setting

roster_raw_2

glimpse(roster_raw_2)

# repaired:
roster <- roster_raw_2 %>%
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

