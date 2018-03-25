
import sys
import dlib
from skimage import io
import cv2
# Take the image file name from the command line

# Create a HOG face detector using the built-in dlib class
face_detector = dlib.get_frontal_face_detector()
image=cv2.imread('image.jpg')


# Run the HOG face detector on the image data.
# The result will be the bounding boxes of the faces in our image.
detected_faces = face_detector(image, 1)

print("I found {} faces in the file {}".format(len(detected_faces), image))

# Open a window on the desktop showing the image


# Loop through each face we found in the image
for i, face_rect in enumerate(detected_faces):

	# Detected faces are returned as an object with the coordinates 
	# of the top, left, right and bottom edges
	print("- Face #{} found at Left: {} Top: {} Right: {} Bottom: {}".format(i, face_rect.left(), face_rect.top(), face_rect.right(), face_rect.bottom()))
	l=face_rect.left()
	t=face_rect.top()
	r=face_rect.right()
	b=face_rect.bottom()

	# Draw a box around each face we found
	cv2.rectangle(image,(t,l),(b,r),(0,255,0),2)
	#win.add_overlay(face_rect)
	        
cv2.imshow('image',image)
cv2.waitKey(0)
# Wait until the user hits <enter> to close the window
dlib.hit_enter_to_continue()
cv2.destroyAllWindows()
