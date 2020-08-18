##############
#YPFS R theme#
#Corey Runkel#
##2020-06-12##
##############

library(tidyverse)
library(lubridate)
library(fredr) #as of 2020-08-18 this package has been removed from CRAN but is still available on github at sboysel/fredr
library(showtext)

#fonts
font_add("Yale", "fonts/YaleNew-Roman.otf", "fonts/YaleNew-Bold.otf", "fonts/YaleNew-Italic.otf", "fonts/YaleNew-BoldItalic.otf")
font_add("Helvetica", "fonts/Helvetica-light.ttf", "fonts/Helvetica.ttf", "fonts/Helvetica-Oblique.ttf", "fonts/Helvetica-BoldOblique.ttf")

#NBER recessions
recessions <- read_csv("start, end
1857-06-01, 1858-12-01
1860-10-01, 1861-06-01
1865-04-01, 1867-12-01
1869-06-01, 1870-12-01
1873-10-01, 1879-03-01
1882-03-01, 1885-05-01
1887-03-01, 1888-04-01
1890-07-01, 1891-05-01
1893-01-01, 1894-06-01
1895-12-01, 1897-06-01
1899-06-01, 1900-12-01
1902-09-01, 1904-08-01
1907-05-01, 1908-06-01
1910-01-01, 1912-01-01
1913-01-01, 1914-12-01
1918-08-01, 1919-03-01
1920-01-01, 1921-07-01
1923-05-01, 1924-07-01
1926-10-01, 1927-11-01
1929-08-01, 1933-03-01
1937-05-01, 1938-06-01
1945-02-01, 1945-10-01
1948-11-01, 1949-10-01
1953-07-01, 1954-05-01
1957-08-01, 1958-04-01
1960-04-01, 1961-02-01
1969-12-01, 1970-11-01
1973-11-01, 1975-03-01
1980-01-01, 1980-07-01
1981-07-01, 1982-11-01
1990-07-01, 1991-03-01
2001-03-01, 2001-11-01
2007-12-01, 2009-06-01
2020-02-01, 2020-02-02")
recessions[nrow(recessions), 2] <- Sys.Date()

#Liquidity swap lines
tradewt <- fredr(series_id = "DTWEXBGS", units = "pch")
ggplot(tradewt) +
  geom_line(aes(date, value), color = "#286dc0", show.legend = F) + #line plot of delinquencies
  geom_rect(data = mutate(filter(recessions, end >= min(tradewt$date)), #only include recessions ending after start of series
                          start = if_else(start < min(tradewt$date), min(tradewt$date), start)), #trim start of overhanging recession
            aes(xmin = start, xmax = end, ymin = -Inf, ymax = Inf), #define sides of rectangle
            fill = "#978d85", #Yale shading color
            alpha = .33) + #opacity
  scale_x_date(expand = c(0,0), date_breaks = "2 years", date_labels = "%Y") +
  ggrepel::geom_label_repel(aes(date, value, label = datestring), data = mutate(slice_max(tradewt, order_by = abs(value), n = 6), datestring = format(date, "%b %d")), min.segment.length = 0, label.padding = .1, segment.alpha = .6, show.legend = F, color = "#4a4a4a", family = "Helvetica") +
  labs(x = NULL, y = "Percent change", title = "Daily change in trade-weighted US dollar index, 2006 - 2020", subtitle = "Shaded areas indicate recessions, and six largest one-day swings are labeled", caption = "Source: Federal Reserve Board of Governors") +
  theme_print()