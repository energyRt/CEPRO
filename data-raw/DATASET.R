## code to prepare `DATASET` dataset goes here
library(sf)
library(tidyverse)
library(data.table)

# timeframes / timeslices
if (F) {
  timetable_d365_h24 <-
    energyRt::make_timetable(timeslices::tsl_sets$d365_h24)

  dd <- lubridate::ymd(paste0("2019-", 1:12, "-15")) %>%
    lubridate::yday() %>%
    formatC(width = 3, flag = "0")
  dd <- paste0("d", dd)

  cepro_timetables <- list(
    d365_h24 = timetable_d365_h24,
    d12_h24 = filter(timetable_d365_h24, YDAY %in% dd)
  )

  usethis::use_data(cepro_timetables, overwrite = TRUE)
}

## maps ####
load("data-raw/chn_sf.RData")
load("data-raw/offshore_sf.RData")

cepro_maps <- list(
  mainland_r34 = chn_sf,
  offshore_r1 = st_as_sf(offshore_sf)
)
# usethis::use_data(cepro_maps, overwrite = TRUE)

# data ####
cepro_data <- list()

## demand ####
(load("~/Documents/R/CEPRO/data-raw/elc_con_dh_GWh.RData"))
elc_con_dh_GWh <- elc_con_dh_GWh %>%
  group_by(region, year) %>%
  mutate(elc_con_dh_GWh = round(mean(elc_con_dh_GWh), 3)) %>%
  ungroup() %>%
  # select(-slice) %>%
  unique()

cepro_data$elc_cons_hourly_average_GWh <- elc_con_dh_GWh

## Bio energy ####
(load("data-raw/bio_PJ.RData"))
cepro_data$bio_resource_PJ <- bio_PJ


## CF - solar ####
(load("data-raw/sol_GW_max_sf.RData"))
merra_sol_cl <- fst::read_fst("data-raw/merra_sol_cl.fst", as.data.table = F)
cepro_merra_sol_cl <- merra_sol_cl
usethis::use_data(cepro_merra_sol_cl, overwrite = TRUE)
cepro_maps$sol_GW_max_sf <- sol_GW_max_sf


## CF - wind ####
(load("data-raw/win_GW_max.RData"))
merra_win_cl <- fst::read_fst("data-raw/merra_win_cl.fst", as.data.table = T)
cepro_merra_win_cl <- merra_win_cl
usethis::use_data(cepro_merra_win_cl, overwrite = TRUE)
cepro_maps$win_GW_max_sf <- win_GW_max_sf

usethis::use_data(cepro_data, overwrite = TRUE)
usethis::use_data(cepro_maps, overwrite = TRUE)

