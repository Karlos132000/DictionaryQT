#include "DictionaryQT/mainwindow.h"

#include <QApplication>

class QApplication;

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    return a.exec();
}
