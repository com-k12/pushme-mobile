import QtQuick 2.0

/****************************
   Форма с кратким списком сообщений
 ****************************/
Rectangle
{
    id: main_form
    anchors {
        fill: parent;
    }

    ActionBar
    {
        id          : action_bar
        caption     : "PushMe"
        right_button:
        Component
        {
            ImageButton
            {
                image_button  : "qrc:/images/gear.png";
                image_clicked : image_button;
                onClicked: {
                    full_loader.sourceComponent = options_component;
                }
            }
        }
    }

    ListView
    {
        id   : msg_list
        clip : true
        anchors
        {
            left   : parent.left
            top    : action_bar.bottom
            bottom : parent.bottom
            right  : parent.right
        }

        delegate: MessageRow
        {
            height    : consts.cell_height;
            width     : msg_list.width;

            is_readed : msg_is_readed;
            message   : msg_text;
            time      : msg_time;
            priority  : msg_priority;

            onRemove: {
                messages_model.remove(index);
            }

            onMessageClicked: {
                msg_list.currentIndex = index;
                full_loader.sourceComponent = messages_full;
            }
        }

        model:  messages_model
    }
    color: "white"

    Component
    {
        id: messages_full
        MessageFull {
            index: msg_list.currentIndex
        }
    }

    Component
    {
        id: options_component
        Options { }
    }

    Loader
    {
        id: full_loader
        anchors.fill    : parent
        sourceComponent : null
    }

    function closeFull() {
        full_loader.sourceComponent = null;
    }
}
