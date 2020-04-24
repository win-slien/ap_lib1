import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 320
    height: 480
    title: qsTr("Контакты")

    ListModel{
        id: contactsModel
        ListElement{
            name: "Ирина"
        }
        ListElement{
            name: "Настя"
        }
        ListElement{
            name: "Дамир"
        }
    }
ColumnLayout{
    anchors.fill: parent
    MainToolBar{
        Layout.fillWidth: true
        onNewItem: {
            contactsModel.append({name: text})
        }
    }
    ContactList{
        model:contactsModel
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}

}
