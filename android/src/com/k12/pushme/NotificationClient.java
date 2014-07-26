/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtAndroidExtras module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

package com.k12.pushme;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import org.qtproject.qt5.android.QtNative;

import android.app.PendingIntent;
import android.content.Intent;

public class NotificationClient extends org.qtproject.qt5.android.bindings.QtActivity
{
    private static NotificationManager m_notificationManager;
    private static Notification.Builder m_builder;
    private static NotificationClient m_instance;

    private static final int _limit = 5;
    private static int _currentID = 1;

    public NotificationClient()
    {
        m_instance = this;
    }

    public static void notify(String s, String title)
    {
        System.out.println("hi " + s + ":" + title + ":" + m_instance);

        m_notificationManager = (NotificationManager)QtNative.activity().getSystemService(Context.NOTIFICATION_SERVICE);
        m_builder = new Notification.Builder(QtNative.activity());

        m_builder.setSmallIcon(android.R.drawable.ic_dialog_alert);
        m_builder.setContentTitle(title);
        m_builder.setContentText(s);

        Intent resultIntent = new Intent(QtNative.activity(), QtNative.activity().getClass());
        // Because clicking the notification opens a new ("special") activity, there's
        // no need to create an artificial back stack.
        PendingIntent resultPendingIntent =
            PendingIntent.getActivity(
            QtNative.activity(),
            0,
            resultIntent,
            PendingIntent.FLAG_UPDATE_CURRENT
        );
        m_builder.setContentIntent(resultPendingIntent);

        m_notificationManager.notify(_currentID, m_builder.build());



        _currentID += 1;
        if (_currentID > _limit) {
            _currentID = 1;
        }
    }
}
