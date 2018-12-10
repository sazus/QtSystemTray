#include "traywidget.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    TrayWidget w;

    return a.exec();
}
