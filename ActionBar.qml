import QtQuick 2.2

Rectangle
{
    property string caption: ""
    property QtObject left_button: null
    property QtObject right_button: null

    // Позиционирование
    anchors {
        left : parent.left;
        right: parent.right;
        top  : parent.top
    }
    height: consts.ui_actionbar_height;

    color   : "lightgray"

    // Надпись
    Text
    {
        text: caption
        anchors {
            left   : left_button_loader.right
            right  : right_button_loader.left
            top    : parent.top
            bottom : parent.bottom
        }

        verticalAlignment   : Text.AlignVCenter
        horizontalAlignment : Text.AlignHCenter
        font.pixelSize      : consts.ui_font_big
    }


    // Кнопка слева
    Loader
    {
        id              : left_button_loader
        sourceComponent : left_button
        anchors {
            left   : parent.left
            top    : parent.top
            bottom : parent.bottom
            margins: consts.ui_spacing
        }
        width   : left_button === null ? 0     : height
        visible : left_button === null ? false : true
    }

    // Кнопка справа
    Loader
    {
        id              : right_button_loader
        sourceComponent : right_button
        anchors {
            right  : parent.right
            top    : parent.top
            bottom : parent.bottom
            margins: consts.ui_spacing
        }
        width   : right_button === null ? 0     : height
        visible : right_button === null ? false : true
    }

}
