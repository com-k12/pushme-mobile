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

    //gradient: Gradient
    //{
    //    GradientStop { position: 0.00 ; color: "#ff8800" }
    //    GradientStop { position: 0.97 ; color: "#fe7b00" }
    //    GradientStop { position: 1.00 ; color: "#ef7400" }
    //}
    color: "#254152"

    // Надпись
    Text
    {
        text: caption
        anchors.centerIn: parent
        font.pixelSize      : consts.ui_font_big
        color: "white"
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
