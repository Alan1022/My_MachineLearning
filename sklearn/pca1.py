import numpy as np

def pca(X,k):#前k个值
  #每个特征的平均值
  n_samples, n_features = X.shape
  mean=np.array([np.mean(X[:,i]) for i in range(n_features)])

  #正规化
  norm_X=X-mean

  #散射矩阵
  # transpose矩阵的转置
  scatter_matrix=np.dot(np.transpose(norm_X),norm_X) 

  #计算特征向量和特征值
  eig_val, eig_vec = np.linalg.eig(scatter_matrix)
  eig_pairs = [(np.abs(eig_val[i]), eig_vec[:,i]) for i in range(n_features)]

  # 排序eig_vec基于eig_val从最高到最低
  eig_pairs.sort(reverse=True)

  # 选择前k个特征向量
  feature=np.array([ele[1] for ele in eig_pairs[:k]])

  #获取新数据
  data=np.dot(norm_X,np.transpose(feature))
  return data

X = np.array([[-1, 1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2]])
print (pca(X,1))

# sklearn库实现pca代码：
from sklearn.decomposition import PCA
pca=PCA(n_components=1)
pca.fit(X)
print (pca.transform(X))

