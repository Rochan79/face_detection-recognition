import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn import svm
import csv
import cv2

#code to import data in list type
datafile = open('ss.csv', 'r')
data_d= csv.reader(datafile, delimiter='\t')
data = []
for row in data_d:
    data.append(row)    
faces=data
print(len(faces))
#Job remaining. To define a numpy array of images. And to initialize arrays for input and outputs
x=[]
y=[]
#assigning input and output

for i in range(0,len(faces)):
    x[i]=cv2.imread(faces[i][0])
    for j in range(1,8):
        y[i][j]=faces[i][j]
#y=faces[]
#make classifier
clf=svm.SVC(gamma=0.001,C=100)

#fit data in classifier
clf.fit(x,y)
#print('face at:',clt.predict(#some x input))
