import QtQuick 2.2
import QtQuick.Window 2.1

Window
{
    visible : true
    width   : 360
    height  : 720

    property var  http_request : new XMLHttpRequest()

    Consts {
        id: consts;
    }

    Settings {
        id: settings
    }

    MainForm
    {
    }

    // Модель сообщенй
    ListModel
    {
        id: messages_model
    }

    Timer
    {
        id       : update_timer
        interval : consts.server_timer_interval;
        repeat   : true
        running  : true

        onTriggered: sendQuery()
    }

    function sendQuery() {
        var server_address = settings.get("server_address", "");
        var login = settings.get("login", "");

        if (server_address === "" || login === "") {
            return ;
        }

        var _query = server_address + "/?user=" + login;
        http_request.open("GET", _query)
        http_request.send();
    }

    function parseResonse(response) {

    }

    Component.onCompleted: {
        http_request.onreadystatechange = ready
    }

    // готово для загрузки
    function ready()
    {
        if (http_request.readyState === XMLHttpRequest.DONE)
        {
            if (http_request.status !== 200 ) {
                return
            }

            var response_text = http_request.responseText;
            var msgs = response_text.split("\n");
            for (var i=0; i < msgs.length; ++i)
            {
                var msg = msgs[i].split("|");
                if (msg.length < 3) {
                    return ; // Ошибка неверный формат
                }
                var p = parseInt(msg[1]);
                var priority = "ok";
                switch (p) {
                    case 0: priority= "OK"; break;
                    case 1: priority= "WARNING";break;
                    case 2: priority= "CRITICAL";break;
                    case 3: priority= "INFO";break;
                }

                var msg_ =
                {
                    msg_is_readed : false,
                    msg_text      : msg[2],
                    msg_time      : msg[0],
                    msg_priority  : priority
                }
                messages_model.insert(0,msg_)
            }
        }
    }
}
