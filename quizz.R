f <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="hid.csv")
d <- read.csv("hid.csv")

n <- strsplit(names(d), "wgtp")
n[123]


f2 <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "GDP.csv")
GDP <- read.csv("GDP.csv", skip = 3, stringsAsFactors = FALSE)



GDP <- GDP[X != ""]
GDP <- GDP[, list(X, X.1, X.3, X.4)]
setnames(GDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))
m <- as.numeric(gsub(",", "", GDP$gdp))

mean(m, na.rm = TRUE)

GDP <- GPD[GDP$Ranking != "",]


names(GDP) <- gsub("[.]","",names(GDP))

GDP$Ranking <- as.numeric(as.character(GDP$Ranking))
GDP$X <- as.character(GDP$X)


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "Country.csv")

country <- read.csv("Country.csv", skip = 4, stringsAsFactors = FALSE)

country <- country[country$Income.Group != "",]

names(GDP)[names(GDP)=="X"] <- "AGO"

names(country)[names(country)=="X.1"] <- "note"
names(country)[names(country)=="X"] <- "Zone"


m <- merge(GDP, country, by.x = "AGO", by.y = "AGO")

m <- m[m$USdollars != "",]
m <- m[m$USdollars != "..",]


d <- as.numeric(gsub("[.]", "", m$USdollars))

names(m) <- gsub("[.]","",names(m))
m$X1
isFiscalYearEnd <- grepl("fiscal year end[:] june", tolower(m$note))
isJune <- grepl("june", tolower(dt$Special.Notes))
table(isFiscalYearEnd, isJune)

table(isFiscalYearEnd)

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
format(sampleTimes, "%a %b %d %Y")

y <- grepl("2012", format(sampleTimes, "%Y"))
table(y)

yd <- grepl("lun(.*)2012", format(sampleTimes, "%a %b %d %Y"))
table(yd)
