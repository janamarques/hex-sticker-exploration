library(ggcharts)
library(showtext)
ggcharts_set_theme("theme_ggcharts")
showtext_auto()
font_add_google("IBM Plex Sans")

votes <- c(
  "theme_ggcharts" = 59,
  "theme_hermit" = 53,
  "theme_ng" = 28,
  "theme_nightblue" = 19
)
data <- data.frame(
  theme = names(votes),
  votes = unname(votes),
  img = paste0(names(votes), ".png")
)

img_fun <- function(x) {
  paste0("<img src = '", x, ".png' height = '50'/>")
}

png("hex_votes.png", width = 1800, height = 1400, type = "cairo-png",
    antialias = "subpixel", res = 300)
bar_chart(data, theme, votes) +
  scale_x_discrete(labels = img_fun) +
  labs(
    x = NULL,
    y = "Votes",
    title = "And The Winner Is...",
    caption = "Data Source: LinkedIn Comments & Twitter Poll") +
  theme(
    axis.text.y = ggtext::element_markdown(),
    plot.caption = element_text(size = 30),
    text = element_text(family = "IBM Plex Sans", size = 50)
  )
dev.off()
