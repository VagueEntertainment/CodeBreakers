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
        onTriggered: bobot.visible = true,gameBoard1.islocked =1,Scripts.nextLine(level),textBox.visible = true,dialog.running = true
    }

    Timer {
        id:dialog
        running:false
        interval:messagedur
        repeat:false
        onTriggered: if(level > 0) {if(orient == 2) {bobot.visible = true} else {bobot.visible = false}
                                            textBox.visible = false;
                                            emotion = 0;
                                            infoWindow.state = "Show";
                                        }
    }


    Image {
        id:bobot
        source:switch(emotion) {

               case 0:if(gameBoard1.mode !=2) {"qrc:Img/RB/BeatBox_Open.png"} else {"qrc:Img/RB/MP/2_Open.png"};break;
               case 1:if(gameBoard1.mode !=2) {"qrc:Img/RB/BeatBox_Happy.png"} else {"qrc:Img/RB/MP/2_Happy.png"};break;
               case 2:if(gameBoard1.mode !=2) {"qrc:Img/RB/BeatBox_Open_Pointing.png"}else {"qrc:Img/RB/MP/2_Open.png"};break;
               case 3:if(gameBoard1.mode !=2) {"qrc:Img/RB/BeatBox_Happy_Pointing.png"}else {"qrc:Img/RB/MP/2_Open.png"};break;
               case 4:if(gameBoard1.mode !=2) {"qrc:Img/RB/BeatBox_Happy_HandsUp.png"}else {"qrc:Img/RB/MP/2_Open.png"};break;

               case 5:if(gameBoard1.mode !=2) {"qrc:Img/RB/BeatBox_Confused_HandsUp.png"}else {"qrc:Img/RB/MP/2_Open.png"};break;
               case 6:if(gameBoard1.mode !=2) {"qrc:Img/RB/BeatBox_Confused_HandsOut.png"}else {"qrc:Img/RB/MP/2_Open.png"};break;
               case 7:if(gameBoard1.mode !=2) {"qrc:Img/RB/BeatBox_Angry_HandsUp.png"}else {"qrc:Img/RB/MP/2_Open.png"};break;
               case 8:if(gameBoard1.mode !=2) {"qrc:Img/RB/BeatBox_Angry_HandsOut.png"}else {"qrc:Img/RB/MP/2_Open.png"};break;

               }

        fillMode:Image.PreserveAspectFit
        height:if(orient == 2) {parent.height * 1.1} else {parent.height *1.5}
        //anchors.bottom:parent.bottom
       // anchors.bottomMargin: parent.height * 0.08
       // anchors.right:parent.right
        x:parent.x+parent.width - width
        state:"bobdown"
        z:1


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
        width:if(orient == 2) {parent.width * 0.45} else {parent.width * 0.9}
        height:if(orient == 2) {parent.height / 3} else {parent.height * 0.6}
        anchors.right:parent.right
        anchors.rightMargin:if(orient == 2) {parent.height * 0.6} else {parent.height * 0.03}
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom:parent.bottom
        anchors.bottomMargin:if(orient == 2) {parent.height * 0.1} else {parent.height * 0.35}
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
        font.pixelSize: if(orient == 2) {parent.height * 0.14} else {parent.height * 0.08}
        font.family: pixeltext.name

    }

    }


}
