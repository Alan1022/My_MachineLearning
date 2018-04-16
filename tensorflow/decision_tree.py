# -*- coding: utf-8 -*-
  
from math import log  
  
import operator  
import  treePlotter 
  
def calcShannonEnt(dataSet):  
    numEntries=len(dataSet)  
    labelCounts={}  
    for featVec in dataSet:  
        currentLabel=featVec[-1]  
        #计算feature值的频数，为所有可能的类创建字典  
        if currentLabel not in labelCounts.keys():  
            labelCounts[currentLabel]=0  
        labelCounts[currentLabel]+=1  
    shannonEnt=0.0  
    #计算Shannon entropy  
    for key in labelCounts:  
        prob=float(labelCounts[key])/numEntries  
        shannonEnt-=prob*log(prob,2)  
    return shannonEnt  
      
def createDataSet():    
    #dataSet=pd.read_csv(datafile)  
   # label=[]  
    dataSet=[[1,1,'yes'],[1,1,'yes'],[1,0,'no'],[0,1,'no'],[0,1,'no']]  
    labels=['no surfacing','flippers']  
    return dataSet, labels  
  
def splitDataSet(dataSet, axis, value):  
    retDataSet=[]  
    for featVec in dataSet:  
        if featVec[axis]==value:  
            reducedFeatVec=featVec[:axis]  
            reducedFeatVec.extend(featVec[axis+1:])  
            retDataSet.append(reducedFeatVec)  
    return retDataSet  
  
def chooseBestFeatureToSplit(dataSet):  
    numFeatures=len(dataSet[0])-1  
    baseEntropy=calcShannonEnt(dataSet)  
    bestInfoGain=0.0; bestFeature=-1;  
    for i in range(numFeatures):  
        featList=[example[i] for example in dataSet]  
        uniqueVals=set(featList)  
        newEntropy=0.0  
        #计算每一种划分方式的信息熵  
        for value in uniqueVals:  
            subDataSet=splitDataSet(dataSet,i,value)  
            prob=len(subDataSet)/float(len(dataSet))  
            newEntropy+=prob*calcShannonEnt(subDataSet)  
        #信息增益熵  
        infoGain=baseEntropy - newEntropy  
        #最好信息增益  
        if(infoGain>bestInfoGain):  
            bestInfoGain=infoGain  
            bestFeature=i  
    return bestFeature  
      
  
def majorityCnt(classList):  
    classCount={}  
    for vote in classList:  
        if vote not in classCount.keys(): classCount[vote]=0  
        classCount[vote]+=1  
    sortedClassCount=sorted(classCount.iteritems(),key=operator.itemgetter(1), reverse=True)  
    return sortedClassCount[0][0]  
      
def createTree(dataSet,labels):  
    classList=[example[-1] for example in dataSet]  
    if classList.count(classList[0])==len(classList):  
        return classList[0]  
    if len(dataSet[0])==1:  
        return majorityCnt(classList)  
    bestFeat=chooseBestFeatureToSplit(dataSet)  
    bestFeatLabel=labels[bestFeat]  
    myTree={bestFeatLabel:{}}  
    del (labels[bestFeat])  
    featValues=[example[bestFeat] for example in dataSet]  
    uniqueVals=set(featValues)  
    for value in uniqueVals:  
        subLabels=labels[:]  
        myTree[bestFeatLabel][value]=createTree(splitDataSet(dataSet,bestFeat,value),subLabels)  
    return myTree  
      
if __name__=='__main__':  
      
    myDat, labels=createDataSet()  
    myTree=createTree(myDat,labels)  
    treePlotter.createPlot(myTree)  


