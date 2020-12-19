library(caret)
library(datasets)

heptathlon <- read.csv('heptathlon.csv')
View(heptathlon)
x_data <- heptathlon[ , 2:8]
y_data <- heptathlon[ , 9]
pc <- princomp(x_data, cor = T)
summary(pc)
pc$scores[ , 1:3] # 새롭게 만들어진 주성분 값
pc$loadings
model <- lm(y_data ~ pc$scores)
summary(model)

library(class)
iris <- read.csv('iris.csv')
View(iris)
train_index <- createDataPartition(y = iris$Species, p = .6, list = FALSE)
train <- iris[train_index, ]
test <- iris[-train_index, ]
ctrl <- trainControl(method = 'repeatedcv', number = 10, repeats = 5)

knn_model <- train(Species ~ ., data = train, method = 'knn', trControl = ctrl, preProcess = c('center', 'scale'))
predictions <- predict(knn_model, test)
library(Metrics)
predictions
test$Species
# identical(levels(predictions),levels(test$Species))
# length(predictions)
# length(test$Species)
f_predicted <- as.factor(predictions)
f_test<- as.factor(test$Species)

confusionMatrix(f_predicted, f_test) # factor로 변환 후에 적용해야함
accuracy(test$Species, predictions)

# CART
library(rpart)
tree.model <- train(Species ~ ., data = train, method = 'rpart', trControl = ctrl, preProcess =  c('center', 'scale'))
tree.model
plot(tree.model)
tree.model$bestTune

tree_predictions <- predict(tree.model, test)
f_predictions <- as.factor(tree_predictions)
f_test <- as.factor(test$Species)
confusionMatrix(f_predictions, f_test)

library(rattle)
fancyRpartPlot(tree.model$finalModel)

## cart_wages
wages <- read.csv('wages.csv')
View(wages)
train_index <- createDataPartition(y = wages$earn, p = .6, list = FALSE)
train <- wages[train_index, ]
test <- wages[-train_index, ]
ctrl <- trainControl(method = 'repeatedcv', number = 10, repeats = 5)

regtree.model <- train(earn ~ ., data = train, method = 'rpart', trControl = ctrl)
regtree.model
plot(regtree.model)
regtree.model$bestTune

library(Metrics)
reg_predictions <- predict(regtree.model, test)
rmse(test$earn, predictions)
mae(test$earn, predictions)
plot(regtree.model$finalModel)
text(regtree.model$finalModel)

library(rattle)
fancyRpartPlot(regtree.model$finalModel)

# logistic
michelin <- read.csv('michelin.csv')
View(michelin)
michelin$InMichelin <- factor(michelin$InMichelin)
michelin <- subset(michelin, select=-Restaurant.Name)
View(michelin)

library(caret)
train_index <- createDataPartition(y = michelin$InMichelin, p = .6, list = FALSE)
train <- michelin[train_index, ]
test <- michelin[-train_index, ]
cv <- trainControl(method = 'repeatedcv', number = 10, repeats = 5)

# family = 분포 -> 종속변수를 분포에 맞게 한다.
### na.action=na.exclude
# na.action에 na.exclude를 지정하면 NA를 제외하고 모델을 만들지만, 잔차(residual)를 구할 때 NA가 포함된 행은 잔차를 NA로 해서 추가한다. 따라서 log.model( )의 결과의 길이와 원래 데이터의 길이가 같다.
###
log.model <- train(InMichelin ~ ., data = train, method = 'glm', family = 'binomial', na.action=na.exclude,trControl = cv, preProcess = c('center', 'scale'))
summary(log.model)
log.model

predictions <- predict(log.model, test, type = 'raw')
confusionMatrix(test$InMichelin, predictions, positive = '1')

predicted_prob <- predict(log.model, type = 'prob')
predicted_prob

## 로지스틱 실습
testdata <- data.frame(Food = 18, Decor = 17, Service = 15, Price = 40)
class(testdata)
predict(log.model, type = 'raw', newdata = testdata) # 수록되지 않았다.
predict(log.model, type = 'prob', newdata = testdata)
