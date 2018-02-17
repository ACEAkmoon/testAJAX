import QtQuick 2.6

Rectangle {
    property alias mouseArea: mouseArea
    property alias text: buttonGreenTXT.text
    property alias bttn: buttonGreen

    id: buttonGreen

    width: 300
    height: 100
    color: mouseArea.pressed ? "#60E3AB" : "transparent"
    border.width: 3
    border.color: "#60E3AB"

    Text {
        id: buttonGreenTXT

        text: qsTr("")
        font.pixelSize: 24
        color: "white"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        onEntered: parent.border.color = "gray"
        onExited: parent.border.color = "#60E3AB"
        //onClicked: buttonGreenTXT.text = qsTr("-> ...")
    }
}
