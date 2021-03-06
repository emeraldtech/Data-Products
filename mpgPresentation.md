Fuel Consumption Prediction Application
========================================================
transition: concave
author: James Quinn
date: October 25, 2015
width: 1920
height: 1080
autosize: true
### Context and Questions:
You work for Motor Trend, a magazine about the automobile industry. Looking at a data set of a collection of cars, they are interested in exploring the relationship between a set of variables and miles per gallon (MPG). They are particularly interested in the following two questions: 
#### 1. Is an automatic or manual transmission better for MPG?
#### 2. How can you quantify the MPG difference between automatic and manual transmissions?


Cleaning and Exploring Data
========================================================
transition: concave
#### 1. Load the data and transform appropriate numeric variables to factors:

```r
library(datasets); data(mtcars); mtcars$am <- as.factor(mtcars$am); 
mtcars$cyl <- as.factor(mtcars$cyl)
# Set level lables for $am variable factor.
levels(mtcars$am) <- c("Automatic","Manual")
```
#### 2. Visulize Relationship of Transmission Type and MPG
![plot of chunk unnamed-chunk-2](mpgPresentation-figure/unnamed-chunk-2-1.png) 

#### Analysis: Considering only Transmission Type on MPG; cars with Manual Transmissions appear to have a higher MPG than cars with Automatic Transmissions. Next check Pair-Wise comparison of all variables.

Exploring Data Continued
===================
#### 3. Visulize Pair-Wise Comparison of All Variables

```r
pairs(~ ., mtcars)
```

![plot of chunk unnamed-chunk-3](mpgPresentation-figure/unnamed-chunk-3-1.png) 

###### Pair-wise comparison of all variables indicates that there are variables other than Transmission Type that have association with MPG.

Model Selection
===========================
### Choose a model by using An Information Criterion (AIC) in a Stepwise Algorithm

```r
lmAll <- lm(mpg ~ ., data = mtcars)
lmBest <- step(lmAll, direction = "both", trace = 0)
#lmBest$call: provides the model -> lm(formula = mpg ~ wt + qsec + am, data = mtcars)
#lmBest$coefficients: provides the model intercept and coeficients. 
```

### Resulting Prediction Model: 

##### mpg = 9.6178 + (-3.9165 * wt) + (1.2259 * qsec) + (2.9358 * am)

#### Prediction Model Variable Descriptions:
- wt - Weight (lbs/1000)
- qsec - Quarter Mile Time (seconds)
- am - Transmission Type (0 = Manual, 1 = Automatic)

### Residual Analysis
##### The following and last slide provides Residual Analysis Visualization. 



Model Residual Analysis
========================================================
#autosize: true
width: 1920
height: 1080
<img src="mpgPresentation-figure/myplot-1.png" title="plot of chunk myplot" alt="plot of chunk myplot" width="1920px" />



