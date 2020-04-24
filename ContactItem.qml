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
    height: 72

    color: {
        if (selected)
            return "#ddd"
        if (area.containsMouse)
            return "#eee"
        return "#faf7f7"
    }

    RowLayout{
        anchors.fill: parent
        anchors.leftMargin: 5
        //        anchors.rightMargin: 5
        anchors.topMargin: 4
        Image{
            id:icon
            source: "icons/npp.jpg"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 7
            Layout.rightMargin: 20
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask
            }
        }
        ColumnLayout{
            height:parent.height
            RowLayout{
                Layout.topMargin: 10
                Layout.fillHeight: true
                anchors.right: parent.right
                anchors.rightMargin: 10
                Label{
                    id: lname
                    Layout.fillWidth: true
                    //                    font.bold: true
                    font.family: "Roboto"
                    font.pixelSize: 17
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignHCenter
                }
                Label{
                    id: time
                    text:"вчера"
                    Layout.fillWidth: true
                    font.family: "Roboto"
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignRight
                    color: "#888"
                }
            }
            RowLayout
            {
                Layout.fillHeight: true
                anchors.right: parent.right
                anchors.rightMargin: 10

                Label{
                    id: mess
                    Layout.fillWidth: true
                    //                    font.bold: true
                    font.family: "Roboto"
                    text: "Hey there! I am using WhatsApp."
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignHCenter
                }
                Label{
                    id: coun
                    text:"вчера"
                    Layout.fillWidth: true
                    font.family: "Roboto"
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignHCenter
                }
            }
            Rectangle{
                id:botrect
                Layout.fillWidth: true
                height: 14
                color: {
                    if (selected)
                        return "#ddd"
                    if (area.containsMouse)
                        return "#eee"
                    return "#faf7f7"
                }
                Rectangle {
                    height: 1
                    color: "#ddd"
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                }
            }
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
