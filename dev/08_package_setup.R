## Create a new package with RStudio

# Package setup -----------------------------------------------------------

## Use version control
# install.packages("usethis")
usethis::use_git_config(
  scope = "project",
  user.name = "John Doe",
  user.email = "john@example.org"
)
usethis::use_git()


# * create development folder -----------------------------------------------

# avoid problem with the dev scripts: dev/package-utility.R (this file)
dir.create("dev")
# save this file in `dev` as `setup.R`
usethis::use_build_ignore("dev")
# now you can save or move this file in "dev"


# * Fill in the DESCRIPTION file ---------------------------------------------

# rstudioapi::navigateToFile( "DESCRIPTION" )
usethis::use_description(
  list(
    Title = "App title",
    `Authors@R` = "person('Andrea', 'Melloncelli', email = 'andrea@vanlog.it', role = c('cre', 'aut'))",
    Description = "A sentence describing the package.",
    URL = "https://github.com/vanlog/R-for-data-science-2020"
  )
)
usethis::use_lgpl_license()       # You can set another license here
usethis::use_tidy_description()   # sort fields and packages

## * Common tasks -----------------------------------------------------------
usethis::use_readme_md( open = FALSE )
# usethis::use_code_of_conduct()
# usethis::use_lifecycle_badge( "Experimental" )
# usethis::use_news_md( open = FALSE )


## Use tests: if you want to use tests
usethis::use_testthat()


# Develop -----------------------------------------------------------------


# * Add a dependency ------------------------------------------------------

# Development dependency (usato solo per sviluppare, per scrivere, ma non per le funzionalità)
usethis::use_package("devtools", type="Suggests")

usethis::use_package( "dplyr" )
# remeber to add it to ROXYGEN or NAMESPACE:
#' @import dplyr  # ROXYGEN
#' import(dplyr)  # NAMESPACE


# * Enable Roxygen --------------------------------------------------------

## If you want to use roxygen, enable ROXYGEN in the project.
# Menu: tools > Project options > build tools > generate the documentation with roxygen
# NB: flag also "Install and Restart"
usethis::use_namespace(roxygen = TRUE)
devtools::document() # to fill NAMESPACE and documentation with ROXYGEN comments
# or roxygen2::roxygenise() # converts roxygen comments to .Rd files.
# or [Ctrl + Shift + D] in RStudio

# * Build or load ---------------------------------------------------------
# Load the package [CTRL + SHIFT + L] or install-and-reload [CTRL + SHIFT + B]

## Check the package for Cran or [CTRL + SHIFT + E]
devtools::check(document = FALSE) # check the package

# * Add internal datasets -------------------------------------------------
## If you want to provide data along with your package
usethis::use_data_raw( name = "my_dataset", open = FALSE )

# * Add Tests -------------------------------------------------------------
## Add one line by test you want to create
usethis::use_test( "somma" )

# * Add Vignettes --------------------------------------------------------
usethis::use_vignette("ThisTidyPackage")
devtools::build_vignettes()
# Install the package and see it with `vignette("ThisTidyPackage")`
# List your vignettes: vignette(package = 'cancRFDS')
# Install your package manually: devtools::install(build_vignettes = TRUE)


# Deploy ------------------------------------------------------------------

# devtools::missing_s3()
#
# devtools::check()
# rhub::check_for_cran()

