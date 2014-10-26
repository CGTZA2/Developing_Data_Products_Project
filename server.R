library(shiny)


shinyServer(function(input, output) {

ds<-read.csv("labdata.csv",stringsAsFactors=F)
cat(dim(ds))

dataset<-reactive(function() {

	subset(ds,room==input$labroom & hour==input$hour & weekday==input$weekday)
  })


  
   output$roomPlot <- reactivePlot(function(){
	db=dataset()
     	hist(db$In_use,
	    main=input$weekday,
            ylab="Frequency",
            xlab="Proportion usage (per total number of computers)",
	    col="lightblue")

  })

  })