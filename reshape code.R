# Read the CSV file
df <- read_csv("歷年中華民國國民出國目的地人數統計2002-2024.csv", col_types = cols(.default = "c"))  # Read everything as character

# Reshape from wide to long format
df_long <- df |>
  tidyr::pivot_longer(cols = starts_with("20"),  # Select year columns
                      names_to = "Year",         # Convert column names to "Year"
                      values_to = "Travelers")   # Store values in "Travelers"

# Convert columns to appropriate types
df_long <- df_long |>
  mutate(Year = as.numeric(Year),                          # Convert Year to numeric
         Travelers = as.numeric(str_remove_all(Travelers, ",")))  # Remove commas and convert to numeric

# View the reshaped data
head(df_long)

