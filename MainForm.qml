import QtQuick 2.0

/****************************
   Форма с кратким списком сообщений
 ****************************/
Rectangle
{
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
                    console.log("pressed")
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
                obj_model.remove(index);
            }
        }

        model:  obj_model

        ListModel
        {
            id: obj_model
            ListElement {
                msg_is_readed : false
                msg_text      : "СКОМПИЛИЛАСЬ ТВОЯ ФЛasdasdasdasЕШКА!!!"
                msg_time      : "00:00:00"
                msg_priority      : 'OK'
            }
            ListElement {
                msg_is_readed : false
                msg_text      : "Зайди"
                msg_time      : "11:22:33"
                msg_priority      : 'WARNING'
            }
            ListElement {
                msg_is_readed : true
                msg_text      : "Привет, как твои дела?"
                msg_time      : "44:55:66"
                msg_priority      : 'CRITICAL'
            }
            ListElement {
                msg_is_readed : true
                msg_text      : "Всем быстренько на совещание!"
                msg_time      : "77:88:99"
                msg_priority      : 'INFO'
            }
        }
    }
    color: "white"
}
