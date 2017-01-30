import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id:window_container

    property string message: "level:"
    property int played: 0

    states: [
        State {
            name: "Hide"
            PropertyChanges {
                target: window_container
                y:parent.height * 1.2

            }
        },

        State {
            name:"Show"
            PropertyChanges {
                target: window_container
                y:parent.height /2 - (window_container.height /2)
            }
        }

    ]

    transitions: [
        Transition {
            from: "Hide"
            to: "Show"
            reversible: true

            NumberAnimation {
                target: window_container
                property: "y"
                duration: 400
                easing.type: Easing.InOutQuad
            }
        }
    ]

    onStateChanged: if(state == "Show") { message = "level:"+level,starttext.running = true}


    Timer {
        id:starttext
        running:false
        repeat:false
        interval: 2000
        onTriggered:message = "start",hide.running = true
    }

    Timer {
        id:hide
        running:false
        repeat:false
        interval:400
        onTriggered: window_container.state = "Hide",played = 1
    }



    Rectangle {
        id:backing
        anchors.fill: parent
        color:"black"
        opacity:0.5
        radius:8

    }

    Glow {
        radius:8
        samples:17
        source:backing
        anchors.fill:backing
        opacity:0.5
    }

    Text {
        anchors.centerIn: parent
        font.family: pixeltext.name
        font.pixelSize: parent.height * 0.3
        text:message
        color:"White"
    }



}
