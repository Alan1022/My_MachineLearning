#!/usr/bin/python
#--*-- coding = utf-8 --*--
##############数据预处理#########################
import pandas as pd
from sklearn.linear_model import LinearRegression
#引入交叉验证的包
# from sklearn.cross_validation import KFold 
# 因为0.18版本，不推荐使用：该模块将在0.20被删除。使用sklearn.model_selection.KFold来代替
from sklearn.model_selection import KFold
import numpy as np

titanic  =  pd.read_csv('titanic_train.csv')
# print (titanic.head(10)) #显示前10行数据看看
# print (titanic.describe())  #查看每一列数据的特征：计数、平均值、方差、最小值、25%、50%、75%、最大值

# age列数据缺失了，需要补全（填充）：缺失值用平均值来填充
titanic['Age']  =  titanic['Age'].fillna(titanic['Age'].median())
# 再次查看下每列的特征：
# print (titanic.describe())
# print (titanic['Age'])

# 数据转换：
# 查看性别数据一共有几种（不重复的）：
# print (titanic['Sex'].unique())
# 为了处理数据方便，将性别改为int ：男：1 女：0
# titanic['Sex']  =   titanic.loc[titanic['Sex']  =  =  'male','Sex']  =  1
# titanic['Sex']  =   titanic.loc[titanic['Sex']  =  =  'famale','Sex']  =  0

titanic['Sex']  =  titanic['Sex'].replace(['male','female'],[1,0])
# print (titanic['Sex'])
print (titanic['Sex'].unique())

# 登船地点：S 、C  、Q
# print (titanic['Embarked'].unique())
# 填充：
# 哪个地点多就用哪个填充：
titanic['Embarked']  =  titanic['Embarked'].fillna('S')
# 转换：
# titanic.loc[titanic['Embarked']  =  =  'S','Embarked']  =  0
# titanic.loc[titanic['Embarked']  =  =  'C','Embarked']  =  1
# titanic.loc[titanic['Embarked']  =  =  'Q','Embarked']  =  2
# 替换方法：
# 第一种：重新赋值
# titanic['Embarked']  =  titanic['Embarked'].replace(['S','C','Q'],[0,1,2]）
# 第二种：加上参数inplace = True,默认是False,就可以实现替换原数据
titanic['Embarked'].replace(['S','C','Q'],[0,1,2],inplace = True)
print (titanic['Embarked'].unique())

# 创建模型：
#特征变量选取：船舱等级、性别、年龄、兄弟姐妹、父母孩子、船票价格、登船地点
predictors  =  ["Pclass","Sex","Age","SibSp","Parch","Fare","Embarked"]
#创建线性回归模型
mode  =  LinearRegression()
#交叉验证：shape()返回（m,n）m行n列，取m个特征向量;n_folds = 3把样本平均分成3份做交叉验证
# kf  =  KFold(titanic.shape[0],n_folds = 3,random_state = 3)
#0.18版本以后变更为如下使用方式：
#http://scikit-learn.org/stable/modules/generated/sklearn.model_selection.KFold.html
#sklearn.model_selection.KFold
kf  =  KFold(n_splits = 3)

#初始化预测值
predictions  =  []

# train，test是数据的index,3次循环读取三份不同的分类样本数据
for train,test in kf.split(titanic):
	# print ("train:\n",train,"\ntest:\n",test,"\n")
	# 训练数据特征样本
	train_predictors  =  (titanic[predictors].iloc[train,:])
	# print ("train_predictors:\n",train_predictors)
	#Survived是否获救，classlabel类别
	train_target  =  titanic["Survived"].iloc[train]
	# print ("train_target:\n",train_target)
	mode.fit(train_predictors,train_target)
	test_prediction  =  mode.predict(titanic[predictors].iloc[test,:])
	predictions.append(test_prediction)
	print ("predictions:\n",predictions)
	# print (titanic["Survived"].iloc[test])

# 预测在三个独立的numpy数组中。将它们连接成一个
# 我们将它们连接在轴0上，因为它们只有一个轴
predictions  =  np.concatenate(predictions, axis = 0)
print (predictions)
predictions[predictions > =  0.5]  =  1
predictions[predictions <  0.5]  =  0
accuracy  =  sum(predictions[predictions  =  =  titanic["Survived"]]) / len(predictions)
print ("准确率为：\n",accuracy)
#0.783389450056

