

import cv2
size = 4
webcam = cv2.VideoCapture(0) #Use camera 0
(rval, im) = webcam.read()
# We load the xml file
classifier = cv2.CascadeClassifier('/home/pi/Desktop/Project/face_detection-recognition-Raspberry_pi/haarcascade_frontalface_alt.xml')

#Load a cascade file for detecting faces#Convert to grayscale
gray = cv2.cvtColor(im,cv2.COLOR_BGR2GRAY)

#Look for faces in the image using the loaded cascade file
faces = classifier.detectMultiScale(gray, 1.1, 5)

print "Found "

#Draw a rectangle around every found face
for (x,y,w,h) in faces:
    cv2.rectangle(im,(x,y),(x+w,y+h),(255,255,0),2)

#Save the result image
cv2.imwrite('result.jpg',im)
