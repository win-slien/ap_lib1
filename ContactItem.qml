import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
Rectangle {
    id:me
    property alias icon: icon.source
    property alias ltext: lname.text
    property alias mess: mess.text
    property alias time: time.text
    property alias coun: coun.text
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
            source: "icons/nnn.jpg"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 8
            Layout.rightMargin: 12
            Layout.leftMargin: 10
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
                Layout.rightMargin: 25
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
                    text:"только что"
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
                Layout.rightMargin: 25
                Label{
                    id: mess
                    Layout.fillWidth: true
                    font.family: "Roboto"
                    text: "Hey there! I am using WhatsApp."
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignHCenter
                    color: "#444"
                }
                Rectangle{
                    height: 20
                    width: 20
                    radius: 10
                    Text{
                        id: coun
                        text:"1"
                        anchors.fill: parent
                        font.family: "Roboto"
                        font.pixelSize: 13
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: {
                            if(text !== ""){
                                return "white"
                            }else
                            {
                                if (selected)
                                    return "#ddd"
                                if (area.containsMouse)
                                    return "#eee"
                                return "#faf7f7"
                            }
                        }
                    }
                    color: {
                        if(coun.text !== ""){
                            return "#11d13f"
                        }else
                        {
                            if (selected)
                                return "#ddd"
                            if (area.containsMouse)
                                return "#eee"
                            return "#faf7f7"
                        }
                    }
                }

            }
            Rectangle{
                id:botrect
                Layout.fillWidth: true
                height: 10
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
