import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle
{
    id: server_options_screen
    signal close();

    ActionBar
    {
        id: action_bar
        caption: "Сервера"

        left_button: Component {
            ImageButton
            {
                image_button: "qrc:/images/ic_action_previous_item.png";
                image_clicked: image_button;

                onClicked: {
                    server_options_screen.close();
                }
            }
        }
    }

    Column
    {
        id: column1
        anchors {
            top      : action_bar.bottom
            topMargin: consts.ui_margin
            left     : parent.left
            leftMargin: consts.ui_margin
        }
        spacing: consts.ui_margin

        // Адрес сервера
            Text {
                id     : txt1
                text   : "Адрес: "
                height: consts.cell_height
                verticalAlignment: Text.AlignVCenter
                anchors {
                    left: parent.left
                }
            }

            Text {
                id     : txt2
                text   : "Логин: "
                height: consts.cell_height
                verticalAlignment: Text.AlignVCenter
                anchors {
                    left: parent.left
                }
            }

            Text {
                id     : txt3
                text   : "Пароль: "
                height: consts.cell_height
                verticalAlignment: Text.AlignVCenter
                anchors {
                    left: parent.left
                }
                Rectangle {
                    color: "green"
                }
            }
    }

    Column {
        id: column2
        anchors {
            top    : action_bar.bottom
            topMargin: consts.ui_margin + consts.ui_spacing
            left   : column1.right
            right  : parent.right
            rightMargin: consts.ui_margin
        }
        spacing: consts.ui_margin + 2*consts.ui_spacing

        TextField
        {
            anchors {
                left: parent.left
                right: parent.right
            }
            height: consts.cell_height-2*consts.ui_spacing

            onAccepted:  { settings.set("server_address", text) }
            onEditingFinished: { settings.set("server_address", text) }
            Component.onCompleted: { text = settings.get("server_address", "") }
        }

        TextField
        {
            anchors {
                left: parent.left
                right: parent.right
            }
            height: consts.cell_height-2*consts.ui_spacing

            onAccepted:  { settings.set("login", text) }
            onEditingFinished: { settings.set("login", text) }
            Component.onCompleted: { text = settings.get("login", "") }
        }

        TextField
        {
            id: password_input
            echoMode: TextInput.Password
            anchors {
                left: parent.left
                right: parent.right
            }
            height: consts.cell_height-2*consts.ui_spacing

            onAccepted:  { settings.set("password", text) }
            onEditingFinished: { settings.set("password", text) }
            Component.onCompleted: { text = settings.get("password", "") }
        }
    }

    TextButton
    {
        anchors {
            left: parent.left
            right: parent.right
            top: column1.bottom
            margins: consts.ui_margin
        }

        height : consts.cell_height
        button_color: "green"
        pressed_color: "lightgreen"
        caption_color: "white"
        caption: "+"
    }

}
