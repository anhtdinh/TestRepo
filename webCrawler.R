library(tidyverse)
library(Rcrawler)

website = "https://www.metacritic.com/browse/tv/all/all/current-year/"

Rcrawler(website,
         crawlUrlfilter = "/tv",
         no_cores = 4,
         no_conn = 4,
         MaxDepth = 1,
         saveOnDisk = FALSE)
