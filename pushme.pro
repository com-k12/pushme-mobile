TEMPLATE = app

QT += qml quick sql

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)


android {
    QT += androidextras
    OTHER_FILES += $$PWD/android/AndroidManifest.xml \
                   $$PWD/android/src/com/k12/pushme/NotificationClient.java
    SOURCES +=
        NotificationClient.cpp

    HEADERS += \
        NotificationClient.h

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}
