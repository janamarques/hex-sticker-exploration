library(ggcharts)
library(dplyr)
library(hexSticker)
library(showtext)

font_add_google("Fira Sans")

themes <- ggcharts:::ggcharts_list_themes()
for (theme in themes) {
  ggcharts_set_theme(theme)
  current_theme <- ggcharts:::ggcharts_current_theme()

  chart <- biomedicalrevenue %>%
    filter(year == 2018) %>%
    column_chart(company, revenue, top_n = 5) +
    scale_y_continuous(
      breaks = c(0, 25, 50, 75),
      expand = expansion(c(0, .05))
    ) +
    theme(
      plot.background = element_blank(),
      axis.text.x = element_blank(),
      axis.text.y = element_blank(),
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      axis.line.x = element_line(size = .3)
    )

  file_name <- paste0(theme, ".png")
  hex <- sticker(
    chart,
    package = "ggcharts",
    p_family = "Fira Sans",
    l_y = 1.1,
    p_size = 20,
    p_color = current_theme$text$colour,
    h_fill = current_theme$plot.background$colour,
    h_color = current_theme$text$colour,
    s_x = 1,
    s_y = .86,
    s_width = 1.4,
    s_height = 1,
    url = "Created by Thomas Neitmann",
    u_size = 3,
    u_color = current_theme$text$colour,
    filename = file_name
  )

  png(
    filename = file_name,
    width = 43.9,
    height = 50.8,
    bg = "transparent",
    units = "mm",
    type = "cairo-png",
    antialias = "subpixel",
    res = 300
  )
  print(hex)
  dev.off()
}
