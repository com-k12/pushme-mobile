#include "NotificationClient.h"
#include <QtAndroidExtras/QAndroidJniObject>

NotificationClient::NotificationClient(QObject *parent) :
    QObject(parent)
{}

void NotificationClient::notify( const QString &title, const QString & text)
{
    QAndroidJniObject javaNotification = QAndroidJniObject::fromString(text);
    QAndroidJniObject nTitle = QAndroidJniObject::fromString(title);
    QAndroidJniObject::callStaticMethod<void>("com/k12/pushme/NotificationClient",
                                       "notify",
                                       "(Ljava/lang/String;Ljava/lang/String;)V",
                                       javaNotification.object<jstring>(),
                                       nTitle.object<jstring>()
                                              );

}
