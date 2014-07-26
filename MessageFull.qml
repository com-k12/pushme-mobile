import QtQuick 2.0


/****************************
    Сообщение полностью
 ****************************/
Rectangle
{
    id: txt_element
    property int index : -1;
    readonly property string time     : index>= 0 ? messages_model.get(index).msg_time     : "00:00:00"
    readonly property string text     : index>= 0 ? messages_model.get(index).msg_text     : ""
    readonly property string priority : index>= 0 ? messages_model.get(index).msg_priority : 'OK'

    // При переходе на эту страничку помечаем сообщение как прочитанное
    onIndexChanged: {
        if (index >= 0) {
            messages_model.get(index).msg_is_readed = true;
        }
    }

    Text
    {
        id   : time_txt;
        text : txt_element.time;

        anchors {
            left    : parent.left
            top     : parent.top
            margins : consts.ui_margin
        }
        font.pixelSize : consts.ui_font_small
        font.bold      : true
    }

    Flickable
    {
        contentWidth  : parent.width;
        contentHeight : message_txt.contentHeight;
        boundsBehavior: Flickable.StopAtBounds;

        anchors {
            top     : time_txt.top
            left    : parent.left
            right   : parent.left
            bottom  : parent.bottom
            margins : consts.ui_margin
            topMargin : consts.ui_margin*3
        }

        Text
        {
            id   : message_txt;
            text : txt_element.text;

            width  : parent.width;

            anchors {
                left    : parent.left
                top     : parent.top
            }
            font.pixelSize : consts.ui_font_middle
            font.bold      : true

            wrapMode: Text.WordWrap
        }
    }

    Row
    {
        id: bottom_panel

        anchors {
            bottom : parent.bottom
            left   : parent.left
            right  : parent.right
        }

        height: consts.ui_bottom_bar_height

        TextButton
        {
            width  : parent.width/2
            height : parent.height

            button_color  : "green"
            pressed_color : "lightgreen"

            caption: "Назад"
            caption_color: "white"

            center: true

            onClicked: {
                main_form.closeFull();
            }
        }

        TextButton
        {
            width  : parent.width/2
            height : parent.height

            button_color  : "red"
            pressed_color : "orange"

            caption: "Удалить"
            caption_color: "white"

            center: true

            onClicked: {
                messages_model.remove(index);
                main_form.closeFull();
            }
        }
    }
}
