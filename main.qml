import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

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


    ListView{
        id:list
        anchors.fill: parent
        model:contactsModel
        delegate: ContactItem{
            ltext: name
            selected: list.currentIndex === index
            onLeftClick: {
                list.currentIndex = index
            }
        }
    }
}
