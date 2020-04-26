import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    signal newItem(string text)

    TextField{
        id: textField
        placeholderText: "Введите имя"
        Layout.fillWidth: true
        Layout.topMargin: 4
        Layout.leftMargin: 5
        selectByMouse: true
        focus: true
        color: "black"
        background: Rectangle {
            implicitHeight: 40
            radius: 2
            color: "#faf7f7"
            anchors.fill: parent
            border.color: "#444"
            border.width: 1
        }

    }

    function add(){
        newItem(textField.text);
        textField.clear();
    }

    Button{
        Layout.topMargin: 4
        Layout.rightMargin: 5
        text: "Добавить"
        contentItem: Text {
            text: parent.text
            font: parent.font
            opacity: enabled ? 1.0 : 0.3
            color: parent.down ? "#888" : "#444"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            color: "#faf7f7"
            border.color: parent.down ? "#888" : "#444"
            border.width: 1
            radius: 2
        }

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
