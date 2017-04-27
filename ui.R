
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("San Francisco Data Visualisation"),
  sidebarLayout(
    sidebarPanel(
      selectInput("columnNames","select any",c("Category","DayOfWeek","PdDistrict","Year","Month","Day","Hour"),selected="DayOfWeek",selectize=FALSE),
      selectInput("categoryType","select any",c("ARSON" ,"ASSAULT", 'BAD CHECKS', 'BRIBERY', 'BURGLARY',
                                                'DISORDERLY CONDUCT' ,'DRIVING UNDER THE INFLUENCE', 'DRUG/NARCOTIC',
                                                'DRUNKENNESS' ,'EMBEZZLEMENT' ,'EXTORTION' ,'FAMILY OFFENSES' ,
                                                'FORGERY/COUNTERFEITING' ,'FRAUD' ,'GAMBLING' ,'KIDNAPPING',
                                                'LARCENY/THEFT', 'LIQUOR LAWS', 'LOITERING' ,'MISSING PERSON',
                                                'NON-CRIMINAL' ,'OTHER OFFENSES' ,'PORNOGRAPHY/OBSCENE MAT' ,
                                                'PROSTITUTION', 'RECOVERED VEHICLE' ,'ROBBERY', 'RUNAWAY' ,
                                                'SECONDARY CODES' ,'SEX OFFENSES FORCIBLE' ,'SEX OFFENSES NON FORCIBLE' ,
                                                'STOLEN PROPERTY', 'SUICIDE' ,'SUSPICIOUS OCC' ,'TREA' ,
                                                'TRESPASS' ,'VANDALISM', 'VEHICLE THEFT', 'WARRANTS' ,'WEAPON LAWS' ))
      
    ),
    mainPanel(
      plotOutput("myHist"),
      plotOutput("myMap1"),
      plotOutput("myMap2")
    )
    
  )
  
  
))