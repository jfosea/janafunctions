#' Creating a Function to Calculate Means by Group
#'
#' Allow for an easier way to calculate the means
#' grouped by a certain categorical variable. It also prints a boxplots of the grouped
#' quantitative values.
#' @param data Tibble data frame that contains the grouping and the desired quantity to calculate.
#' @param group_name name of the column in data that contains the grouping, it does not have to be a string.
#' @param quantity_name name of the column in data that contains the quantities for mean calculations
#'
#' @return An object of class "Tibble" that returns
#' the means of each group.
#' @import dplyr
#' @import datasets
#' @import ggplot2
#' @examples
#' calculate_group_means(InsectSprays, spray, count)
#' @export
calculate_group_means <- function(data, group_name, quantity_name) {

  # place group_name and quantity_name as actual values from data
  group <- eval(substitute(group_name), data)
  quantity <- eval(substitute(quantity_name), data)

  # check wrapper for errors
  if (!is.factor(group) ) {
    stop(paste("The second input must be a factor variable. Your input is of class", class(group), "."))
  }
  if (!is.numeric(quantity)) {
    stop(paste("The third input must be a numeric variable. Your input is of class", class(quantity), "."))
  }

  # create tibble data frame that contains summarized data
  data %>%
    group_by({{group_name}}) %>%
    summarise(mean=mean({{quantity_name}})) -> results

  # plot means by group
  p <- as_tibble(data.frame(group, quantity)) %>%
    ggplot(aes(x=group, y=quantity)) +
    geom_boxplot() +
    xlab(names(results)[1]) +
    ylab(names(results)[2])
  print(p)
  return(results)
}
