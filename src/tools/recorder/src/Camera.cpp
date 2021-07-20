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
    return cv::imread(path, cv::IMREAD_COLOR);
}

cv::Mat Camera::roi(cv::Mat frame, cv::Rect roi)
{
    cv::Mat res = frame(roi);
    return res;
}

void Camera::openRecorder(std::string path)
{
    Camera::recorder.open(path, cv::VideoWriter::fourcc('M', 'J', 'P', 'G'), 15, cv::Size(640, 480));
}

void Camera::record(cv::Mat frame)
{
    Camera::recorder << frame;
}

void Camera::endRecording()
{
    Camera::recorder.release();
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



