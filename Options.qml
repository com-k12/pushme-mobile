import QtQuick 2.0

// Экран сообщений
Rectangle
{
    id: options_screen
    ActionBar
    {
        id: action_bar
        caption: "Настройки"

        left_button: Component {
            ImageButton
            {
                image_button: "qrc:/images/ic_action_previous_item.png";
                image_clicked: image_button;

                onClicked: {
                    main_form.closeFull();
                }
            }
        }
    }

    Column
    {
        anchors {
            left  : parent.left
            right : parent.right
            top   : action_bar.bottom
            leftMargin: consts.ui_margin
        }

        TextButton
        {
            height  : consts.cell_height;
            width   : parent.width
            caption : "Сервера"

            onClicked:  {
                options_loader.sourceComponent = server_options_component
            }
        }

        TextButton
        {
            height  : consts.cell_height;
            width   : parent.width
            caption : "Уведомления"
            onClicked:  {
                options_loader.sourceComponent = notif_options_component
            }
        }

        TextButton
        {
            height  : consts.cell_height;
            width   : parent.width
            caption : "Оформление"

            onClicked:  {
                options_loader.sourceComponent = graphics_options_component
            }
        }
    }

    // Компоненты
    Component
    {
        id: server_options_component
        ServerOptions {
            onClose: options_loader.sourceComponent = null
        }
    }

    Component
    {
        id: notif_options_component
        NotificationsOptions {
            onClose: options_loader.sourceComponent = null
        }
    }

    Component
    {
        id: graphics_options_component
        GraphicOptions {
            onClose: options_loader.sourceComponent = null
        }
    }

    Loader
    {
        id: options_loader
        anchors.fill: parent
        sourceComponent: null
    }
}
