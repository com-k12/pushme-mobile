import QtQuick 2.2
import QtQuick.Window 2.1

/************************************
  Описание констант
 ************************************/
Item
{
    readonly property real mm: Screen.pixelDensity;    // Количество пикселей на один миллиметр


    //******* Отступы *******
    readonly property real ui_spacing     : mm*1;          // Отступы средние
    readonly property real ui_margin      : mm*2;          // Отступы средние

    readonly property real ui_left_message: 2*mm;          // Цветовой индикатор слева от сообщения

    //******* Шрифты ********
    readonly property real ui_font_small  : mm*2.5;          // Маленький шрифт
    readonly property real ui_font_middle : mm*3;        // Средний   шрифт
    readonly property real ui_font_big    : mm*5;          // Большой   шрифт

    //******* Размеры ********
    readonly property real delete_button_width: mm*20;
    readonly property real cell_height: mm*8;
    readonly property real ui_actionbar_height: mm*10; // Высота верхней панели
    readonly property real ui_bottom_bar_height: mm*10;
    readonly property int ui_hr_height: 0.25*mm

    //******* Цвета приоритетов ********
    property var priority_colors:
    {
       'OK'       : "#b0faab",
       'WARNING'  : "#ffa740",
       'CRITICAL' : "red",
       'INFO'     : "#c1c1c1"
    }

    //******* Время обновления ********
    readonly property int server_timer_interval: 1000;

}
