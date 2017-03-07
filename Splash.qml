import QtQuick 2.0

Item {
    id:window_container
    states: [

        State {
            name:"Show"

            PropertyChanges {
                target: window_container
                opacity: 1
                x:0
            }
        },

        State {
            name:"Hide"

                PropertyChanges {
                    target:window_container
                    opacity:0
                    x:parent.height
                }
        }

    ]

    transitions: [

        Transition {
            from: "Show"
            to: "Hide"


            NumberAnimation {
                target: window_container
                property: "opacity"
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        }

    ]

    onStateChanged: if(window_container.state =="Show") {fadeout.running = true}

    Timer {
        id:fadeout
        running:false
        repeat:false
        interval: 1000
        onTriggered:window_container.state = "Hide"
    }

    Rectangle {
        anchors.fill: parent
        color:"black"
    }


    Image {
        //anchors.fill: parent
        anchors.centerIn: parent
       width:parent.width
        height:parent.height
        fillMode:Image.PreserveAspectFit
        source:"qrc:/Img/splash.png"

    }

}

