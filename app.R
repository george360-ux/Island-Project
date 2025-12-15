# app.R
library(shiny)
library(sf)
library(dplyr)
library(leaflet)
library(scales)
library(viridis)

# ---- LOAD PREPARED DATA ----
nb_all <- readRDS("nb_all.rds")

# ---- UI ----
ui <- fluidPage(
  titlePanel("Forest Loss in New Britain, Papua New Guinea"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("year", "Year:", 2001, 2023, 2023)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Annual Loss (ha)", leafletOutput("map_annual_ha")),
        tabPanel("Cumulative Loss (ha)", leafletOutput("map_cumulative_ha")),
        tabPanel("Annual Loss (%)", leafletOutput("map_annual_pct")),
        tabPanel("Cumulative Loss (%)", leafletOutput("map_cumulative_pct"))
      )
    )
  )
)

# ---- SERVER ----
server <- function(input, output) {
  
  # --- Annual forest loss (ha) ---
  output$map_annual_ha <- renderLeaflet({
    dat <- nb_all %>% filter(year == input$year)
    pal <- colorNumeric("viridis", nb_all$loss_ha)
    
    leaflet(dat) %>%
      addProviderTiles("CartoDB.Positron") %>%
      addPolygons(
        fillColor = ~pal(loss_ha),
        fillOpacity = 0.85,
        color = NA,
        weight = 0,
        smoothFactor = 0.5,
        label = ~paste0(
          province, ": ",
          scales::comma(loss_ha), " ha"
        )
      ) %>%
      addLegend(
        pal = pal,
        values = nb_all$loss_ha,
        title = "Annual Forest Loss (ha)"
      )
  })
  
  # --- Cumulative forest loss (ha) ---
  output$map_cumulative_ha <- renderLeaflet({
    dat <- nb_all %>% filter(year == input$year)
    pal <- colorNumeric("viridis", nb_all$cumulative_loss_ha)
    
    leaflet(dat) %>%
      addProviderTiles("CartoDB.Positron") %>%
      addPolygons(
        fillColor = ~pal(cumulative_loss_ha),
        fillOpacity = 0.85,
        color = NA,
        weight = 0,
        smoothFactor = 0.5,
        label = ~paste0(
          province, ": ",
          scales::comma(cumulative_loss_ha), " ha"
        )
      ) %>%
      addLegend(
        pal = pal,
        values = nb_all$cumulative_loss_ha,
        title = "Cumulative Forest Loss (ha)"
      )
  })
  
  # --- Annual forest loss (%) ---
  output$map_annual_pct <- renderLeaflet({
    dat <- nb_all %>% filter(year == input$year)
    pal <- colorNumeric("YlOrRd", nb_all$pct_loss)
    
    leaflet(dat) %>%
      addProviderTiles("CartoDB.Positron") %>%
      addPolygons(
        fillColor = ~pal(pct_loss),
        fillOpacity = 0.85,
        color = NA,
        weight = 0,
        smoothFactor = 0.5,
        label = ~paste0(
          province, ": ",
          scales::percent(pct_loss / 100, accuracy = 0.01)
        )
      ) %>%
      addLegend(
        pal = pal,
        values = nb_all$pct_loss,
        title = "% Forest Lost (Annual)"
      )
  })
  
  # --- Cumulative forest loss (%) ---
  output$map_cumulative_pct <- renderLeaflet({
    dat <- nb_all %>% filter(year == input$year)
    pal <- colorNumeric("YlOrRd", nb_all$cumulative_pct_loss)
    
    leaflet(dat) %>%
      addProviderTiles("CartoDB.Positron") %>%
      addPolygons(
        fillColor = ~pal(cumulative_pct_loss),
        fillOpacity = 0.85,
        color = NA,
        weight = 0,
        smoothFactor = 0.5,
        label = ~paste0(
          province, ": ",
          scales::percent(cumulative_pct_loss / 100, accuracy = 0.01)
        )
      ) %>%
      addLegend(
        pal = pal,
        values = nb_all$cumulative_pct_loss,
        title = "% Forest Lost (Cumulative)"
      )
  })
}


shinyApp(ui, server)


