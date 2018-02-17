import QtQuick 2.6

Item {
    property alias txt: txt
    property alias flagBtnIn: flagBtnIn
    property alias mouseArea: buttonGreenMouseArea

    id: itemTXT

    height: 20
    width: 80
    visible: true

    anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter   
    }

    Rectangle {
        id: flagBtn

        border.color: "gray"
        width: 25
        height: 25
        color: "#3E3E3E"

        anchors {
            right: txt.left
            rightMargin: 13
        }

        Rectangle {
            id: flagBtnIn

            width: 19
            height: 19
            color: "#60E3AB"
            visible: false
            anchors.centerIn: parent
        }

        MouseArea {
            id: buttonGreenMouseArea

            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "#60E3AB"
            onExited: parent.border.color = "gray"

            onClicked: if (flagBtnIn.visible === false) {
                           flagBtnIn.visible = true
                           txt.color = "white"
                       } else if (flagBtnIn.visible === true) {
                           flagBtnIn.visible = false
                           txt.color = "#6D6D6D"
                       }
        }
    }

    Text {
        id: txt

        visible: true
        text: qsTr("")
        height: 20
        font.pixelSize: 20
        color: "#777777"

        anchors {
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: 0
            left: parent.left
        }
    }
}
