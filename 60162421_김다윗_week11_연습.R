crime <- read.csv('crime.csv')
View(crime)
model <- lm(tc2009 ~ low, data = crime)
summary(model)
predict(model)

library(caret)
library(datasets)
data(mtcars)
set.seed(100)

View(mtcars)
train_index <- createDataPartition(y = mtcars$mpg, p = .75, list = FALSE)
training <- mtcars[train_index, ]
testing <- mtcars[-train_index, ]
basic_model_lm <- train(mpg ~ ., data = training, method = 'lm', preProc = c('center', 'scale'))
summary(basic_model_lm)
# ------ training

ctrl <- trainControl(method = 'repeatedcv', number = 10, repeats = 3)
ext_model_lm <- train(mpg ~ ., data = training, method = 'lm', trControl = ctrl, metric = 'Rsquared')
summary(ext_model_lm)
print(ext_model_lm)
varImp(ext_model_lm)

y_hat <- predict(ext_model_lm, newdata = testing)
mean((y_hat - testing$mpg)^2)

View(wages)
model2 <- lm(earn ~ race, data = wages)
coef(model2)
model4 <- lm(earn ~ height)

summary(lm(earn ~ (height +sex + race)^3, data = wages))
model6 <- lm(earn ~ height + age + height:age, data = wages)
predict(model6)

full.model <- lm(earn ~ ., data = wages)
backward.model <- step(full.model, direction = 'backward')
formula(backward.model)
install.packages('leaps')
library(leaps)
compare.models <- regsubsets(earn ~ ., data = wages)
summary(compare.models)
summary(compare.models)$adjr2
install.packages('Metrics')
train_index <- createDataPartition(y = wages$earn, p = .6, list = FALSE)
train_data <- wages[train_index, ]
test_data <- wages[-train_index, ]
model7 <- lm(earn ~ ., data = train_data)
yhat_test <- predict(model7, newdata = test_data)
library(Metrics)
mape(test_data$earn, yhat_test)

insurance <- read.csv('insurance.csv')

train_index <- createDataPartition(y = wages$earn, p = .6, list)