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
        anchors {
            top    : action_bar.bottom
            topMargin: consts.ui_margin
            left   : parent.left
            right  : parent.right
        }
        spacing: consts.ui_margin

        // Адрес сервера
        Row
        {
            height : consts.cell_height
            x      : consts.ui_margin

            Text {
                id     : txt1
                text   : "Адрес: "
                height : parent.height
                verticalAlignment: Text.AlignVCenter
            }

            TextField
            {
                height: parent.height
                width : server_options_screen.width - txt1.width - consts.ui_margin*3

                onAccepted:  {
                    settings.set("server_address", text)
                }

                onEditingFinished: {
                    settings.set("server_address", text)
                }

                Component.onCompleted: {
                    text = settings.get("server_address", "")
                }
            }
        }
        // Адрес сервера
        Row
        {
            height : consts.cell_height
            x      : consts.ui_margin

            Text {
                id     : txt2
                text   : "Логин: "
                height : parent.height
                verticalAlignment: Text.AlignVCenter
            }

            TextField
            {
                height: parent.height
                width : server_options_screen.width - txt2.width - consts.ui_margin*3

                onAccepted:  {
                    settings.set("login", text)
                }

                onEditingFinished: {
                    settings.set("login", text)
                }

                Component.onCompleted: {
                    text = settings.get("login", "")
                }
            }
        }
        // Адрес сервера
        Row
        {
            height : consts.cell_height
            x      : consts.ui_margin

            Text {
                id     : txt3
                text   : "Пароль: "
                height : parent.height
                verticalAlignment: Text.AlignVCenter
            }

            TextField
            {
                height: parent.height
                width : server_options_screen.width - txt3.width - consts.ui_margin*3

                onAccepted:  {
                    settings.set("password", text)
                }

                onEditingFinished: {
                    settings.set("password", text)
                }

                Component.onCompleted: {
                    text = settings.get("password", "")
                }

                echoMode: TextInput.Password
            }
        }

        TextButton
        {
            x      : consts.ui_margin
            width  : server_options_screen.width - x*2
            height : consts.cell_height
            button_color: "green"
            pressed_color: "lightgreen"
            caption_color: "white"
            caption: "+"
        }
    }

}
