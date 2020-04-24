import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    signal newItem(string text)
    TextField{
        id: textField
        Layout.fillWidth: true
        selectByMouse: true
    }

    function add(){
        newItem(textField.text);
        textField.clear();
    }

    Button{
        text: "Добавить"
        onClicked: {
            newItem(textField.text);
            textField.clear();
        }
    }

    Keys.onEnterPressed:{
        add();
    }
    Keys.onReturnPressed:{
        add();
    }
}
