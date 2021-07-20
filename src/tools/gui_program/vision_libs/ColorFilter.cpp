#include "ColorFilter.hpp"

//Constructors

ColorFilter::ColorFilter()
{
	//Cria arquivo padrão
	// ColorFilter("XMLs/Untitled.xml"); 
}

ColorFilter::ColorFilter(cv::FileStorage file)
{
	this->file = file;
	readFilter();
}


//Functions
//Public:

cv::Mat ColorFilter::applyFilter(cv::Mat inputImage)
{
	cv::Mat output;
	//TODO:Fazer a classe ser mais geral aceitando qualquer colorSpace como entrada
	//ColorSpace
	if(colorSpace == "BGR")
		output = inputImage;
	else if(colorSpace == "HSV")
	{
		//Hue máximo é de 179
		if(firstParam[1] > 179)
			firstParam[1] = 179; 
		cv::cvtColor(inputImage,output,CV_BGR2HSV);
	}
	else if(colorSpace == "YCC")
		cv::cvtColor(inputImage,output,CV_BGR2YCrCb);

	//InRange
	cv::Scalar lowerRange(firstParam[0],secondParam[0],thirdParam[0]);
	cv::Scalar upperRange(firstParam[1],secondParam[1],thirdParam[1]);

	cv::inRange(output,lowerRange,upperRange,output);
	//Erode e Dilate
	int morph;
	if(!dilateErode.empty())
	{
		for(int i = 0;i < dilateErode.size() ; i++)
		{
			
			if( dilateErode[i].derodeType == 0 )
				morph = cv::MORPH_RECT; 
			else if( dilateErode[i].derodeType == 1 )
				morph = cv::MORPH_CROSS; 
			else if( dilateErode[i].derodeType == 2) 
				morph = cv::MORPH_ELLIPSE; 
			
			cv::Size size(2*dilateErode[i].value + 1, 2*dilateErode[i].value + 1);
			cv::Point point(dilateErode[i].value, dilateErode[i].value);
			cv::Mat element = getStructuringElement(morph, size, point);
			if(dilateErode[i].dilate)
				cv::dilate(output , output , element);
			else
				cv::erode(output , output , element);
		}
	}
	return output;
}

void ColorFilter::readFilter()
{

	file ["color_space"] >> colorSpace;
	if(colorSpace == "HSV")
	{
		file [ "Min_Hue" ] >> firstParam[0];
		file [ "Max_Hue"] >> firstParam[1];
		file [ "Min_Sat" ] >> secondParam[0];
		file [ "Max_Sat" ] >> secondParam[1];
		file [ "Min_Value" ] >>thirdParam[0];
		file [ "Max_Value"] >> thirdParam[1];
	}
	else if(colorSpace == "YCC")
	{
		file [ "Min_Luma" ] >> firstParam[0];
		file [ "Max_Luma"] >> firstParam[1];
		file [ "Min_Blue_Dif" ] >> secondParam[0];
		file [ "Max_Blue_Dif" ] >> secondParam[1];
		file [ "Min_Red_Dif" ] >>thirdParam[0];
		file [ "Max_Red_Dif"] >> thirdParam[1];
	}
	int size;
	file [ "Size"] >> size;
	dilateErode.resize(size);
	
	for(int i = 0;i < size ; i++)
	{
		std::stringstream convert;
		convert << i;
		file [ "Shape" + convert.str()] >> dilateErode[i].derodeType;
		file [ "Value" + convert.str()] >> dilateErode[i].value;
		file [ "Morphology" + convert.str()] >> dilateErode[i].dilate;
	}

	file.release();
}
// Private:
// ColorFilter::ColorFilter(std::string fileName)
// {
// 	colorSpace = "BGR";
// 	maxFirstParam = 255;
	
// 	firstParam[0] = 0;
// 	secondParam[0] = 0;
// 	thirdParam[0] = 0;
	
// 	firstParam[1] = 255;
// 	secondParam[1] = 255;
// 	thirdParam[1] = 255;
	
// 	dilateErode.push_back(derode());
	
// 	file.open(fileName.c_str(),cv::FileStorage::WRITE);
// 	if(!file.isOpened())
// 		std::cout<<"\nErro ao criar arquivo\n";
// 	createFilter();
// }

// void ColorFilter::createFilter()
// {
// 	char key;
// 	Camera camera;
	
// 	//TODO:Criar uma GUI fodona e jogar na cara do Jhonass
	
// 	cv::namedWindow("Camera",cv::WINDOW_NORMAL ); // cv::WINDOW_AUTOSIZE
// 	cv::moveWindow("Camera", 705,0); 
	
// 	std::cout<<"\n\n***********************************\n\n";
// 	std::cout<<"Aperte a para trabalhar em BGR\n";
// 	std::cout<<"Aperte s para trabalhar em HSV\n";
// 	std::cout<<"Aperte d para trabalhar em YCbCr\n";
	
