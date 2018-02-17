import QtQuick 2.6

Item {

    id: sceneDinamicForm

    property int durationAnimation: 450
    property int intervalCircle: 500

    PropertyAnimation {
        id: animationWindows_0
        target: dinamicCircle
        properties: "x"
        from: 600; to: 0
        duration: durationAnimation
        running: true
    }

    PropertyAnimation {
        id: animationWindows_1
        target: dinamicCircle
        properties: "x"
        from: 0; to: -600
        duration: durationAnimation
        running: false
    }

    Item {
        id: dinamicCircle

        Timer {
            id: timerRecursionCircle
            interval: intervalCircle
            running: true
            repeat: true
            onTriggered: function startDinamicCircle() {
                var component = Qt.createComponent("DinamicCircle.qml");
                if (component.status === Component.Ready) {
                    component.createObject(dinamicCircle);
                }
            }
        }
    }

    Timer {
        id: slideTimer
        interval: 3000
        running: true
        repeat: false
        onTriggered: function startSlide() {
            animationWindows_1.running = true;
            pageLoader.active = true;
            timerRecursionCircle.stop();
        }
    }

    Loader {
        id: pageLoader
        active: false
        source: "qrc:/qml/FormTwo.qml"
    }
}
