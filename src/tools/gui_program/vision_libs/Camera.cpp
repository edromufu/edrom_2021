#include "Camera.hpp"

//Constructors
Camera::Camera()
{
}

void Camera::start()
{
    camera.release();
    CAMERA = 1;
    int num = 0;
    while(!camera.isOpened())
    {
        num++;
        camera.open(CAMERA);
        CAMERA++;
        if(CAMERA == 0)
        {
            std::cout << "\nErro ao abrir camera\n";
            break;
        }
        if(num == 9)
            CAMERA = 0;
    }
    system("clear");
}

void Camera::start(std::string path)
{
    camera.release();
    camera.open(path);
}

void Camera::saveImage(std::string path, cv::Mat frame)
{
    cv::imwrite(path, frame);
}

cv::Mat Camera::loadImage(std::string path)
{
    return cv::imread(path, CV_LOAD_IMAGE_COLOR);
}

cv::Mat Camera::roi(cv::Mat frame, cv::Rect roi)
{
    cv::Mat res = frame(roi);
    return res;
}

void Camera::openRecorder(std::string path, cv::VideoCapture cap)
{
    recorder.open(path, CV_FOURCC('M', 'J', 'P', 'G'), cap.get(CV_CAP_PROP_FPS),cv::Size(cap.get(CV_CAP_PROP_FRAME_WIDTH), cap.get(CV_CAP_PROP_FRAME_HEIGHT)));
}

void Camera::record(cv::Mat frame)
{
    recorder << frame;
}

void Camera::endRecording()
{
    recorder.release();
}

cv::VideoCapture Camera::getCapture()
{
    return camera;
}

cv::Mat Camera::getRawImage()
{
	cv::Mat frame(640,480, CV_8UC3);
	camera.read(frame);
	return frame;
}

void Camera::showImage()
{
	cv::Mat frame = getRawImage();
	cv::namedWindow("Camera", cv::WINDOW_AUTOSIZE );
	cv::imshow("Camera",frame);
}



