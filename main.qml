import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    visible : true
    width   : 360
    height  : 720

    Consts {
        id: consts;
    }

    MainForm
    {
    }


    // Модель сообщенй
    ListModel
    {
        id: messages_model
        ListElement {
            msg_is_readed : false
            msg_text      : "СКОМПИЛИЛАСЬ ТВОЯ ФЛasdasdasdasЕШКА!!!"
            msg_time      : "00:00:00"
            msg_priority      : 'OK'
        }
        ListElement {
            msg_is_readed : false
            msg_text      : "Зайди"
            msg_time      : "11:22:33"
            msg_priority      : 'WARNING'
        }
        ListElement {
            msg_is_readed : true
            msg_text      : "Привет, как твои дела?"
            msg_time      : "44:55:66"
            msg_priority      : 'CRITICAL'
        }
        ListElement {
            msg_is_readed : true
            msg_text      : "Всем быстренько на совещание!"
            msg_time      : "77:88:99"
            msg_priority      : 'INFO'
        }
    }
}
