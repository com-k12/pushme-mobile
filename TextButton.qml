import QtQuick 2.0

Rectangle
{
    id: button
    property string button_color: ""
    property string pressed_color: ""
    property string caption : ""
    property string caption_color: "black"

    signal clicked()
    color: button_ma.pressed
           ? pressed_color
           : button_color;


    Text
    {
        anchors.centerIn : parent
        text             : caption
        color            : caption_color
    }

    MouseArea
    {
        id: button_ma
        anchors.fill: parent
        onClicked:  {
          button.clicked()
        }
    }

}
