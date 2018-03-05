import numpy as np

x = np.array([2.5,0.5,2.2,1.9,3.1,2.3,2,1,1.5,1.1])
y = np.array([2.4,0.7,2.9,2.2,3,2.7,1.6,1.1,1.6,0.9])

# Step 1: 求平均值以及做normalization
mean_x = np.mean(x)
mean_y = np.mean(y)
scaled_x = x - mean_x
scaled_y = y - mean_y
data = np.matrix([[scaled_x[i],scaled_y[i]] for i in range(len(scaled_x))])
print ("scaled_x:\n",scaled_x)
print ("scaled_y:\n",scaled_y)
print ("data:\n",data)

# Step 2: 求协方差矩阵(Covariance Matrix)
cov=np.cov(scaled_x,scaled_y)
print ("求协方差矩阵:\n",cov)

# 或者散度矩阵
# np.dot(np.transpose(data),data)

# Step 3: 求协方差矩阵的特征值和特征向量
eig_val, eig_vec = np.linalg.eig(cov)
print ("特征根:\n",eig_val)
print ("特征向量:\n",eig_vec)

# Step 4: 选择主要成分
# 得到特征值和特征向量之后，我们可以根据特征值的大小，从大到小的选择K个特征值对应的特征向量
eig_pairs = [(np.abs(eig_val[i]), eig_vec[:,i]) for i in range(len(eig_val))]
eig_pairs.sort(reverse=True)
print ("选择主要成分:\n",eig_pairs)

# 从eig_pairs选取前k个特征向量就行。这里，我们只有两个特征向量，选一个最大的
feature=eig_pairs[0][1]
print ("最大的:\n",feature)

# Step 5: 转化得到降维的数据
# 主要将原来的数据乘以经过筛选的特征向量组成的特征矩阵之后，就可以得到新的数据了
new_data_reduced=np.transpose(np.dot(feature,np.transpose(data)))
print ("转化得到降维的数据:\n",new_data_reduced)



