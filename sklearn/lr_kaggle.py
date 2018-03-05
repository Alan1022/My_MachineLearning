#!/usr/bin/python
#--*-- coding = utf-8 --*--
##############数据预处理#########################
import pandas as pd
#导入逻辑回归模型
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import cross_val_score
#引入交叉验证的包
# from sklearn.cross_validation import KFold 
# 因为0.18版本，不推荐使用：该模块将在0.20被删除。使用sklearn.model_selection.KFold来代替
# from sklearn.model_selection import KFold
# from sklearn import model_selection
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
mode  =  LogisticRegression(random_state = 1)
# 计算所有交叉验证折叠的准确性分数。 （比我们之前做的简单得多！）
# sklearn.model_selection.cross_val_score(estimator, X, y = None, groups = None, scoring = None, cv = None, n_jobs = 1, verbose = 0, fit_params = None, pre_dispatch = '2*n_jobs')
# 交叉验证的每次运行的估计量的分数的数组
scores  =  cross_val_score(mode, titanic[predictors], titanic["Survived"], cv = 3)
print (scores)
# 取得分数的平均值（因为每个折叠都有一个）
print(scores.mean())

