# With dplyr and tidyr, it has become very easy to reclassify data e.g. for use in pie charts (QGIS, etc.)
# Oliver Schallert, 2021

library(dplyr)
library(tidyr)

# setwd("...")

# Set working directory, if you like.

# Please use the test file "test.csv" to check the functionality of this snippet.

daten <- read.csv("...", sep=",", row.names=,1, na.strings="")

# Specify input path.

a <-
daten %>%
  count(Ort, Form) %>%
  spread(Form, n, fill = NA)


# Specify output path.

write.csv2(a, "...", row.names = TRUE)

