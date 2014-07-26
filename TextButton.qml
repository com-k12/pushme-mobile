import QtQuick 2.0

Rectangle
{
    id: button
    property string button_color: "white"
    property string pressed_color: "lightblue"
    property string caption : ""
    property string caption_color: "black"
    property bool   center: false
    property real   font_size: consts.ui_font_middle
    property url    image_source: ""

    signal clicked()
    color: button_ma.pressed
           ? pressed_color
           : button_color;

    Image {
        id: image
        fillMode: Image.PreserveAspectFit
        source: image_source
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
    }

    Text
    {
        text          : caption
        color         : caption_color
        font.pixelSize: font_size
        anchors {
            verticalCenter: parent.verticalCenter
            left: center ? undefined : image.right
            horizontalCenter: center ? parent.horizontalCenter : undefined
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
