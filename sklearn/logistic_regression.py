#!/Users/alan/anaconda/envs/tensorflow/bin/python
# coding:utf-8
# =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  = 
#
#des:逻辑回归模型
#
# =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  = 

import numpy as np
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data

# 初始化权重w
def init_weights(shape):
    return tf.Variable(tf.random_normal(shape, stddev = 0.01))

# 定义模型
def model(X, w):
    return tf.matmul(X, w)

# 获取mnist 数据
mnist  =  input_data.read_data_sets("./mnist_data/", one_hot = True)
trX, trY, teX, teY  =  mnist.train.images, mnist.train.labels, mnist.test.images, mnist.test.labels

# 定义占位符变量
X  =  tf.placeholder("float", [None, 784])
Y  =  tf.placeholder("float", [None, 10])
w  =  init_weights([784, 10])
b  =  tf.Variable(tf.zeros([10,]))
y  =  tf.add(tf.matmul(X, w), b)

# 定义损失函数，交叉熵损失函数
loss  =  tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y, Y))

# 训练操作，最小化损失函数
train_op  =  tf.train.GradientDescentOptimizer(0.05).minimize(loss)

# 预测操作，
predict_op  =  tf.argmax(y, 1)

# 定义会话
sess  =  tf.Session()
init  =  tf.global_variables_initializer()
sess.run(init)

# 调用多次梯度下降
for i in range(101):
    if i % 5  =  =  0:
        # 训练，每个batch，
        for start, end in zip(range(0, len(trX), 128), range(128, len(trX), 128)):
            sess.run(train_op, feed_dict = {X: trX[start:end], Y: trY[start:end]})
        # 测试，每个epoch，将True 1、 False 0 求平均，取正确率
        print ("step: %d" % i,"prediction:%f" % np.mean(np.argmax(teY, axis = 1)  =  =  sess.run(predict_op, feed_dict = {X: teX, Y: teY})))

sess.close()



