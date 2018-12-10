#-------------------------------------------------------------------------------
# Qt Widget SystemTray Sample
# - Qtでタスクトレイ常駐アプリをつくろう@Qiita
#   https://qiita.com/sazus/items/88daf4949cac06529f88
#-------------------------------------------------------------------------------
load(qt_build_config)

QT       += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = SystemTrayWidget
TEMPLATE = app

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#-------------------------------------------------------------------------------

INCLUDEPATH += $$PWD/src
DEPENDPATH  += $$PWD/src

SOURCES += \
  main.cpp \
  src/traywidget.cpp

HEADERS += \
  src/traywidget.h

#FORMS += \

RESOURCES += \
  resources.qrc

#-------------------------------------------------------------------------------

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
