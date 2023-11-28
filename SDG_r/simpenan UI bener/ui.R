library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  skin = "blue",
  dashboardHeader(title = "SDG Analysis"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview", tabName = "page1", icon = icon("info")),
      menuItem("SDG by Region", tabName = "page2", icon = icon("globe")),
      menuItem("World Map", tabName = "page3", icon = icon("map"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "page1",
        dashboardBody(
          box(title = "What is SDG?",
              div(
                tags$img(src = "https://upload.wikimedia.org/wikipedia/commons/d/df/Sustainable_Development_Goals.png", width = "35%"),
                "The 2030 Agenda for Sustainable Development, adopted by all United Nations Member States in 2015, provides a shared blueprint for peace and prosperity for people and the planet, now and into the future. At its heart are the 17 Sustainable Development Goals (SDGs), which are an urgent call for action by all countries - developed and developing - in a global partnership. They recognize that ending poverty and other deprivations must go hand-in-hand with strategies that improve health and education, reduce inequality, and spur economic growth – all while tackling climate change and working to preserve our oceans and forests.",
                footer = "Source: https://sdgs.un.org/goals"
              ), width = 6),
          ## --- page 1: row 1 ---
          fluidRow(
            infoBox(
              width = 5,
              title = "Number of countries recorded by the SDG Index Score",
              color = "blue",
              value = length(unique(index$country)),  # You need to define 'index' in your server
              icon = icon("globe")
            ),
            infoBox(
              width = 5,
              title = "Average Global Index Score",
              color = "blue",
              value = mean(report$overall_score),  # You need to define 'report' in your server
              icon = icon("chart-line")
            )
          ),
          ## --- page 1: row 2 ---
          fluidRow(
            box(
              width = 6,
              plotlyOutput("plot1_a")
            ),
            box(
              width = 6,
              plotlyOutput("plot4_a")
            )
          )
        )
      ),
      tabItem(
        tabName = "page2",
        fluidRow(
          # Your content for page 2 here
        )
      ),
      tabItem(
        tabName = "page3",
        dashboardBody(
          ## --- page 3: row 1 ---
          fluidRow(
            box(
              width = 12,
              h2("World Map"),
              plotlyOutput("plot5_a")
            )
          )
        )
      )
    )
  )
)

ui
