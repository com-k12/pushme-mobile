#ifndef NOTIFICATIONCLIENT_H
#define NOTIFICATIONCLIENT_H

#include <QObject>

class NotificationClient : public QObject
{
    Q_OBJECT
public:
    explicit NotificationClient(QObject *parent = 0);
    Q_INVOKABLE void notify(const QString &title, const QString &text);
};

#endif // NOTIFICATIONCLIENT_H
