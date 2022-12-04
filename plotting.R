## Question 02
# Function to produce the (bad) boxplot
plot_bill_length_figure <- function(penguins_bill_data){
  penguins_bill_data %>% 
    ggplot(aes(x = species, y = culmen_length_mm)) +
    geom_boxplot(aes(color = species), show.legend = FALSE) +
    geom_jitter() + 
    scale_color_manual(values = c("gold", "chartreuse", "red"))}


# A custom function for making png files:
save_bill_length_plot_png <- function(penguins_bill_data, 
                                  filename, size, res, scaling){
  agg_png(filename, width   =  size, 
          height  =  size, 
          units   =  "cm", 
          res     =  res, 
          scaling =  scaling)
  bill_length_boxplot <- plot_bill_length_figure(penguins_bill_data)
  print(bill_length_boxplot)
  dev.off()
}

# A custom function for making svg files:
save_bill_length_plot_svg <- function(penguins_bill_data, 
                                  filename, size, scaling){
  size_inches = size/2.54
  svglite(filename, width   = size_inches, 
          height  = size_inches, 
          scaling = scaling)
  bill_length_boxplot <- plot_bill_length_figure(penguins_bill_data)
  print(bill_length_boxplot)
  dev.off()
}





  