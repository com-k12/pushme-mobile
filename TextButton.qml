import QtQuick 2.0

Rectangle
{
    id: button
    property string button_color: "white"
    property string pressed_color: "lightblue"
    property string caption : ""
    property string caption_color: "black"

    signal clicked()
    color: button_ma.pressed
           ? pressed_color
           : button_color;

    Text
    {
        text             : caption
        color            : caption_color
        font.pixelSize   : consts.ui_font_middle
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
    }

    MouseArea
    {
        id: button_ma
        anchors.fill: parent
        onClicked:  {
          button.clicked()
        }
    }

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        color: "lightgray"
        height: 1
    }
}
