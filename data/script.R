library(gtrendsR)
library(dplyr)

seguro_desemprego_gtrends <- gtrends(keyword = "seguro desemprego",
                                     geo = "BR", time='all', onlyInterest=TRUE)


seguro_desemprego_gtrends = seguro_desemprego_gtrends$interest_over_time %>%
  mutate(data = as.Date(date),
         interesse = hits) %>% 
  select(data, interesse)

saveRDS(seguro_desemprego_gtrends, 'data/seguro_desemprego_gtrends.rds')
