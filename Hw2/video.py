import cv2


def canny_webcam():
    "Live capture frames from webcam and show the canny edge image of the captured frames."

    cap = cv2.VideoCapture(0)

    while True:
        # ret gets a boolean value. True if reading is successful (I think). frame is an
        ret, frame = cap.read()
        # uint8 numpy.ndarray

        frame = cv2.GaussianBlur(frame, (7, 7), 1.41)
        frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        edge = cv2.Canny(frame, 25, 75)

        cv2.imshow('Canny Edge', edge)

        # Introduce 20 milisecond delay. press q to exit.
        if cv2.waitKey(20) == ord('q'):
            break


canny_webcam()
