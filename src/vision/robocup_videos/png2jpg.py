import cv2
count = 3271

while count < 3844:
    png_img = cv2.imread('paulo/Paulo/ball_0' + str(count))
    cv2.imwrite ('paulo/ball_0' + str(count) + '.jpg', png_img, [int(cv2.IMWRITE_JPEG_QUALITY), 100])
    count = count + 1