// 	while(true)
// 	{
// 		key = cv::waitKey(0);
// 		if(key > 0 )
// 		{
// 			if(key >= 0 )std::cout<<key<<"\n";
// 			if(key == 'a')
// 			{
// 				colorSpace = BGR_COLORSPACE;
// 				firstButton = "Blue";
// 				secondButton = "Green";
// 				thirdButton = "Red";
// 				break;
// 			}
// 			else if(key == 's')
// 			{
// 				colorSpace = HSV_COLORSPACE;
// 				maxFirstParam = 179;
// 				firstButton = "Hue";
// 				secondButton = "Sat";
// 				thirdButton = "Value";
// 				break;
// 			}
// 			else if(key == 'd')
// 			{
// 				colorSpace = YCC_COLORSPACE;
// 				firstButton = "Luma";
// 				secondButton = "Blue";
// 				thirdButton = "Red";
// 				break;
// 			}
// 			else
// 			{
// 				std::cout<<"Comando inválido\n";
// 				continue;
// 			}
// 		}
// 	}
// 	std::cout<<"\n\n***********************************\n\n";
// 	std::cout<<"Utilize as trackbars para setar os parametros\n";
// 	std::cout<<"Aperte e para trabalhar com erode\n";
// 	std::cout<<"Aperte d para trabalhar com dilate\n";
// 	std::cout<<"Aperte s para salvar o erode/dilate\n";
// 	std::cout<<"Aperte r para resetar o último erode/dilate\n";
// 	std::cout<<"Aperte 1 para utilizar MORPH_ELLIPSE\n";
// 	std::cout<<"Aperte 2 para utilizar MORPH_CROSS\n";
// 	std::cout<<"Aperte 3 para utilizar MORPH_RECT\n";
// 	std::cout<<"Aperte ESC para salvar filtro e sair\n";
	
// 	//TODO:verificar se é possivel atualizar trackbars 
	
// 	cv::createTrackbar("min" + firstButton,"Camera",&firstParam[0],maxFirstParam,0);
// 	cv::createTrackbar("max" + firstButton,"Camera",&firstParam[1],maxFirstParam,0);
// 	cv::createTrackbar("min" + secondButton,"Camera",&secondParam[0],255,0);
// 	cv::createTrackbar("max" + secondButton,"Camera",&secondParam[1],255,0);
// 	cv::createTrackbar("min" + thirdButton,"Camera",&thirdParam[0],255,0);
// 	cv::createTrackbar("max" + thirdButton,"Camera",&thirdParam[1],255,0);
// 	cv::createTrackbar("erodeDila","Camera",&dilateErode.back().value,20,0);
	
// 	while(true)
// 	{	
// 		cv::Mat frame = applyFilter(camera.getRawImage());
// 		if(!frame.empty())
// 		{
// 			cv::imshow("Camera",frame);
			
// 			key = cv::waitKey(30);
// 			if(key >= 0 )
// 			{
// 				if(key == 'e')
// 					dilateErode.back().dilate = false;
				
// 				else if(key == 'd')
// 					dilateErode.back().dilate = true;
				
// 				else if(key == '1')
// 					dilateErode.back().derodeType = 0;
					
// 				else if(key == '2')
// 					dilateErode.back().derodeType = 1;
					
// 				else if(key == '3')
// 					dilateErode.back().derodeType = 2;
							
// 				else if(key == 's')
// 				{
// 					dilateErode.push_back(derode());
// 					cv::destroyWindow("Camera");
// 					createWindow();
// 				}
// 				else if(key == 'r')
// 				{
// 					dilateErode.pop_back();
// 					cv::destroyWindow("Camera");
// 					createWindow();
// 				}
// 				else if(key == '')
// 				{
// 					saveFilter();
// 					break;
// 				}
// 			}
// 		}
// 	}
// }
// void ColorFilter::createWindow()
// {
// 	cv::namedWindow("Camera",cv::WINDOW_NORMAL ); // cv::WINDOW_AUTOSIZE
// 	cv::moveWindow("Camera", 705,0); 
	
// 	cv::createTrackbar("min" + firstButton,"Camera",&firstParam[0],maxFirstParam,0);
// 	cv::createTrackbar("max" + firstButton,"Camera",&firstParam[1],maxFirstParam,0);
// 	cv::createTrackbar("min" + secondButton,"Camera",&secondParam[0],255,0);
// 	cv::createTrackbar("max" + secondButton,"Camera",&secondParam[1],255,0);
// 	cv::createTrackbar("min" + thirdButton,"Camera",&thirdParam[0],255,0);
// 	cv::createTrackbar("max" + thirdButton,"Camera",&thirdParam[1],255,0);
// 	cv::createTrackbar("erodeDila","Camera",&dilateErode.back().value,20,0);
// }
// void ColorFilter::saveFilter()
// {
	
// 	file << "colorSpace" << colorSpace;
// 	file << "firstParamMin" << firstParam[0];
// 	file << "firstParamMax" << firstParam[1];
// 	file << "secondParamMin" << secondParam[0];
// 	file << "secondParamMax" << secondParam[1];
// 	file << "thirdParamMin" << thirdParam[0];
// 	file << "thirdParamMax" << thirdParam[1];
// 	file << "dilateErodeSize" << (int)dilateErode.size();
// 	if(!dilateErode.empty())
// 	{
// 		for(int i = 0;i < dilateErode.size() ; i++)
// 		{
// 			std::stringstream convert;
// 			convert << i;
// 			file << "derodeType" + convert.str()<< dilateErode[i].derodeType;
// 			file << "value" + convert.str() << dilateErode[i].value;
// 			file << "dilate" +  convert.str()<< dilateErode[i].dilate;
// 		}
// 	}
// 	file.release();
// }


//Main para testar a classe

//~ int main()
//~ {
	//~ cv::FileStorage file;
	//~ file.open("XMLs/FieldParameters.xml",cv::FileStorage::READ);
	//~ ColorFilter f(file);
	//~ 
	//~ Camera camera;
	//~ cv::namedWindow("Camera", cv::WINDOW_AUTOSIZE ); 
	//~ while(true)
	//~ {
		//~ cv::Mat frame = f.applyFilter(camera.getRawImage());
		//~ if(!frame.empty())
		//~ {
			//~ cv::imshow("Camera",frame);
			//~ cv::waitKey(30);
		//~ }
	//~ }
    //~ //ColorFilter("XMLs/BallWhiteParameters.xml");
	//~ return(0);
//~ }
