#!/usr/bin/python
#--*-- coding = utf-8 --*--
##############数据预处理#########################
import pandas as pd
import numpy as np
from sklearn.feature_selection import SelectKBest, f_classif
import matplotlib.pyplot as plt
#导入逻辑回归模型
# from sklearn.linear_model import LogisticRegression
# from sklearn.ensemble import RandomForestClassifier
# from sklearn.model_selection import cross_val_score
#引入交叉验证的包
# from sklearn.cross_validation import KFold 
# 因为0.18版本，不推荐使用：该模块将在0.20被删除。使用sklearn.model_selection.KFold来代替
# from sklearn.model_selection import KFold
# from sklearn import model_selection

titanic  =  pd.read_csv('titanic_train.csv')
# print (titanic.head(10)) #显示前10行数据看看
# print (titanic.describe())  #查看每一列数据的特征：计数、平均值、方差、最小值、25%、50%、75%、最大值

# age列数据缺失了，需要补全（填充）：缺失值用中位数来填充
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

#创建随机森林模型
# n_estimators决策树个数，min_samples_split，min_samples_leaf决策树停止条件
# mode  =  RandomForestClassifier(random_state = 1, n_estimators = 10, min_samples_split = 2, min_samples_leaf = 1)
# 0.792368125701

#添加特征向量
# 家庭人数
titanic["FamilySize"]  =  titanic["SibSp"] + titanic["Parch"]
# 名字长度
titanic["NameLength"]  =  titanic["Name"].apply(lambda x: len(x))

# 身份信息
import re
def get_title(name):
    # Use a regular expression to search for a title.  Titles always consist of capital and lowercase letters, and end with a period.\n",
    title_search  =  re.search(' ([A-Za-z]+)\\.', name)
    # If the title exists, extract and return it.\n",
    if title_search:
        return title_search.group(1)
    return ""

# Get all the titles and print how often each one occurs
titles  =  titanic["Name"].apply(get_title)
print(pd.value_counts(titles))

# Map each title to an integer.  Some titles are very rare, and are compressed into the same codes as other titles
title_mapping  =  {"Mr": 1, "Miss": 2, "Mrs": 3, "Master": 4, "Dr": 5, "Rev": 6, "Major": 7, "Col": 7, "Mlle": 8, "Mme": 8, "Don": 9, "Lady": 10, "Countess": 10, "Jonkheer": 10, "Sir": 9, "Capt": 7, "Ms": 2}
for k,v in title_mapping.items():
    titles[titles  =  =  k]  =  v

    # Verify that we converted everything
    # print(pd.value_counts(titles))
 
    # Add in the title column
    titanic["Title"]  =  titles

# 创建模型：
#特征变量选取：船舱等级、性别、年龄、兄弟姐妹、父母孩子、船票价格、登船地点、家庭成员、职称、名字长度
predictors  =  ["Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Embarked", "FamilySize", "Title", "NameLength"]
print ("特征向量：\n",predictors)

# 执行特征选择
selector  =  SelectKBest(f_classif, k = 6)
selector.fit(titanic[predictors], titanic["Survived"])

# 获取每个要素的原始p值，并从p值转换为分数
scores  =  -np.log10(selector.pvalues_)
print (selector.pvalues_)
print (scores)
# 绘制分数。看看“Pclass”，“Sex”，“Title”和“Fare”哪个是最好的
plt.bar(range(len(predictors)), scores)
plt.xticks(range(len(predictors)), predictors, rotation = 'vertical')
plt.show()
