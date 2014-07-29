#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#ifdef Q_OS_ANDROID
    #include "NotificationClient.h"
#endif

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

#ifdef Q_OS_ANDROID
    NotificationClient *notificationClient = new NotificationClient();
    engine.rootContext()->setContextProperty(QLatin1String("notificationClient"), notificationClient);
#endif
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
