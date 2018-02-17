import QtQuick 2.6

Item {
    property alias textInputQR: textInputQR
    property alias underlining: underlining

    id: itemTXT
    height: 20
    width: 300
    visible: true

    anchors {
        horizontalCenter: parent.horizontalCenter
        top: parent.top
    }

    TextInput {
        id: textInputQR
        width: parent.width
        height: 20
        text: qsTr("")
        font.pixelSize: 20
        color: textInputQR.cursorVisible ? changeColor() : "#777777"
        anchors.left: parent.left
        maximumLength: 20

        function changeColor(){textInputQR.color = "white"}
    }

    Underlining {
        id: underlining
        visible: true
    }
}
