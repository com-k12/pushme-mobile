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
    readonly property real ui_font_small  : mm*3;          // Маленький шрифт
    readonly property real ui_font_middle : mm*3.5;        // Средний   шрифт
    readonly property real ui_font_big    : mm*5;          // Большой   шрифт

    //******* Размеры ********
    readonly property real delete_button_width: mm*20;
    readonly property real cell_height: mm*10;
    readonly property real ui_actionbar_height: mm*10; // Высота верхней панели
    readonly property real ui_bottom_bar_height: mm*10;
    //******* Цвета приоритетов ********
    property var priority_colors:
    {
       'OK'       : "green",
       'WARNING'  : "orange",
       'CRITICAL' : "red",
       'INFO'     : "grey"
    }
}
