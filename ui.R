library(shiny)
library(shinydashboard)

dashboardPage (
  
  skin = "blue",
  # --- header ---
  dashboardHeader(title = "SDG Analysis"),
  
  # --- sidebar ---
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview", tabName = "page1", icon = icon("info")),
      
      menuItem("SDG by Region", tabName = "page2", icon = icon("globe")),
      
      menuItem("World Map", tabName = "page3", icon = icon("map"))
      
    )
  ),
  
  # --- body ---
  dashboardBody(
    tabItems(
      ## --- page 1 ---
      tabItem(
        box(title = "What is SDG?",
            div(
              tags$img(src = "https://upload.wikimedia.org/wikipedia/commons/d/df/Sustainable_Development_Goals.png", width = "35%"),
              "The 2030 Agenda for Sustainable Development, adopted by all United Nations Member States in 2015, provides a shared blueprint for peace and prosperity for people and the planet, now and into the future. At its heart are the 17 Sustainable Development Goals (SDGs), which are an urgent call for action by all countries - developed and developing - in a global partnership. They recognize that ending poverty and other deprivations must go hand-in-hand with strategies that improve health and education, reduce inequality, and spur economic growth – all while tackling climate change and working to preserve our oceans and forests.",
              footer = "Source: https://sdgs.un.org/goals"
            ), width = 6),
            
        tabName = "page1",
        
        ## --- page 1: row 1 ---
        fluidRow(
          infoBox(
            width = 5,
            title = "Number of countries recorded by the SDG Index Score",
            color = "blue",
            value = length(unique(index$country)),
            icon = icon("globe")  # Set an appropriate icon based on the title
          ),
          
          infoBox(
            width = 5,
            title = "Average Global Index Score",
            color = "blue",
            value = mean(report$overall_score),
            icon = icon("chart-line")  # Set an appropriate icon based on the title
          )
        ),
        
        ## --- page 1: row 2 ---
        fluidRow(
          box(
            width = 6,
            plotlyOutput("plot1_a")
            ),
            
            ### plot 3: line
            box(
              width = 6,
              plotlyOutput("plot4_a")
          )
        )
      ),
      
      ## --- page 2 ---
      tabItem(
        tabName = "page2",
        
        ## --- page 2: row 1 ----
        fluidRow(
          
          ### Input 1: Choose a Region
          box(
            width = 6,
            selectInput(
              inputId = "input_region",
              label = "Choose a Region",
              choices = unique(report$region)
            )
          ),
          ### Input 2: Mean Score of Goals
          box(
            width = 6,
            selectInput(
              inputId = "input_score",
              label = "Mean Score of Goals",
              choices = unique(report$region), 
              multiple = TRUE
            )
          )
        ),
        fluidRow(
          ### Plot 2: Lolipop (plot3_a)
          box(
            width = 6,
            plotlyOutput("plot3_a")
          ),
          ### Plot 3: Line (plot2_a)
          box(
            width = 6,
            plotlyOutput("plot2_a")
          )
        )
      ),
      
      ## --- page 3 ---
      tabItem(
        tabName = "page3",
        
        ## --- page 3: row 1 ----
        fluidRow(
          box(
            width = 12,
            h2("World Map"),
            plotlyOutput("plot5_a"),
            
            ### Add a selectInput for "plot5_a"
            selectInput(
              inputId = "input_plot5_a",
              label = "Select an option for World Map",
              choices = unique()
          )
        )
      )
    )
  )
)