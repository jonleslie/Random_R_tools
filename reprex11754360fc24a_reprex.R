#' ---
#' output:
#'   md_document:
#'     pandoc_args: [
#'       '-f', 'markdown-implicit_figures',
#'       '-t', 'commonmark',
#'       --wrap=preserve
#'     ]
#' ---



#+ reprex-setup, include = FALSE
options(tidyverse.quiet = TRUE)
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", error = TRUE)
knitr::opts_knit$set(upload.fun = knitr::imgur_upload)

#+ reprex-body
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



#' <sup>Created on `r Sys.Date()` by the [reprex package](https://reprex.tidyverse.org) (v`r utils::packageVersion("reprex")`)</sup>


