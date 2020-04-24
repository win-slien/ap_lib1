import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 400
    height: 480
    title: qsTr("Контакты")
    color: "#faf7f7"

    ListModel{
        id: contactsModel
        ListElement{
            name: "This stupid zombie"
            sicon: "icons/3.jpg"
        }
        ListElement{
            name: "Wazzzuupp?"
            sicon: "icons/2.jpg"
        }
        ListElement{
            name: "Small boy"
            sicon: "icons/1.jpg"
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
