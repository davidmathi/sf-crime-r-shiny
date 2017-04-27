
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
library(ggplot2)
library(ggmap)


sf_data<-read.csv("sfCrimeModified.csv")
shinyServer(function(input,output){
  
  
  output$myHist<-renderPlot({
  if(input$columnNames!="Category"){
    ggplot(sf_data[which(sf_data$Category==input$categoryType),],aes_string(x=input$columnNames) )+ geom_bar(colour="red") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))}
  else
  {
    ggplot(sf_data,aes_string(x=input$columnNames) )+ geom_bar(colour="red") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))}
    
  })
  
  output$myMap1<-renderPlot({
    
    if(input$columnNames!="Category"){
      #plot the  hybrid Google Maps basemap
      map <- qmap('San Francisco', zoom = 12, maptype = 'hybrid')
      #plot the crime points on top
      map + geom_point(data = sf_data[which(sf_data$Category==input$categoryType),], aes(x =X , y = Y), color="blue", size=3, alpha=0.5)}
    else
    {
      #plot the  hybrid Google Maps basemap
      map <- qmap('San Francisco', zoom = 12, maptype = 'hybrid')
      #plot the crime points on top
      map + geom_point(data = sf_data, aes(x =X , y = Y), color="blue", size=3, alpha=0.5)
    
  }
      },width=15000,height=1500)
  
  
  output$myMap2<-renderPlot({
    
    if(input$columnNames!="Category"){
      
      #plot the roads Google Maps basemap
      map <- qmap('San Francisco', zoom = 12, maptype = 'roadmap')
      #plot the density map
      map + stat_density2d(
        aes(x = X, y = Y, fill = ..level.., alpha = ..level..*2), 
        size = 2, bins = 5, data = sf_data[which(sf_data$Category==input$categoryType),], geom = "polygon") +
        scale_fill_gradient(low = "black", high = "red")
    }
    else
    {
      #plot the roads Google Maps basemap
      map <- qmap('San Francisco', zoom = 12, maptype = 'roadmap')
      #plot the density map
      map + stat_density2d(
        aes(x = X, y = Y, fill = ..level.., alpha = ..level..*2), 
        size = 2, bins = 5, data = sf_data, geom = "polygon") +
        scale_fill_gradient(low = "black", high = "red")
      
    }
  },width=1000,height=1000)
    
  
  
})
