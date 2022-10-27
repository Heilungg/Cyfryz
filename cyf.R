install.packages("caret")
install.packages("mlbranch")
install.packages("pls")
library("pls")
library("mlbench")
library("caret")

data(Sonar)

set.seed(107)

inTrain <- createDataPartition(
  y = Sonar$Class,
  p = .75,
  list = FALSE
)

str(inTrain)

training <- Sonar[ inTrain,]
testing  <- Sonar[-inTrain,]

plsFit <- train(
  Class ~ .,
  data = training,
  method = "pls",
  preProc = c("center", "scale")
)


