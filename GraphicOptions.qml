import QtQuick 2.0

Rectangle
{
    id: graphic_options_screen
    signal close();

    ActionBar
    {
        id: action_bar
        caption: "Оформление"

        left_button: Component {
            ImageButton
            {
                image_button: "qrc:/images/ic_action_previous_item.png";
                image_clicked: image_button;

                onClicked: {
                    graphic_options_screen.close();
                }
            }
        }
    }
}
