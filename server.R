library(DT)

function(input, output, session){
  #structure
  output$structure <- renderPrint(
    # structure of the data
    us_flights %>%
      str()
  )
  #summary
  output$structure <- renderPrint(
    us_flights %>%
      summary()
  )
  
  #DataTable
  output$dataT <-renderDataTable(
    us_flights
  )

  # stack histogram and boxplot
 output$histplot <- renderPlotly({
   p1 = us_flights %>%
    plot_ly() %>%
    add_histogram(~TotalOperations) %>%
  layout(xaxis = list(title = "TotalOperations"))
  
  #box plot
  p2 = us_flights %>%
    plot_ly() %>%
    add_boxplot(~TotalOperations) %>% 
    layout(yaxis = list(showticklabels = F))
  
  # stack plot
  subplot(p2, p1, nrows = 2) %>%
    hide_legend() %>%
    layout(title ="Distribution chart - Histogram and Boxplot",
           yaxis =list(title = "Frequency"))
})
 

}