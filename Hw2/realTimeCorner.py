import cv2
import numpy as np

cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()
    grayFrame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    corners = cv2.goodFeaturesToTrack(grayFrame, 4, 0.01, 10)
    corners = np.int0(corners)
    for corner in corners:
        x, y = corner.ravel()
        cv2.circle(frame, (x, y), 7, (180, 105, 255), -1)

    cv2.imshow("Video", frame)
    if cv2.waitKey(1) == ord('e'):
        break

cap.release()
cv2.destroyAllWindows()
