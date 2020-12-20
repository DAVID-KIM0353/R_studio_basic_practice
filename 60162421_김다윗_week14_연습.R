expression <- function(n){
  count = 1
  for (i in 1:(n-1)){
    sum = i
    for (j in i+1:n){
      sum = sum + j
      if(sum == n){
        count = count + 1
        break
      }
      else if(sum > n){
        break
      }
    }
  }
  return(count)
}
expression(15)


# RandomForest
install.packages('randomForest')
library(caret)

iris <- read.csv('iris.csv')

inTrain <- createDataPartition(y = iris$Species, p =.6, list = FALSE)
train <- iris[inTrain, ]
test <- iris[-inTrain, ]

fitControl <- trainControl(method = 'repeatedcv', number = 10, repeats = 5)
# rf 실행
customGrid <- expand.grid(mtry = 1:10) # 각 split에서 임의 선택변수 개수
rf.model <- train(Species ~ ., data = train, method = 'rf', trControl = fitControl, tuneGrid = customGrid)
rf.model

predictions <- predict(rf.model, test)
predictions_f <- as.factor(predictions)
test_f <- as.factor(test$Species)

confusionMatrix(predictions_f, test_f)

varImp(rf.model, scale = FALSE)


# GBM
install.packages('gbm')
library(gbm)

wages <- read.csv('wages.csv')

inTrain <- createDataPartition(y = wages$earn, p = .6, list = FALSE)
train <- wages[inTrain, ]
test <- wages[-inTrain, ]

fitControl <- trainControl(method = 'repeatedcv', number = 5, repeats = 3, search = 'random')

#xgboost 실행
gbm.model <- train(earn ~ ., data = train, method = 'gbm', trControl = fitControl, tuneLength = 10, verbose = F)
# tuneLength: 랜덤하게 탐색할 튜닝파라미터 조합개수
# verbose: 자세한 학습결과 표현 여부
gbm.model

predictions <- predict(gbm.model, test)
library(Metrics)
mae(test$earn, predictions)

varImp(gbm.model, scale = TRUE)


# DNN 예제
install.packages('neuralnet')
library(neuralnet)
x1 <- c(20, 10, 30, 20, 80, 30)
x2 <- c(90, 20, 40, 50, 50, 80)
y <- c(1, 0, 0, 0, 1, 1)
df <- data.frame(x1, x2, y)
df

nn <- neuralnet(y ~ x1 + x2, data = df, hidden = c(2, 3), act.fct = 'logistic', linear.output = FALSE)
plot(nn)


x1 <- c(30, 40, 85)
x2 <- c(85, 50, 40)
test <- data.frame(x1, x2)

predict <- compute(nn, test)
prob <- predict$net.result
prediction <- ifelse(prob > 0.5, 1, 0)
prediction
