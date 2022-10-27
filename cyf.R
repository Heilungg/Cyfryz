install.packages("caret")
install.packages("mlbranch")
install.packages("pls")
library("pls")
library("mlbench")
library("caret")

data(Sonar)
#baza tutoriala
set.seed(123)

inTrain <- createDataPartition(
  y = Sonar$Class,
  p = .75,
  list = FALSE
)

str(inTrain)

training <- Sonar[ inTrain,]
testing  <- Sonar[-inTrain,]

#ctrl
ctrl <- trainControl(
  method = "repeatedcv", 
  repeats = 3,
  classProbs = TRUE, 
  summaryFunction = twoClassSummary
)

#ROC stat
plsFit <- train(
  Class ~ .,
  data = training,
  method = "pls",
  preProc = c("center", "scale"),
  tuneLength = 15,
  trControl = ctrl,
  metric = "ROC"
)

plsFit

ggplot(plsFit)

#confusin matrix
plsClasses <- predict(plsFit, newdata = testing)
confusionMatrix(data = plsClasses, testing$Class)
