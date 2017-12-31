setwd("C:/Users/Shine/Desktop/clean-data")
if(!file.exists("data")){
  dir.create('data/')
}

## Get CSV data and Read CSV Data from the internet
## https://data.baltimorecity.gov/Transportation/Baltimore-Fixed-Speed-Cameras/dz54-2aru
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "data/camera.csv", method = "curl")
list.files('data/')

dateDowloaded <- date()
dateDowloaded


cameraData <- read.table("data/camera.csv", sep = ",", header = TRUE)
head(cameraData)

cameraData <- read.csv("data/camera.csv")
head(cameraData)


## Get xls data and Read xls Data from the internet
if(!file.exists("data")){
  dir.create('data/')
}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "data/camera.xlsx", method = "curl")
list.files('data/')

install.packages("xlsx")
library(xlsx)
cameraDate <- read.xlsx2("data/camera.xlsx", sheetIndex = 1, header = TRUE)


install.packages("XML")
library(XML)
fileUrl <- "https://www.w3schools.com/xml/simple.xml"
download.file(fileUrl, destfile = "data/simple.xml", method = "curl")
localUrl <- "data/simple.xml"
doc <- xmlTreeParse(localUrl)
doc
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode, xmlValue)
xpathSApply(rootNode,"//name", xmlValue)


install.packages("jsonlite")
library("jsonlite")
