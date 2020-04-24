import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 400
    height: 480
    title: qsTr("WhatsApp Contacts Clone")
    color: "#faf7f7"

    ListModel{
        id: contactsModel
        ListElement{
            name: "This stupid zombie"
            sicon: "icons/3.jpg"
            mmess: "MMMMMUUUUUUUUUU I WILL KILL YOU!!"
            ttime: "сегодня"
            ccoun: ""
        }
        ListElement{
            name: "Wazzzuupp?"
            sicon: "icons/2.jpg"
            ttime: "вчера"
        }
        ListElement{
            name: "Small boy"
            sicon: "icons/1.jpg"
            ttime: "24.05.2020"
        }
    }
ColumnLayout{
    anchors.fill: parent
    MainToolBar{
        Layout.fillWidth: true
        onNewItem: {
            contactsModel.insert(0, {name: text})
        }
    }
    ContactList{
        model:contactsModel
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}

}
