suppressPackageStartupMessages(library(datateachr))
suppressPackageStartupMessages(library(tidyverse))

p1 <- cancer_sample %>%
  ggplot(aes(x=diagnosis, y=radius_mean)) +
  geom_boxplot() +
  xlab("diagnosis") +
  ylab("mean")

tibble1 <- cancer_sample %>%
  group_by(diagnosis) %>%
  summarise(mean=mean(radius_mean))

test_that("Test Function for Correct Errors", {
  expect_equal(calculate_group_means(cancer_sample, diagnosis, radius_mean), tibble1)
  expect_error(calculate_group_means(nonexistant, ward, nonexistant), "object 'nonexistant' not found")
  expect_error(calculate_group_means(apt_buildings, 0, no_of_units), "The second input must be a factor or character variable. Your input is of class numeric .")
  expect_error(calculate_group_means(apt_buildings, ward, nonexistant), "object 'nonexistant' not found")
})

