import QtQuick 2.0

/************************************
    просто кнопка которая нажимается
 ************************************/
Image
{
    id: button;
    property url image_button  : ""
    property url image_clicked : ""

    signal clicked;

    fillMode : Image.PreserveAspectFit;
    source   : button_area.pressed ? image_clicked : image_button;

    MouseArea
    {
        id: button_area
        anchors {
            fill: parent
        }

        onClicked: {
            button.clicked();
        }
    }
}
