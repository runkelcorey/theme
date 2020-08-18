theme_print <- function(legend.position = "right") {
  theme_grey(base_family = "Helvetica") %+replace%
    theme(plot.title = element_text(family = "Yale", face = "bold", color = "#00356b", hjust = 0, vjust = 1.6, size = rel(1.3)), plot.subtitle = element_text(family = "Yale", color = "#00356b", hjust = 0, vjust = 1.2), plot.caption = element_text(color = "#4a4a4a", hjust = 1, vjust = 1, size = rel(.8)),
          axis.title = element_text(face = "bold", color = "#222222"), axis.text = element_text(color = "#4a4a4a"), axis.ticks = element_line(color = "#222222"),
          legend.title = element_text(color = "#222222", size = rel(.95)), legend.text = element_text(color = "#4a4a4a", size = rel(.9)), legend.position = legend.position,
          panel.background = element_rect(fill = NA, color = NA), panel.grid = element_line(color = "#dddddd"))
}