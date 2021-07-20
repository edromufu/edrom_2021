#include "Field.hpp"

Field::Field()
{
    onlyOnce = false;
}

Field::Field(cv::Mat image, std::string xmlPath)
{
    setImage(image, xmlPath);
}

void Field::setImage(cv::Mat image, std::string xmlPath)
{
    double tempo;
    this->frame = image;
    if(!onlyOnce)
    {
        path = xmlPath + "FieldParameters.xml";
        onlyOnce = true;
    }
    cv::FileStorage parametersFile(path, cv::FileStorage::READ);
    ColorFilter filter(parametersFile);
    cv::Mat binaryImage = filter.applyFilter(image);


    ContourSearcher contours(binaryImage);
    cv::Mat largestContour = contours.getImageBiggestContour(true);
    cv::Mat outOfContour = 255 - largestContour;

    cv::Mat result;
    cv::Mat outsideOfResult;
    frame.copyTo(result,largestContour);
    frame.copyTo(outsideOfResult,outOfContour);
    //TODO:verificar se é melhor utilizar uma roi ou a imagem no tamanho original
    field = result.clone();
    outsideOfField = outsideOfResult.clone();
}

cv::Mat Field::getField()
{
    return field;
}

cv::Mat Field::getOutsideOfField()
{
    return outsideOfField;
}

cv::Mat Field::getBinaryField()
{
    binaryField = cv::Mat::zeros (480, 640, CV_8UC1);
    for(int i = 0; i < field.cols; i++)
    {
        for(int j = 0; j < field.rows; j++)
        {
            if(field.at<cv::Vec3b>(j,i) != cv::Vec3b(0,0,0))
                binaryField.at<uchar>(j,i) = 255;
            else
                binaryField.at<uchar>(j,i) = 0;
        }
    }    
    return binaryField;
}


void Field::showField()
{
    showImage(field);
}

void Field::showOutsideOfField()
{
    showImage(outsideOfField);
}

void Field::showImage(cv::Mat image)
{
    cv::namedWindow("window", cv::WINDOW_AUTOSIZE );
    cv::imshow("window",image);
}

//int main()
//{
//    Camera camera;
////    Field field;
//    cv::Mat cap;

//    while(true)
//    {
//        camera.getCapture() >> cap;
//        cv::imshow("ada", camera.getRawImage());
////        field.setImage(cap, "../../Vision/Parameters/XMLs/");
//        std::cout << "aubdaibd\n";
////        field.showField();
////        if(field.key == 27)
////            return -1;
//    }
//    return 0;
//}

