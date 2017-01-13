import QtQuick 2.0

Item {

    Timer {
        id:bobing
        running:true
        interval: 2020
        repeat: true
        onTriggered: if(bobot.state == "bobup") {bobot.state = "bobdown"} else {bobot.state = "bobup"}
    }



    Image {
        id:bobot
        source:"qrc:Img/BeatBox1.png"
        fillMode:Image.PreserveAspectFit
        height:parent.height
        //anchors.bottom:parent.bottom
       // anchors.bottomMargin: parent.height * 0.08
       // anchors.right:parent.right
        x:parent.x+parent.width - width
        state:"bobdown"


        states: [
            State {

                name: "bobdown"
                PropertyChanges {
                    target: bobot
                    y:bobot.height * 0.01
                    x:parent.width - width -5
                }
            },
            State {

                name: "bobup"
                PropertyChanges {
                    target: bobot
                    y:-bobot.height * 0.01
                    x:parent.width - width + 5
                }
            }

        ]

        transitions: [
            Transition {
                from: "bobdown"
                to: "bobup"
                reversible: true

                NumberAnimation {
                    target: bobot
                    property: "y"
                    duration: 2000
                    easing.type: Easing.InOutQuad
                }

                NumberAnimation {
                    target: bobot
                    property: "x"
                    duration: 2010
                    easing.type: Easing.InOutQuad
                }
            }
        ]

    }

    Item {
        id:textBox
        width:parent.width * 0.5
        height:parent.height / 3
        anchors.right:parent.right
        anchors.rightMargin:parent.height * 0.4
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        anchors.bottomMargin:parent.height * 0.1
        visible: false

    Rectangle {
        anchors.fill:parent

        color:'black'
        opacity:0.8
        radius:8

    }

    Text {
        anchors.left:textBox.left
        anchors.top:textBox.top
        anchors.margins: parent.height * 0.02

        text:"test"
        color:"yellow"
        font.pixelSize: parent.height * 0.14
        font.family: pixeltext.name

    }

    }


}
