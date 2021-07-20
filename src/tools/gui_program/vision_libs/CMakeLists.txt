find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_library(colorFilter ColorFilter.cpp)
add_library(contour_searcher ContourSearcher.cpp)
add_library(camera Camera.cpp)
add_library(field Field.cpp)
add_library(ransac RansacCircleSearcher.cpp)
add_library(ball Ball.cpp)
add_library(linesFilter LinesFilter.cpp)
add_library(goal Goal.cpp)
add_library(players Players.cpp)
add_library(vision Vision.cpp)


add_executable(testVision testVision.cpp)
add_executable(Vision VisionProcess.cpp)


#ball linesFilter goal field colorFilter contour_searcher ${OpenCV_LIBS} camera ransac
target_link_libraries(vision  config)
#target_link_libraries(vision ball linesFilter goal field colorFilter contour_searcher ${OpenCV_LIBS} camera ransac)
target_link_libraries(testVision vision ${OpenCV_LIBS})
target_link_libraries(players field colorFilter contour_searcher ${OpenCV_LIBS} camera)
target_link_libraries(Vision ball linesFilter goal field colorFilter contour_searcher ${OpenCV_LIBS} camera ransac config players)
#target_link_libraries(goal field colorFilter contoursearcher ${OpenCV_LIBS} camera)

