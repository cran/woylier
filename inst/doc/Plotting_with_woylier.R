## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

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

# First example
frames <- givens_full_path(base1, base2, nsteps = 10)
sp <- generate_space_view(p=p)
sp_path <- add_path(sp, frames) 
point1 <- as.data.frame(t(base1)) 
point1$type <- "point1"
point2 <- as.data.frame(t(base2))
point2$type <- "point2"
sp_path <- rbind(sp_path, point1, point2) 
p
tourr::animate_xy(sp_path[,1:p], col=sp_path$type, 
                  axes="bottomleft")

## -----------------------------------------------------------------------------
# Generate 2D example
set.seed(2022)
n <- 1000
p <- 3
d <- 2
base1 <- tourr::basis_random(p, d)
base2 <- tourr::basis_random(p, d)
frames_2d <- givens_full_path(base1, base2, 10)
proj_2d <- map(1:n, ~tourr::basis_random(n = p,  d=d)) %>%
  purrr::flatten_dbl() %>% 
  matrix(ncol = p*2, byrow = TRUE) %>%
  as_tibble()
# Path
path_2d <- t(apply(frames_2d, 3, c)) %>% 
  as.data.frame()
# Join
proj_2d <- proj_2d %>% 
  mutate(type="torus")
path_2d <- path_2d %>% 
  mutate(type="path")
proj_path <- bind_rows(proj_2d, path_2d)
tourr::animate_xy(proj_path[,1:6], 
                  col=proj_path$type, 
                  axes="bottomleft")

