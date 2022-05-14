library(shiny) # shiny features
library(shinydashboard) # shinydashboard functions

dashboardPage(
  dashboardHeader(title = "2008 FLIGHT DATA ANALYSIS WITH R Shiny", 
                  titleWidth =650),
  dashboardSidebar(
    sidebarMenu(
      id = "sidebar",
      menuItem("Flight Dataset", tabName = "data", icon =icon("database")),
      menuItem(text= "visualization", tabName = "viz", icon = icon("chart-line")),
      selectInput(inputId = "var1", label= "Select Attributes", choices = c1, selected = "TotalOperations"),
      selectInput(inputId = "var3", label= "Select the x variable", choices = c1, selected = "CarrierDelays"),
      selectInput(inputId = "var4", label= "Select the y variable", choices = c1, selected = "LateAircraftDelays"),
      menuItem(text = "Carrier Location", tabName = "map", icon = icon("map"))
    )
  ),
  dashboardBody(
    tabItems(
      #tab item
      tabItem(tabName = "data",
              tabBox(id="t1", width =12,
                     tabPanel("About", icon=icon("address-card"), fluidRow(
                       column(width = 8, tags$img(src="airplane.jpg", width =600 , height = 300),
                              tags$br() , 
                              tags$a("Image from google"), align = "center"),
                       column(width = 4, tags$br() ,
                              tags$p("A flight delay is when an airline flight takes off and/or lands later than its scheduled time. The Federal Aviation Administration (FAA) considers a flight to be delayed when it is 15 minutes later than its scheduled time. 
                                     A cancellation occurs when the airline does not operate the flight at all for a certain reason.
                                     source:wikipidia")
                       )
                     )),
                     tabPanel("Data", icon= icon("table"), dataTableOutput("dataT")),
                     tabPanel("Structure", icon= icon("address-book"), verbatimTextOutput("structure")),        
                     tabPanel("summary stats", icon= icon("address-card"), verbatimTextOutput("summary")),
                     )
               )),
    tabItem(tabName = "Viz",
            #tab box
             tabBox(id="t2", width =8,
            tabPanel(tiitle ="Distribution", value = "distro", plotlyOutput("histplot"))
           
      ),
    #tab item 3
    tabItem(tabName = "map",
            box(h1("placeholder UI"))
            )
    )))
