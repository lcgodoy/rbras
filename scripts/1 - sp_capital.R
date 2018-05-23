#---- Vis 1: SP - votos lat long ----

# Municipio de SP - shp

data("regMun")

regMun %<>% 
  st_as_sf() %>% 
  st_transform(crs = 3857) %>% 
  filter(UF == 'SP', NOME == 'São Paulo')

sp_cap <- regMun

# dados de votacao

load('../data/votos_sp.RData')

# Visualizacao

ggplot(votos) +
  geom_sf(data = sp_cap,
          size = .2, 
          color = 'black', fill = 'black') +
  geom_sf(aes(color = PSDB), shape = 19, alpha = .6, size = .4) +
  scale_color_gradient2(low = 'red', mid = 'white', 
                        high = 'blue',
                        midpoint = .5) +
  theme_bw()
