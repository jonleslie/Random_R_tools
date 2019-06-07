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
It seems that the demo on the README.md file does not work with Version 2.1.1 of the tibble package, as called from the readxl package. The .name_repair argument causes the example to have column names:
Certification    --> Certification...9
Certification__1 --> Certification...10
Certification__2 --> Certification...11

I have made changes to the README.rmd to reflect this change, and can submit a pull request for it if you would like me to. I haven't done so yet as per your contributing guidelines, which ask that an issue be raised first.



#' <sup>Created on `r Sys.Date()` by the [reprex package](https://reprex.tidyverse.org) (v`r utils::packageVersion("reprex")`)</sup>


