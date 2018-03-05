from numpy import genfromtxt
import numpy as np
from sklearn import datasets, linear_model

dataPath  =  r"/Users/alan/tensorflow/test.csv"
deliveryData  =  genfromtxt(dataPath, delimiter = ',')  #将文件的数据变成array的形式

print ("data")
print (deliveryData)

X  =  deliveryData[:, :-1]
Y  =  deliveryData[:, -1]

print (X)
print (Y)

regr  =  linear_model.LinearRegression()

regr.fit(X, Y)

print ("coefficients")
print (regr.coef_)  #系数：b1 b2 b3 b4 ......
print ("intercept: ")
print (regr.intercept_)   #截距：b0

xPred  =  [102, 6]
yPred  =  regr.predict(xPred)
print ("predicted y: ")
print (yPred)
