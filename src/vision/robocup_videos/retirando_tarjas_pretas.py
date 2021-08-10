import cv2
import numpy as np
import os

# Create a VideoCapture object and read from input file
# If the input is the camera, pass 0 instead of the video file name


nomePasta = 'film2'
cap = cv2.VideoCapture('videos editados 2021/film 2/Film 2 cortado.mp4')

# Check if camera opened successfully
if (cap.isOpened()== False): 
  print("Error opening video stream or file")

currentFrame = 0
# Read until video is completed
while(cap.isOpened()):
  # Capture frame-by-frame
  ret, frame = cap.read()
  if ret == True:

    # Display the resulting frame
    frame = frame[0:479, 80:559] #COMENTAR ESSA LINHA SE NÃO HOUVEREM BARRAS PRETAS
    final_frame = cv2.resize(frame,(416, 416))
    #cv2.imshow('Frame',final_frame)

    fator = 20
    if (currentFrame%fator == 0):
        cv2.imwrite(nomePasta+'/frame'+str(int(currentFrame/fator))+'.jpg',final_frame)
    
    currentFrame += 1

    # Press Q on keyboard to  exit
    if cv2.waitKey(25) & 0xFF == ord('q'):
      break

  # Break the loop
  else: 
    break

# When everything done, release the video capture object
cap.release()

# Closes all the frames
cv2.destroyAllWindows()