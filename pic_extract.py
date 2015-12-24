import numpy as np
import cv2

file_list = open('movie_info.txt','r')

for line in file_list:
    full_name = line.strip().split('.')
    videoname = '_'.join(full_name)
    vfile = './video/'+line
    cap = cv2.VideoCapture(vfile.strip())
    framecount = cap.get(7)
    i = 0
    while i < framecount:
        ret, frame = cap.read()
        i = i + 1
        if (type(frame) == type(None)):
            break
        if ret == True:
            if i%20 == 0:
                cv2.imwrite('./demo_picture/'+ videoname + '_' + str(i)+'.jpg', frame)
            if (0xFF & cv2.waitKey(5) == 27) or frame.size == 0:
                break
        else:
            break
    cap.release()
    cv2.destroyAllWindows()
