theme_web_small <- function(base_size = 11, base_family = "Helvetica", legend.position = "right") {
  theme_grey(base_size = base_size, base_family = base_family) %+replace%
    theme(plot.title = element_text(family = "Yale", face = "bold", color = "#00356b", hjust = 0, vjust = 1.6, size = rel(4)), plot.subtitle = element_text(family = "Yale", color = "#00356b", hjust = 0, vjust = 1.2, size = rel(3.6)), plot.caption = element_text(color = "#4a4a4a", hjust = 1, size = rel(2.5)),
          axis.title = element_text(face = "bold", color = "#222222", size = rel(3.3)), axis.text = element_text(color = "#4a4a4a", size = rel(3)), axis.ticks = element_line(color = "#222222"),
          legend.title = element_text(color = "#222222", size = rel(3.15)), legend.text = element_text(color = "#4a4a4a", size = rel(2.8)), legend.position = legend.position, legend.spacing.x = unit(4, "pt"),
          panel.background = element_rect(fill = NA, color = NA), panel.grid = element_line(color = "#dddddd"))
}