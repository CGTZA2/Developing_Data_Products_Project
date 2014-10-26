library(shiny)

# Rely on 'labdata' dataset (proprietary)

# Define the overall UI

shinyUI(

  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Lab room monitoring of connectivity and usage over August 2014"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("weekday", "Day of the week", 
                    choices=c("Mon","Tues","Wed","Thurs","Fri","Sat","Sun")),
	       

        selectInput("labroom", "Lab Room", 
                    choices=c("HUM_Southside","HUM_PostGrad_Commons")),
       
	

        selectInput("hour", "Hour of the day (24hrs)", 
                    choices=c(9,10,11,12))
        

      ),
      
      # Create a spot for the barplot
      mainPanel(
        
        p("Documentation:",a("ShinyLabUsageDisplay",href="ShinyAPP.htm")),
        plotOutput("roomPlot")  
      )
      
    )
  )
)