####R commands for factor analysis and related statistics utilised in Ehret and Taboada (submitted). "Characterising online news comments: A multi-dimensional cruise through online registers".


#load libraries
library(psych)
library(ggplot2)
library(reshape2)
library(dplyr)

##prepare frequency matrix
#read in matrix containing all normalised frequencies per feature as columns
data = read.csv("normalized_postag_counts.csv")

#set file names as rownames
rownames(data) = data$file_names

#remove first column containing non-numerical data
fa.data = data[,-(1)] 

#order features alphabetically
fa.data = fa.data[, order(names(fa.data))]

##test data for suitability
KMO(fa.data)

fa.cor = cor(fa.data)
cortest.bartlett(fa.cor, n=41586) #n = number of files in dataset


##determine number of factors
#eigenvalues and scree plot

#calculate correlation matrix
fa.cor = cor(fa.data)

#calculate eigenvalues based on the correlation matrix
fa.eigen = eigen(fa.cor) #eigenvalues are the sum of squared factor loadings: sum(factorLoadings^2)

ev = fa.eigen$values

#create scree plot of eigenvalues equal or greater than 1.1
factor = c(1:12)
eigenvalue = ev[1:12]

df=data.frame(factor, eigenvalue)

p = ggplot(df, aes(reorder(factor, -eigenvalue), eigenvalue, group=1))
p <- p + geom_bar(stat="identity", fill= rgb(0,0,0.4))
p <- p + geom_line(color = rgb(1,0,0), linetype = "solid")+ geom_point(shape=19, color=rgb(1,0,0)) + xlab("Factor") + ylab("Eigenvalue") +
theme_bw()

p <- p + geom_text(label = round(eigenvalue, 2), vjust=-0.4, hjust = 0)

ggsave("screeplot_eigenvalues.pdf", dpi=300, units="mm", width=180)

ggsave("screeplot_eigenvalues.jpg", dpi=300, units="mm", width=180)


#calculate percentage of variance explained
cumsum(ev) #calculate cumulative sum of eigenvalues

#calculate proportion of variance explained by each factor
var = ev/sum(ev)*100

#calculate cumulative proportion of variance explained in percent
cumVar = cumsum(ev)/sum(ev)*100

dimension =  c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")

variance = var[1:12]

df = data.frame(dimension, variance)

#plot
p =  ggplot(df, aes(reorder(dimension, -variance), variance, group=1))

p <- p + geom_bar(stat="identity", fill= rgb(0,0,0.4))

p <- p + geom_line(color = rgb(1,0,0), linetype = "solid")+ geom_point(shape=19,
color=rgb(1,0,0)) + xlab("Factors") + ylab("Percentage of variance explained") +
theme_bw()

p <- p + geom_text(label = round(variance, 1), vjust=-0.4, hjust = 0)


##factor analysis 
#step-wise adding factors
fa1 = factanal(x = fa.data, factors = 1, rotation = "promax", method="mle")

fa2 = factanal(x = fa.data, factors = 2, rotation = "promax", method="mle")

fa3 = factanal(x = fa.data, factors = 3, rotation = "promax", method="mle")


#create data frame with loadings
loads = round(fa3$loadings, 3)
 
loadings = as.data.frame(unclass(loads))

#calculate and extract factor scores
fa3 = factanal(x = fa.data, factors = 3, rotation = "promax", method="mle",
scores="regression")

factorScores = as.data.frame(fa3$scores)

#add register information
registers = read.csv("texts_by_register.csv")
factorScores$register = registers$register


#calculate mean factor scores for each register 
#take column means
byRegister = factorScores %>% group_by(register) %>% summarise_if(is.numeric, mean, na.rm =T)

#calculate standard deviation for mean factor scores
sd_meanfactorScores = factorScores %>% group_by(register) %>%
summarise_if(is.numeric, funs(mean = mean(., na.rm=T), sd = sd(., na.rm=T)))



