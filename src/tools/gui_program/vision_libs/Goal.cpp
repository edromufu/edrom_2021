#include "Goal.hpp"

Goal::Goal(){
    blackLimit = 0;
    whitePix = 100;
    onlyOnce = false;
    read = false;
    debug = false;
}

Goal::Goal(cv::Mat image, std::string xmlPath)
{
    setImage(image, xmlPath);
}

//Private:
void Goal::mediaPoints()
{
    unsigned int width = 0, heigth = 0;
    cv::Point temp_Point;

    for(unsigned int i = 0; i < coords.size(); i++)
    {
        width = coords[i].back().x - coords[i].front().x;
        heigth = coords[i].back().y - coords[i].front().y;
        if(width > 5)
        {
            temp_Point = cv::Point(coords[i].front().x + width/2, coords[i].front().y + heigth/2);
            possiblePost.push_back(temp_Point);
        }
    }
    if(possiblePost.size() == 0)
        throw "Função mediaPoints: Não há nenhuma possível trave";
}

void Goal::getCoordinates(cv::Mat field, cv::Mat binary)
{

    std::vector <cv::Point> coordTemp;
    intersecFieldBinary = field & binary;


    for(int i = 0; i < intersecFieldBinary.cols; i++){
        for(int j = 0; j < intersecFieldBinary.rows; j++)
        {
            bool colorPixel = false, nextPixel = false;
            if(intersecFieldBinary.at<uchar>(j,i) == 255)
                colorPixel = true;
            if(colorPixel == true){
                if(intersecFieldBinary.at<uchar>(j + 1,i) == 255)
                    nextPixel = true;
                else if(intersecFieldBinary.at<uchar>(j + 1, i + 1) == 255)
                    nextPixel = true;
                else if(intersecFieldBinary.at<uchar>(j , i + 1) == 255)
                    nextPixel = true;
                else if(intersecFieldBinary.at<uchar>(j - 1 , i + 1) == 255)
                    nextPixel = true;
                else if(intersecFieldBinary.at<uchar>(j - 1, i) == 255)
                    nextPixel = true;
                else
                    nextPixel = false;
                if(nextPixel)
                    coordTemp.push_back(cv::Point(i,j));

                if(nextPixel == false && coordTemp.size() != 0)
                {
                    coords.push_back(coordTemp);
                    coordTemp.clear();
                }
            }
        }
    }
    if(coords.size() == 0)
        throw "Função getCoordinates: Não há nenhum conjunto de pixels na intersecção das imagens de campo e branco";

    mediaPoints();
}

void Goal::isPost(cv::Mat image, unsigned int limite = 15)
{

//    posts.clear();
    std::vector<unsigned int> largerPost;
    std::vector<float> count;
    unsigned int contador[possiblePost.size()];
    unsigned int blackPixels ;
    for(unsigned int n = 0; n < possiblePost.size(); n++)
    {
        contador[n] = 0;
        blackPixels = 0;
        if(possiblePost[n].x - limite > 0 && possiblePost[n].x + limite < image.cols)
            for(unsigned int i = possiblePost[n].x - limite; i < possiblePost[n].x + limite; i++)
            {
                bool start = false;
                if(possiblePost[n].y + limite + 5 < image.rows)
                    for(unsigned int j = possiblePost[n].y + limite + 5; j > 0; j--)
                    {
                        if(image.at<uchar>(j,i) == 255)
                        {
                            contador[n] += 1;
                            start = true;
                        }
                        if(start && image.at<uchar>(j,i) == 0)
                            blackPixels++;
                        else
                            blackPixels = 0;
                        if(blackPixels == blackLimit)
                            break;
                    }
            }
        count.push_back(contador[n]);
    }
    std::sort(count.begin(), count.end());
    std::reverse(count.begin(), count.end());
    for(unsigned int i = 0; i < possiblePost.size(); i++)
    {
        if(count[1] > whitePix && (contador[i] == count[0] || contador[i] == count[1]))
        {
            largerPost.push_back(i);
        }
    }
    if(largerPost.size() == 0)
    {
        throw "Função isPost: Não estão sendo encontradas possíveis traves";
    }
    else
    {
        for(unsigned int i = 0; i < largerPost.size(); i++)
        {
            posts.push_back(possiblePost[largerPost[i]]);
        }
    }
    count.clear();
    largerPost.clear();

}

cv::Point Goal::findGoal()
{
    int yMed = 0;
    int xMed = 0;
    if(posts.size() == 0)
        throw "Sem traves!";
    else
    {
        yMed = (posts[0].y + posts[1].y)/2;
        xMed = (posts[0].x + posts[1].x)/2;
    }
    goal = cv::Point(xMed, yMed);

    return goal;
}

cv::Mat Goal::getIntersection()
{
    return intersecFieldBinary;
}

//void Goal::ReadFile(cv::FileStorage goalFile)
//{
//    this->file = goalFile;
//    readFilter();
//}

void Goal::readFilter(cv::FileStorage xml)
{
    xml ["whiteLimit"] >> whitePix;
    xml ["blackLimit"] >> blackLimit;

    xml.release();
}

//Public:
void Goal::setImage(cv::Mat image, std::string xmlPath)
{
    frame = image;
//    xmlPath = "XMLs/";
    if(!onlyOnce)
    {
        hsvPath = xmlPath + "GoalHsvParameters.xml";
        yccPath = xmlPath + "GoalYccParameters.xml";
        path = xmlPath + "GoalParameters.xml";
        onlyOnce = true;
    }

    cv::FileStorage parametersFileHsv(hsvPath, cv::FileStorage::READ);
    cv::FileStorage parametersFileYcc(yccPath, cv::FileStorage::READ);
    ColorFilter filterHsv(parametersFileHsv);
    ColorFilter filterYcc(parametersFileYcc);
    cv::Mat binaryImageHsv = filterHsv.applyFilter(image);
    cv::Mat binaryImageYcc = filterYcc.applyFilter(image);


    binaryImage = binaryImageYcc & binaryImageHsv;
    if(!read)
    {
        cv::FileStorage xml(path,cv::FileStorage::READ);
        readFilter(xml);
        read = true;
    }
}

void Goal::processImage(cv::Mat field)
{
    try
    {
        getCoordinates(field, binaryImage);
        isPost(binaryImage);
    }
    catch(const char* msg)
    {
        if(debug)
            std::cerr << msg << std::endl;
    }
    coords.clear();
    possiblePost.clear();

}

cv::Point Goal::getGoal()
{
    try
    {
        goal = findGoal();
    }
    catch(const char* msg)
    {
        if(debug)
            std::cerr << msg << std::endl;
    }
    return goal;
}

std::vector<cv::Point> Goal::getPosts()
{
    return posts;
}

void Goal::showGoal(cv::Mat output, cv::Point goal)
{
    cv::circle(output, goal, 5, cv::Scalar(0,255,0), -1);
//	cv::imshow("Goal", output);
}

bool Goal::found()
{
    if(goal != cv::Point(0,0))
        return true;
    else
        return false;
}
