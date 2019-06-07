``` r
library(pacman) # for loading packages
p_load(readxl, janitor, dplyr, here)

roster_raw <- read_excel(here("data", "dirty_data.xlsx")) # available at http://github.com/sfirke/janitor
#> New names:
#> * Certification -> Certification...9
#> * Certification -> Certification...10
#> * Certification -> Certification...11

glimpse(roster_raw)
#> Observations: 13
#> Variables: 11
#> $ `First Name`        <chr> "Jason", "Jason", "Alicia", "Ada", "Desus", …
#> $ `Last Name`         <chr> "Bourne", "Bourne", "Keys", "Lovelace", "Nic…
#> $ `Employee Status`   <chr> "Teacher", "Teacher", "Teacher", "Teacher", …
#> $ Subject             <chr> "PE", "Drafting", "Music", NA, "Dean", "Phys…
#> $ `Hire Date`         <dbl> 39690, 39690, 37118, 27515, 41431, 11037, 11…
#> $ `% Allocated`       <dbl> 0.75, 0.25, 1.00, 1.00, 1.00, 0.50, 0.50, NA…
#> $ `Full time?`        <chr> "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Y…
#> $ `do not edit! --->` <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ Certification...9   <chr> "Physical ed", "Physical ed", "Instr. music"…
#> $ Certification...10  <chr> "Theater", "Theater", "Vocal music", "Comput…
#> $ Certification...11  <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …

# Doesn't work:
roster <- roster_raw %>%
  clean_names() %>%
  remove_empty(c("rows", "cols")) %>%
  mutate(hire_date = excel_numeric_to_date(hire_date),
         cert = coalesce(certification, certification_1)) %>% # from dplyr
  select(-certification, -certification_1) # drop unwanted columns
#> Error in list2(...): object 'certification' not found

roster
#> Error in eval(expr, envir, enclos): object 'roster' not found

# Fixed version:
roster <- roster_raw %>%
  clean_names() %>%
  remove_empty(c("rows", "cols")) %>%
  mutate(hire_date = excel_numeric_to_date(hire_date),
         cert = coalesce(certification_9, certification_10)) %>% # from dplyr
  select(-certification_9, -certification_10) # drop unwanted columns

roster
#> # A tibble: 12 x 8
#>    first_name last_name employee_status subject hire_date  percent_allocat…
#>    <chr>      <chr>     <chr>           <chr>   <date>                <dbl>
#>  1 Jason      Bourne    Teacher         PE      2008-08-30             0.75
#>  2 Jason      Bourne    Teacher         Drafti… 2008-08-30             0.25
#>  3 Alicia     Keys      Teacher         Music   2001-08-15             1   
#>  4 Ada        Lovelace  Teacher         <NA>    1975-05-01             1   
#>  5 Desus      Nice      Administration  Dean    2013-06-06             1   
#>  6 Chien-Shi… Wu        Teacher         Physics 1930-03-20             0.5 
#>  7 Chien-Shi… Wu        Teacher         Chemis… 1930-03-20             0.5 
#>  8 James      Joyce     Teacher         English 1990-05-01             0.5 
#>  9 Hedy       Lamarr    Teacher         Science 1976-06-08             0.5 
#> 10 Carlos     Boozer    Coach           Basket… 2015-08-05            NA   
#> 11 Young      Boozer    Coach           <NA>    1995-01-01            NA   
#> 12 Micheal    Larsen    Teacher         English 2009-09-15             0.8 
#> # … with 2 more variables: full_time <chr>, cert <chr>
```

<sup>Created on 2019-04-26 by the [reprex package](https://reprex.tidyverse.org) (v0.2.1)</sup>
