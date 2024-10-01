## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  # install.packages("remotes")
#  remotes::install_github("numbats/woylier")

## ----setup--------------------------------------------------------------------
library(woylier)
library(geozoo)
library(ggplot2)
library(dplyr)
library(purrr)

## -----------------------------------------------------------------------------
# Generate 1D example

set.seed(2022)
p <- 6
base1 <- tourr::basis_random(p, d=1)
base2 <- tourr::basis_random(p, d=1)

base1

base2

givens_full_path(base1, base2, nsteps = 5)

## -----------------------------------------------------------------------------
# Generate 2D example

set.seed(2022)
p <- 6
base3 <- tourr::basis_random(p, d=2)
base4 <- tourr::basis_random(p, d=2)

base3

base4

givens_full_path(base3, base4, nsteps = 5)

