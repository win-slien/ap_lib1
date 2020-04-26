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
            nname: "This stupid zombie"
            iicon: "icons/3.jpg"
            mmess: "MMMMMUUUUUUUUUU I WILL KILL YOU!!"
            //            ttime: "сегодня"
            //            ccoun: "99"
        }
        ListElement{
            nname: "Wazzzuupp?"
            iicon: "icons/2.jpg"
            //            ttime: "вчера"
            //            ccoun: ""
        }
        ListElement{
            nname: "Small boy"
            iicon: "icons/1.jpg"
            //            ttime: "24.05.2020"
            //            ccoun: ""
        }
    }
    ColumnLayout{
        anchors.fill: parent
        MainToolBar{
            Layout.fillWidth: true
            onNewItem: {
                contactsModel.insert(0, {nname: text})
            }
        }
        ContactList{
            id:list
            model:contactsModel
            Layout.fillHeight: true
            Layout.fillWidth: true
            onMenu: {
                contactListMenu.popup();
            }
        }
    }

    Menu
    {
        id: contactListMenu
        modal: true
        MenuItem{
            text: "Удалить"
            onTriggered: {
                contactsModel.remove(list.menuIndex);
            }
        }
    }

}
