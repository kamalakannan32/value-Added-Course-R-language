library(shinydashboard)
library(shiny)
ui <-dashboardPage(
  dashboardHeader(title= "Basic Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard",icon = icon("dashboard")),
      menuItem("Widgets", tabName = "Widgets", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1",height=400)),
                box(title="Controls",
                    sliderInput("slider", "Number of observation",1,1000,500)
                )
              )),
      tabItem(tabName = "Widgets",
              h2("Widgets tab content"))
    )
  )
)
server <- function(input,output)  {
  set.seed(122)  
  histdata <- rnorm(1000)
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}
shinyApp(ui,server)