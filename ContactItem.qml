import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Rectangle {
    id:me
    property alias icon: icon.source
    property alias name: name.text
    width: parent.width
    height: 60

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
        }
        Label{
            id: name
            Layout.fillWidth: true
            font.bold: true
        }
    }
}
