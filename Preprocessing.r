
train_data<-read.csv('train.csv')

head_data<-head(train_data)

head_data

train_data<-within(train_data,rm("Descript","Resolution"))

library(ggplot2)
library(lubridate)
library(dplyr)

help(lubridate)
#Parsing Date to Separate Columns
train_data['Year']<-year(ymd_hms(train_data$Dates))
train_data['Month']<-month(ymd_hms(train_data$Dates))
train_data['Day']<-day(ymd_hms(train_data$Dates))
train_data['Hour']<-hour(ymd_hms(train_data$Dates))

train_data<-within(train_data,rm("Dates","Address"))

head_data<-head(train_data)

head(train_data,15)

county<-summarise(group_by(train_data, Category), Counts=length(Category))

#select any insight

county[[1:10]]


y<-"DayOfWeek"

x=quote(DayOfWeek)
counts<- count(train_data,x, sort=TRUE)


counts

 x<-"Category"
summarise(group_by(train_data, x), Counts=length(Category))

library(ggmap)

map <- readRDS("./data/input/sf_map_copyright_openstreetmap_contributors.rds")

ggmap(map)

library(plyr)

unique(train_data$DayOfWeek)

 summarise(group_by(train_data, Category), Counts=length(Category))

#R tutorial

getwd()

dir()

names(train_data)

attributes(head(train_data))

ls()

summary(train_data)

levels(head(train_data$Category,15))

write.csv(train_data, file = "sfCrimeModified.csv")


qmap('san francisco',zoom=10)

help(qmap)

#plot the  hybrid Google Maps basemap
map <- qmap('San Francisco', zoom = 12, maptype = 'hybrid')
#plot the crime points on top
map + geom_point(data = train_data[which(train_data$PdDistrict=="SOUTHERN"),], aes(x =X , y = Y), color="blue", size=0.06125, alpha=0.5)



#plot the roads Google Maps basemap
map <- qmap('San Francisco', zoom = 12, maptype = 'roadmap')
#plot the density map
map + stat_density2d(
  aes(x = X, y = Y, fill = ..level.., alpha = ..level..*2), 
  size = 2, bins = 5, data = train_data[which(train_data$Category=="ROBBERY"),], geom = "polygon") +
  scale_fill_gradient(low = "black", high = "red")

x="ARSON"

plot1<- ggplot(data=train_data,
        aes(x=reorder(PdDistrict)) +
        geom_bar(stat="count", width=0.5, fill="steelblue") +
        scale_size_area() +
        xlab("District") +
        ylab("Count") +
        theme(axis.text.x = element_text(angle = 45, vjust=1, hjust = 1))
plot1


option<-"Hour"
ggplot(train_data[which(train_data$Category=="TRESPASS"),],aes_string(x=option) )+ geom_bar(colour="red") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))



