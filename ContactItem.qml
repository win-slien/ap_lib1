import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
Rectangle {
    id:me
    property alias icon: icon.source
    property alias ltext: lname.text
    property bool selected: false

    signal leftClick()
    signal rightClick()

    width: parent.width
    height: 80

    color: {
        if (selected)
            return "#add"
        if (area.containsMouse)
            return "#ddd"
        return "#fff"
    }

    RowLayout{
        anchors.fill: parent
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        Image{
            id:icon
            source: "icons/npp.jpg"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 7
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask
            }
        }
        Label{
            id: lname
            Layout.fillWidth: true
            font.bold: true
        }
    }

    Rectangle {
        id: mask
        width: me.height
        height: me.height
        radius: me.height/2
        visible: false
    }

    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if(mouse.button === Qt.LeftButton)
                leftClick();
            if(mouse.button === Qt.RightButton)
                rightClick();
        }
    }
}
