import QtQuick 2.6

Item {
    id: formOneWind

    property int btnAndTextMargin: 50
    property int durationAnimation: 350

    property var textInput_0: qsTr("First name")
    property var textInput_1: qsTr("Second name")
    property var textInput_2: qsTr("Phone number")

    property bool enableFirstName: buttonAndText_0.flagBtnIn.visible === true ? true : false
    property bool enableSecondName: buttonAndText_1.flagBtnIn.visible === true ? true : false
    property bool enablePhoneNumber: buttonAndText_2.flagBtnIn.visible === true ? true : false

    PropertyAnimation {
        id: animationWindows
        target: formOne
        properties: "x"
        from: 0; to: -600
        duration: durationAnimation
        running: false
    }

    PropertyAnimation {
        id: animationWindowsBack
        target: formOne
        properties: "x"
        from: -600; to: 0
        duration: durationAnimation
        running: true
    }

    Item {
        id: formOne

        width: 600
        height: 800

        ButtonAndText {
            id: buttonAndText_0
            txt.text: textInput_0
            txt.color: "#6D6D6D"
            anchors {
                top: parent.top
                topMargin: 250
            }
        }

        ButtonAndText {
            id: buttonAndText_1
            txt.text: textInput_1
            txt.color: "#6D6D6D"
            anchors {
                top: buttonAndText_0.bottom
                topMargin: btnAndTextMargin
            }
        }

        ButtonAndText {
            id: buttonAndText_2
            txt.text: textInput_2
            txt.color: "#6D6D6D"
            anchors {
                top: buttonAndText_1.bottom
                topMargin: btnAndTextMargin
            }
        }

        Button {
            id: buttonNext
            text: qsTr("Next")
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: 120
            }

            mouseArea.onClicked: function startSlide() {
                animationWindows.running = true;
                pageLoader.active = true;
            }
        }
    }

    Loader {
        id: pageLoader
        active: false
        source: "qrc:/qml/FormDinamic.qml"
    }
}
