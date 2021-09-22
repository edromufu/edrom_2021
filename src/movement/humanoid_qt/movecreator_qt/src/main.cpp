#include <QApplication>
#include "../include/movecreator_qt/movecreator.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    movecreator_qt::MoveCreator moveCreator(argc, argv);
    //moveCreator.show();

    return a.exec();
}
