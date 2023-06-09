import QtQuick 2.1

Image {
    id: root
    source: "images/background.png"
    fillMode: Image.PreserveAspectCrop

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }
    Image {
        id: topRect
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height /3
        source: "images/rectangle.svg"
        Image {
            source: "images/icon.png"
            width: 128
            height: 128
            anchors.centerIn: parent
        }
        Rectangle {
            radius: 3
            color: "#c0444444"
            anchors {
                bottom: parent.bottom
                bottomMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            height: 6
            width: height*36
            Rectangle {
                radius: 3
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                width: (parent.width / 6) * (stage - 1)
                color: "#ffffffff"
                Behavior on width { 
                    PropertyAnimation {
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false
        ParallelAnimation {
            PropertyAnimation {
                property: "opacity"
                target: topRect
                from: 0
                to: 1
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }

            PropertyAnimation {
                property: "opacity"
                target: bottomRect
                from: 0
                to: 1
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }
    }
}
