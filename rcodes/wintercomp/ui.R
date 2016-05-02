shinyUI(fluidPage(
  titlePanel("Winter Companion -- Educational Website"),
  
  br(),
  h3("Hypothermia", align='center',style='color:red'),
  pre(h5("Hypothermia is a condition that occurs when your body temperature drops below 95 degrees Fahrenheit. When this occurs, your hearts, lungs, and other organs will not work properly. Soon enough, they will shut down, and this could lead to death.
Ususally, the risk of getting hypothermia is during winter season. However, if you exposed to cold weather a spring hike or capsized on summer sail, you are also at risk of getting hypothermia.")),
  h4("------------------------------------------------------------------------------",align='center'),
  br(),
  
  
  
  p(img(src='freezing-cold-person-cartoon.jpg',height=200,width=200),
    img(src="chad-carpenter-snowshoe-hypothermia-cartoon.jpg",height=400,width=400),align='center'),
  
  h4("------------------------------------------------------------------------------",align='center'),
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput("n", "number of years in comparison", 2, 14,
                  value = 2, step = 1)
    ),
    mainPanel(plotOutput("plot1"))
  ),
  br(),
  h4("------------------------------------------------------------------------------",align='center'),
  br(),
  fluidRow(
    column(4,
      plotOutput("plot2")),
      
    column(8,
      plotOutput("plot3"))
  ),

  br(),
  pre(h5("The risk of death from hypothermia is varies by ages and genders. It increases with age. Elderly are more 
likely to have hypothermia. Accroding to the graph, females have higher risk of getting hypothermia than 
males."), align='center'),
  br(),
  
  h4("------------------------------------------------------------------------------",align='center'),
  
  h3("Hypothermia Death by State (1999-2013)", align='center'),
  p(img(src='state4.jpg',height=500,width=500),align='center'),
  pre(h5("According to the graph, not just only nothern states are affected, southern states are also affected. In fact, the southern states have even more deaths than northern states. This might imply that hypothermia can occur 
any where and any time. Anyone can get hypothermia if he or she is not prepared."), align='center'),
  br(),
  
  h4("------------------------------------------------------------------------------",align='center'),
  
  tags$a(href="https://sites.google.com/site/ddacwintercompanion/", "Click here to Winter Companion")

))