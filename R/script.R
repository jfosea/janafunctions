# suppressPackageStartupMessages(library(datateachr))
# suppressPackageStartupMessages(library(tidyverse))
# suppressPackageStartupMessages(library(testthat))

#
# calculate_group_means <- function(data, group_name, quantity_name) {
#
#   # place group_name and quantity_name as actual values from data
#   group <- eval(substitute(group_name), data)
#   quantity <- eval(substitute(quantity_name), data)
#
#   # check wrapper for errors
#   if (!is.factor(group) ) {
#     stop(paste("The second input must be a factor variable. Your input is of class", class(group), "."))
#   }
#   if (!is.numeric(quantity)) {
#     stop(paste("The third input must be a numeric variable. Your input is of class", class(quantity), "."))
#   }
#
#   # create tibble data frame that contains summarized data
#   data %>%
#     group_by({{group_name}}) %>%
#     summarise(mean=mean({{quantity_name}})) -> results
#
#   # plot means by group
#   p <- as.tibble(data.frame(group, quantity)) %>%
#     ggplot(aes(x=group, y=quantity)) +
#     geom_boxplot() +
#     xlab(names(results)[1]) +
#     ylab(names(results)[2])
#   print(p)
#   return(results)
# }
#
# calculate_group_means(asdf, ward, no_of_units) # non-existent tibble
# calculate_group_means(apt_buildings, asdf, no_of_units) # non-existent first variable input
# calculate_group_means(apt_buildings, ward, asdf) # non-existent second variable input
# calculate_group_means(apt_buildings, no_of_units, no_of_units) # non-character first variable input
# calculate_group_means(apt_buildings, ward, ward) # non-numeric second variable input
# calculate_group_means(apt_buildings, ward, no_of_units) # correct
#
# p1 <- cancer_sample %>%
#   ggplot(aes(x=diagnosis, y=radius_mean)) +
#   geom_boxplot() +
#   xlab("diagnosis") +
#   ylab("mean")
#
# tibble1 <- cancer_sample %>%
#   group_by(diagnosis) %>%
#   summarise(mean=mean(radius_mean))
#
# test_that("Test Function for Correct Errors", {
#   expect_equal(calculate_group_means(cancer_sample, diagnosis, radius_mean), tibble1)
#   expect_error(calculate_group_means(nonexistant, ward, nonexistant), "object 'nonexistant' not found")
#   expect_error(calculate_group_means(apt_buildings, 0, no_of_units), "The first argument must be a categorical variable. Your input is of class numeric .")
#   expect_error(calculate_group_means(apt_buildings, ward, nonexistant), "object 'nonexistant' not found")
# })
#
#
#
#
# calculate_group_means((InsectSprays), spray, count)
