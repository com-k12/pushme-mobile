import QtQuick 2.0

/***************************
 Элемент одного сообщения
***************************/

Item
{
    id: message_element_item

    property bool is_readed : false;
    property string priority   : 'OK'
    property string time    : "00:00:00";
    property string message : ""

    signal remove();
    signal messageClicked();

    ListView
    {
        id: _list
        anchors.fill: parent

        orientation: Qt.Horizontal
        snapMode: ListView.SnapToItem
        boundsBehavior: Flickable.StopAtBounds
        delegate: Loader
        {
            sourceComponent: type === "message"
                              ? message_component
                              : type === "remove"
                                ? remove_component
                                : null

        }

        model: ListModel
        {
            ListElement {
                type: "message"
            }
            ListElement {
                type: "remove"
            }
        }
    }

    Component
    {
        id: message_component
        // Тот прямоугольник который отвечает за то, просмотрено оно или нет
        Item
        {
            width  :  _list.width
            height :  _list.height
            Rectangle
            {
                z: 0
                anchors {
                    left   : parent.left
                    top    : parent.top
                    bottom : parent.bottom
                }

                width : is_readed
                        ? consts.ui_left_message
                        : message_element_item.width;
                color : consts.priority_colors[priority];
            }

            // Время
            Text
            {
                z : 1
                id: time_text
                anchors {
                    left   : parent.left;
                    top    : parent.top;
                    bottom : parent.bottom;
                    leftMargin: consts.ui_margin
                }

                text: time;
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: consts.ui_font_middle
            }

            // Сообщение
            Text
            {
                z: 1
                anchors {
                    left   : time_text.right;
                    top    : parent.top;
                    bottom : parent.bottom;
                    leftMargin: consts.ui_margin
                }

                width: message_element_item.width - time_text.width - consts.ui_margin*3
                text: message;
                elide: Text.ElideRight // Обрезает текст если он не влаит справа и ставит ...
                verticalAlignment: Text.AlignVCenter

                font.pixelSize: consts.ui_font_middle
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    message_element_item.messageClicked()
                }
            }
        }
    }

    Component
    {
        id: remove_component
        TextButton
        {
            width  : consts.delete_button_width
            height : message_element_item.height

            button_color  : "red"
            pressed_color : "orange"

            caption: "Удалить"
            caption_color: "white"

            onClicked: {
                message_element_item.remove();
            }
        }
    }
}
