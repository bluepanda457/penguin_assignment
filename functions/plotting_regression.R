# A function to produce a scatterplot to check assumption of linear relationship between variables
plot_correlation <- function(penguins_filtered){
  penguins_filtered %>% 
    ggplot(aes(x = flipper_length_mm, y = culmen_length_mm)) +
    geom_point() + 
    labs(title = "Association between flipper length & bill length", x = "Flipper length (mm)",
         y = "Bill length (mm)") +
    theme_bw()}


# A function to plot linear regression model
plot_penguin_lm <- function(penguins_filtered){
  penguins_filtered %>% 
    ggplot(aes(x = culmen_length_mm, y = flipper_length_mm, color = species)) +
    geom_point() +
    geom_smooth(method = "lm", col = "black") +
    scale_color_manual(labels = c("Adelie","Chinstrap","Gentoo"),
                       values = c("darkorange", "purple", "cyan4")) +
    labs(title = "Linear regression between Bill length and Flipper length in penguins",
         x = "Bill length (mm)",
         y = "Flipper length (mm)",
         color = "Species") +
    theme_bw()
}


# A function to save the plot as an svg file:
save_plot_svg <- function(penguins_filtered, filename, size, scaling){
  size_inches = size/2.54
  svglite(filename, width   = size_inches, 
          height  = size_inches, 
          scaling = scaling)
  penguin_graph <- plot_penguin_lm(penguins_filtered)
  print(penguin_graph)
  dev.off()
}
