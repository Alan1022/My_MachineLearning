import numpy as np
from numpy import genfromtxt
from sklearn.preprocessing import OneHotEncoder

# load_data  =  r"/Users/alan/tensorflow/reg_ball_data.csv"

# data  =  genfromtxt(load_data,delimiter = ',')

#split reg ball num and blue ball num
# train_x  =  data[:,:-1]
#train_y  =  data[:,-1]

# normal num
x  =  np.arange(1,34)
y  =  np.arange(1,17)
print (x,y)

# #transform code
# enc  =  OneHotEncoder()
# enc.fit(train_x)
# #enc.fit(y)

# enc_x  =  enc.transform(train_x).toarray()
# #enc_y  =  enc.transform(y).toarray()

# print ("red ball:\n",enc_x)
# #print ("blue ball:\n",enc_y)

