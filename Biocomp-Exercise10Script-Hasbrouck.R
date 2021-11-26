### Problem 1: Find some data on two variables that you would expect to be related to each other. These data can come
# from your own research, your daily life, or the internet. Enter those data into a text file or Excel and then
# save a text file, and write a script that loads this text file and produces a scatter plot of those two variables
# that includes a trend line.

library(ggplot2)

canceragestats<-read.table("USCSDemographicAge.txt", header=TRUE, sep="\t")

ggplot(data=canceragestats,
       aes(x=Age.Group..years., y=Age.Specific.Rate))+
  geom_point()+
  xlab("Age Group(years)")+
  ylab("Age Specific Rate(Case Count/Population*100,000)")+
  geom_smooth(method="loess")+
  theme_classic()

### Problem 2: Given the data in “data.txt”. Write a script that generates two figures that sumamrize the data. First, show
# a barplot of the means of the four populations. Second, show a scatter plot of all of the observations. You may
# want to “jitter” the points (geom_jitter()) to make it easier to see all of the observations within a population
# in your scatter plot. Alternatively, you could also try setting the alpha argument in geom_scatterplot()
# to 0.1. Do the bar and scatter plots tell you different stories? Why?

regionvsobservations<-read.table("data.txt", header=TRUE, sep=",")

north<-regionvsobservations[regionvsobservations[,1]=="north",]
south<-regionvsobservations[regionvsobservations[,1]=="south",]
east<-regionvsobservations[regionvsobservations[,1]=="east",]
west<-regionvsobservations[regionvsobservations[,1]=="west",]

northmean<-mean(north$observations)
southmean<-mean(south$observations)
eastmean<-mean(east$observations)
westmean<-mean(west$observations)

regions<-c("north","south","east","west")
means<-c(northmean, southmean, eastmean, westmean)

meansofregions<-data.frame(regions, means)

ggplot(data=meansofregions,
       aes(x=regions, y=means))+
  geom_bar(stat="identity")+
  theme_classic()

ggplot(data=regionvsobservations,
       aes(x=region, y=observations))+
  geom_jitter()
  theme_classic()

# As we can tell from the two plots, they obviously tell different stories about the data as a whole. While the
# bar plot only shows that the means of all four regions are strikingly similar, the scatter plot shows us that
# there is a much greater distribution in the points than the bar plot may lead us to believe
# this is because we can see all of the points with the scatter plot, whereas we can only see the means with the
# bar plot.