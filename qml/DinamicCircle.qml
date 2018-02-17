import QtQuick 2.6

Item {
    property int durationAnim: 1400

    id: dinamicCircle

    width: 600
    height: 800
    visible: true

    ParallelAnimation {
        running: true

        PropertyAnimation {target: circle; properties: "width,height,radius"; from: 20; to: 270; duration: durationAnim}
        PropertyAnimation {target: circleInner; properties: "width,height,radius"; from: 0; to: 250; duration: durationAnim}

        onStopped: {
            circle.width = 0; circle.height = 0; circle.radius = 0; circle.visible = false
            circleInner.width = 0; circleInner.height = 0; circleInner.radius = 0; circleInner.visible = false
        }
    }

    Rectangle {
        id: circle
        gradient: Gradient {GradientStop {ColorAnimation on color {from: "#FFFFFF"; to: "#3E3E3E"; duration: durationAnim}}}

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: circleInner
            color: "#3E3E3E"

            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
        }
    }
}
