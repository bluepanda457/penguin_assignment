# A function to clean the data
cleaning_columns <- function(data_raw){
  data_raw %>%
    clean_names() %>%
    remove_empty(c("rows", "cols")) %>%
    select(-starts_with("delta")) %>%
    select(-comments) %>%
    select(-x)
}

# A function to subset the data to contain only species name, flipper length and bill (culmen) length
remove_empty_data <- function(data_clean){
  data_clean %>%
    filter(!is.na(culmen_length_mm)) %>%
    filter(!is.na(flipper_length_mm)) %>%
    select(species, flipper_length_mm, culmen_length_mm)
}
