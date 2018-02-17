import QtQuick 2.6

Rectangle {

    property alias underliningRect: underliningRect

    id: underliningRect

    width: parent.width
    height: 2
    color: "#60E3AB"

    anchors {
        top: parent.bottom
        topMargin: 7
    }
}
