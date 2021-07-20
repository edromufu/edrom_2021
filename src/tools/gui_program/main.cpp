#include "parameters.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    try
    {
        QApplication a(argc, argv);
        Parameters w;
        w.show();
        return a.exec();
    }
    catch(const std::bad_alloc &)
    {
        std::cout << "aeadas\n";
    }

}
