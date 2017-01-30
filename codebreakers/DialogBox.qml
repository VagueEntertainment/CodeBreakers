import QtQuick 2.0
import "main.js" as Scripts

Item {
    property int level: 0
    property string message: " "
    property int emotion:0
    property int messagedur:1000

    Timer {
        id:bobing
        running:true
        interval: 2020
        repeat: true
        onTriggered: if(bobot.state == "bobup") {bobot.state = "bobdown"} else {bobot.state = "bobup"}
    }

    onLevelChanged: startdialog.running = true

    Timer {
        id:startdialog
        running:false
        interval:1000
        repeat:false
        onTriggered: gameBoard.islocked =1,Scripts.nextLine(level),textBox.visible = true,dialog.running = true
    }

    Timer {
        id:dialog
        running:false
        interval:messagedur
        repeat:false
        onTriggered: if(level > 0) {textBox.visible = false,emotion = 0,infoWindow.state = "Show"}
    }


    Image {
        id:bobot
        source:switch(emotion) {

               case 0:"qrc:Img/RB/BeatBox_Open.png";break;
               case 1:"qrc:Img/RB/BeatBox_Happy.png";break;
               case 2:"qrc:Img/RB/BeatBox_Open_Pointing.png";break;
               case 3:"qrc:Img/RB/BeatBox_Happy_Pointing.png";break;
               case 4:"qrc:Img/RB/BeatBox_Happy_HandsUp.png";break;

               case 5:"qrc:Img/RB/BeatBox_Confused_HandsUp.png";break;
               case 6:"qrc:Img/RB/BeatBox_Confused_HandsOut.png";break;
               case 7:"qrc:Img/RB/BeatBox_Angry_HandsUp.png";break;
               case 8:"qrc:Img/RB/BeatBox_Angry_HandsOut.png";break;

               }

        fillMode:Image.PreserveAspectFit
        height:parent.height * 1.1
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
        width:parent.width * 0.45
        height:parent.height / 3
        anchors.right:parent.right
        anchors.rightMargin:parent.height * 0.2
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        anchors.bottomMargin:parent.height * 0.1
        visible: false
        clip:true

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
        width:textBox.width
        wrapMode: Text.WordWrap
        text:message
        color:"yellow"
        font.pixelSize: parent.height * 0.14
        font.family: pixeltext.name

    }

    }


}
