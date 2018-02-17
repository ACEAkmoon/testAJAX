import QtQuick 2.6
//import "FormOne.qml" as TMP

Item {
    id: sceneTwoForm

    property int textInputMargin: 70
    property int durationAnimation: 350

    property alias mouseArea: mouseArea

    PropertyAnimation {
        id: animationWindows
        target: sceneTwo
        properties: "x"
        from: 600; to: 0
        duration: durationAnimation
        running: true
    }

    PropertyAnimation {
        id: animationWindowsBack
        target: sceneTwo
        properties: "x"
        from: 0; to: 600
        duration: durationAnimation
        running: false
    }

    Item {
        id: sceneTwo

        width: 600
        height: 800

        MouseArea {
            id: mouseArea
            anchors.fill: parent

            TextInputQR {
                id: textInputQR_0

                textInputQR.text: textInputQR_0.textInputQR.cursorVisible ? changeTxt() : textInput_0
                visible: enableFirstName
                anchors.topMargin: textInputQR_2.visible ?
                                       (textInputQR_1.visible ? 100 : 200) : (textInputQR_1.visible ? 200 : 300)

                function changeTxt(){textInputQR_0.textInputQR.text = qsTr("")}
            }

            TextInputQR {
                id: textInputQR_1

                textInputQR.text: textInputQR_1.textInputQR.cursorVisible ? changeTxt() : textInput_1
                visible: enableSecondName
                anchors {
                    top: textInputQR_0.bottom
                    topMargin: textInputQR_2.visible ? textInputMargin : textInputMargin + 5
                }

                function changeTxt(){textInputQR_1.textInputQR.text = qsTr("")}
            }

            TextInputQR {
                id: textInputQR_2

                textInputQR.text: textInputQR_2.textInputQR.cursorVisible ? changeTxt() : textInput_2
                visible: enablePhoneNumber
                anchors {
                    top: textInputQR_1.bottom
                    topMargin: textInputQR_1.visible ? textInputMargin : - 15
                }

                function changeTxt(){textInputQR_2.textInputQR.text = qsTr("")}
            }

            Text {
                id: textResult

                height: 20
                width: 300
                text: qsTr("Result")
                color: "#777777"
                font.pixelSize: 20
                maximumLineCount: 1
                elide: Text.ElideRight

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: 505
                }

                Underlining {
                    id: underlining
                    visible: true
                    color: "#808080"
                    anchors.topMargin: 10
                }
            }
        }

        Button {
            id: buttonTop
            text: qsTr("Join")

            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: 15
            }

            mouseArea.onClicked: function startJoin() {
                if (!textInputQR_0.visible && !textInputQR_1.visible && !textInputQR_2.visible) {
                    textResult.text = "Error Result"
                } else if (textInputQR_0.textInputQR.text === textInput_0 &&
                           textInputQR_1.textInputQR.text === textInput_1 &&
                           textInputQR_2.textInputQR.text === textInput_2 ||
                           textInputQR_0.textInputQR.text === "" &&
                           textInputQR_1.textInputQR.text === "" &&
                           textInputQR_2.textInputQR.text === "") {
                    textResult.text = "Please enter info"
                } else {
                    textResult.text = (textInputQR_0.visible && textInputQR_0.textInputQR.text !== textInput_0 ?
                                           textInputQR_0.textInputQR.text : "") + " " +
                            (textInputQR_1.visible && textInputQR_1.textInputQR.text !== textInput_1 ?
                                 textInputQR_1.textInputQR.text : "") + " " +
                            (textInputQR_2.visible && textInputQR_2.textInputQR.text !== textInput_2 ?
                                 textInputQR_2.textInputQR.text : "")
                }
                textResult.color = "white"
            }
        }

        Button {
            id: buttonBottom
            text: qsTr("Back")

            anchors {
                left: buttonTop.left
                right: buttonTop.right
                top: buttonTop.bottom
                topMargin: 100
            }

            mouseArea.onClicked: function startSlideBack() {
                animationWindowsBack.running = true;
                pageLoader.active = true;
            }
        }
    }

    Loader {
        id: pageLoader
        active: false
        source: "qrc:/qml/FormOne.qml"
    }
}
