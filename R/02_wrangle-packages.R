## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()
data <- read_csv(here("data", "installed-packages.csv"))

stopifnot(length(data)==1)

## filter out packages in the default library
data <- data %>% filter(LibPath == .libPaths()[1])

## keep variables Package and Built
data <- data %>% select(Package, Built)

## if you use dplyr, code like this will work:
# apt <- ipt %>%
#   filter(LibPath == .libPaths()[1]) %>%
#   select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
write_csv(data, here("data", paste0("add-on-packages.csv")))

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
apt_freqtable <- data %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
write_csv(apt_freqtable, here("data", "add-on-packages-freqtable.csv"))

## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples

## when this script works, stage & commit it and the csv files
## PUSH!
