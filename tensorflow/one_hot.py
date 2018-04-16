import numpy as np
from sklearn.preprocessing import OneHotEncoder

enc  =  OneHotEncoder()
array = [[0, 0, 3], [1, 1, 0], [0, 2, 1],[1, 0, 2]]
enc.fit(array)

print ("arrar:",array)
print ("enc.n_values_ is:",enc.n_values_)  #特征维度，第一列有两个特征2，第二列3，第三列4：enc.n_values_ is: [2 3 4]
print ("enc.feature_indices_ is:",enc.feature_indices_)
print (enc.transform([[0, 1, 1]]).toarray())  #one-hot编码转化
print ("array one hot code:\n",enc.transform(array).toarray())