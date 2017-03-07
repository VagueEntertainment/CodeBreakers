import QtQuick 2.0
import QtGraphicalEffects 1.0

import "main.js" as Scripts

Item {
    id:window_container



        Text {
            id:title
            anchors.top:parent.top
            anchors.topMargin:parent.height * 0.1
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: if(orient == 2) {parent.height * 0.09} else {parent.height * 0.05}
            text:"<br>code<br>  breakers"
            font.family: pixeltext.name
            color:"Yellow"

            Rectangle {
                id:titlebacking
                z:-1
                radius:10
                color:"black"
                opacity:0.7
                anchors.centerIn:title
                anchors.verticalCenterOffset: parent.height * 0.1
                width:title.width * 1.3
                height:title.height
                //visible: false
            }

            Glow {
                source:titlebacking
                anchors.fill:titlebacking
                radius:10
                samples:14
                opacity: 0.7
                z:-1

            }

            Image {
                id:sys76
                x:if(orient == 2) {-width /2} else {-width / 3}
                y:-height /2
                height:parent.height * 0.8
                source:"qrc:Img/RB1.png"
                fillMode:Image.PreserveAspectFit

                Text {
                    anchors.left:parent.right
                    text:"in"
                    color:"white"
                    anchors.bottom:parent.bottom
                    anchors.bottomMargin: parent.height * 0.1
                    font.pixelSize: parent.height * 0.2
                }


            }

            DropShadow {
                   anchors.fill: sys76
                   horizontalOffset: 10
                   verticalOffset: 10
                   radius: 8.0
                   samples: 17
                   color: "#80000000"
                   source: sys76

               }
        }

      /*  Text {
            anchors.top:title.top
            anchors.left:title.right
            rotation: 35
            text:"Demo"
            color:"Orange"
            font.pixelSize: parent.height * 0.1
        } */


        Column {
            id:options
            anchors.top:title.bottom
            anchors.topMargin: parent.height * 0.1
             anchors.horizontalCenter: parent.horizontalCenter
            //anchors.left:parent.left
            //anchors.leftMargin:-parent.height * 0.1
             width:if(orient == 2) {parent.width* 0.7} else {parent.width * 0.98}
             height: parent.height * 0.6
             spacing:parent.height * 0.03
             clip:true


             Image {
                 anchors.horizontalCenter: parent.horizontalCenter
                 width:parent.width * 0.9
                 height:window_container.height * 0.1
                 source:"qrc:Img/Border3.png"

                clip:true

                 Text {
                     anchors.centerIn: parent
                     text: "single player"
                     font.pixelSize: parent.height * 0.5
                     font.family: pixeltext.name
                     color:'white'
                 }
                 MouseArea {
                     anchors.fill: parent
                     //onClicked: Scripts.cleargame(),mainMenu.visible = false,game.visible = true
                     onClicked: /*Scripts.cleargame(),*/ mainMenu.visible = false, challenges.visible = true
                 }
             }



    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.8
        height:window_container.height * 0.1
        source:"qrc:Img/Border3.png"


        clip:true

        Text {
            anchors.centerIn: parent
            text: "multiplayer"
            font.pixelSize: parent.height * 0.5
            font.family: pixeltext.name
            color:'gray'
        }
        MouseArea {
            anchors.fill: parent
            //onClicked: Scripts.cleargame(),mainMenu.visible = false,game.visible = true
            onClicked: /*Scripts.cleargame(),*/mainMenu.visible = false, select_player.visible = true
        }



    }



    Item {
        //anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.9
        height:window_container.height * 0.06


    }


    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.7
        height:window_container.height * 0.08
        source:"qrc:Img/Border3.png"

        clip:true

        Text {
            anchors.centerIn: parent
            text: "score board"
            font.pixelSize: parent.height * 0.5
            font.family: pixeltext.name
            color:'white'
        }

        MouseArea {
            anchors.fill:parent
            onClicked: endScreen.mode = 0,endScreen.visible = true
        }
    }

    }

        DropShadow {
               anchors.fill: options
               horizontalOffset: 10
               verticalOffset: 10
               radius: 8.0
               samples: 17
               color: "#80000000"
               source: options

           }


        Text {
            anchors.bottom:parent.bottom
            anchors.left:parent.left
            anchors.margins: parent.height * 0.02
            width:parent.width * 0.8
            wrapMode: Text.WordWrap
            color:"white"
            text: " Created by Vague Entertainment, in association with System76, ."
        }


Image {
    anchors.bottom:parent.bottom
    anchors.right:parent.right
    source:"Img/logo1-alpha.png"
    fillMode: Image.PreserveAspectFit
    width:parent.width * 0.2

    Text {
        anchors.bottom:parent.bottom
        anchors.right:parent.right
        //anchors.bottomMargin:parent.height * 0.2
        color:"white"
        text:"1.0"
    }
}

}
