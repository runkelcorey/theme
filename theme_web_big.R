theme_web_big <- function(base_size = 11, base_family = "Helvetica") {
  theme_grey(base_size = base_size, base_family = base_family) %+replace%
    theme(plot.title = element_text(family = "Yale", face = "bold", color = "#00356b", hjust = 0, vjust = 1.6, size = 90), plot.subtitle = element_text(family = "Yale", color = "#00356b", hjust = 0, vjust = 1.2, size = 84), plot.caption = element_text(color = "#4a4a4a", hjust = 1, size = 64),
          axis.title = element_text(face = "bold", color = "#222222", size = 76), axis.text = element_text(color = "#4a4a4a", size = 70), axis.ticks = element_line(color = "#222222"),
          legend.title = element_text(color = "#222222", size = 72), legend.text = element_text(color = "#4a4a4a", size = 68), legend.spacing.x = unit(12, "pt"),
          panel.background = element_rect(fill = NA, color = NA), panel.grid = element_line(color = "#dddddd"))
}