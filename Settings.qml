import QtQuick 2.3
import QtQuick.LocalStorage 2.0
/*
    Работа с настройками приложения
    в базе данных
 */
Item
{
    id: settings
    property var db: null;
    // @TOD Сделать настройку нескольких баз данных
    property string tablePrefix // Префикс название базы таблицы для хранения настроек
    property bool   ready: false
    signal loaded

    property var _cache: {return {};}

    //--------------------------------------------------------------------------
    // Установить значение переменной
    function set (name, value)
    {
        _cache[name] = value;

        var val = db_init.get (name, value);
        if (val === null) { db_init.push(name, value); }
                     else { db_init.update(name, value); }
    }

    //--------------------------------------------------------------------------
    // Получить значение переменной из кеша
    function get (name, default_value /* = undefined */)
    {
        var value = _cache[name];
        if (value === undefined)
        {
            // Пытаемся получить значение из БД.
            value = db_init.get(name);
            if (value === null) {
                return default_value;
            }

            switch (typeof default_value)
            {
                case 'number':
                    _cache[name] = parseInt (value, 10);
                    break;

                case 'boolean':
                    _cache[name] = (value !== "false") && (value != 0)

                default:
                    _cache[name] = value;
            }
        }
        return value;
    }

    //--------------------------------------------------------------------------
    // Удалить параметр
    function remove (name)
    {
        if (db_init.get(name) !== null) {
            db_init.transaction("DELETE FROM settings"+tablePrefix
                                +" WHERE name=\"" + name + "\"");
        }
    }

    //--------------------------------------------------------------------------
    // private
    QtObject
    {
        id: db_init

        //----------------------------------------------------------------------
        // Выполняет необходимую транзакцию
        function transaction (sql_query)
        {
            var rows = null;
            db.transaction(
                function(tx) {
                    rows = tx.executeSql(sql_query);
                }
            );
            return rows;
        }

        //----------------------------------------------------------------------
        // Возвращает значение параметра
        function get (name)
        {
            var rec = transaction ("SELECT value FROM Settings" + tablePrefix
                                   +" WHERE name=\""+ name + "\";");
            if (rec.rows.length <= 0) {
                return null;
            }
            else return rec.rows[0].value;
        }

        //----------------------------------------------------------------------
        // Вставляет новый параметр
        function push (name, value) {
            transaction("INSERT INTO settings" + tablePrefix
                        +" (value, name) VALUES (\"" + value +"\", \"" + name + "\")");
        }

        //----------------------------------------------------------------------
        // Обновляет значение параметры
        function update (name, value) {
            transaction("UPDATE settings" + tablePrefix +" SET value=\"" + value + "\" WHERE name=\"" + name + "\"");
        }

        //----------------------------------------------------------------------
        // Создает таблицу с параметрами
        function createTable() {
            transaction ("CREATE TABLE IF NOT EXISTS Settings" + tablePrefix
                         +" (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, value TEXT);");
        }
    }

    //----------------------------------------------------------------------------
    Component.onCompleted:
    {
        db = LocalStorage.openDatabaseSync("SettingsDB", "1.0", "Global settings" + tablePrefix +" if app.", 100000);
        db_init.createTable();
        ready = true;
        loaded ();
    }
}

