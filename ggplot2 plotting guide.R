library(tidyverse)
library(datateachr)
library(palmerpenguins)


## ggplot ##
# Choose what you want to plot
penguins %>%
  ggplot(aes(species, body_mass_g))


# Add a scatterplot layer
penguins %>%
  ggplot(aes(species, body_mass_g)) +
  geom_point()

# Adding "Jitter" to scatterplot
penguins %>%
  ggplot(aes(species, body_mass_g)) +
  geom_point(position = "jitter")

# Coloring each point by penguin sex
penguins %>%
  ggplot(aes(species, body_mass_g)) +
  geom_point(aes(color = sex), position = "jitter")

# Removing background color
penguins %>%
  ggplot(aes(species, body_mass_g)) +
  geom_point(aes(color = sex), position = "jitter") +
  theme_bw()

# Change X-axis & Y-axis labels
penguins %>%
  ggplot(aes(species, body_mass_g)) +
  geom_point(aes(color = sex), position = "jitter") +
  theme_bw() +
  labs(y = "Body Mass (g)", x = "Species")

# Using facet to separate penguins by sex
penguins %>%
  ggplot(aes(species, body_mass_g)) +
  geom_point(aes(color = sex), position = "jitter") +
  theme_bw() +
  labs(y = "Body Mass (g)", x = "Species") +
  facet_grid(~sex)

# Adding Boxplot layer to scatterplots
penguins %>%
  ggplot(aes(species, body_mass_g)) +
  geom_boxplot() +
  geom_point(aes(color = sex), position = "jitter") +
  theme_bw() +
  labs(y = "Body Mass (g)", x = "Species") +
  theme(legend.position = "none") +
  facet_grid(~sex)

# Remove grid, adding alpha transparency
penguins %>%
  ggplot(aes(species, body_mass_g)) +
  geom_boxplot() +
  geom_point(aes(color = sex), position = "jitter", alpha = 0.5) +
  theme_bw() +
  labs(y = "Body Mass (g)", x = "Species") +
  theme(legend.position = "none", panel.grid.minor = element_blank(), panel.grid.major = element_blank()) +
  facet_grid(~sex)



