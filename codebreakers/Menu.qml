import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id:window_container



        Text {
            id:title
            anchors.top:parent.top
            anchors.topMargin:parent.height * 0.1
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: parent.height * 0.09
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
                x:-width /2
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


        Column {
            id:options
            anchors.top:title.bottom
            anchors.topMargin: parent.height * 0.1
             //anchors.horizontalCenter: parent.horizontalCenter
            anchors.left:parent.left
            anchors.leftMargin:-parent.height * 0.1
             width:parent.width* 0.7
             height: parent.height * 0.6
             spacing:parent.height * 0.03


    Image {
       // anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.9
        height:window_container.height * 0.1
        source:"qrc:Img/Border3.png"



        Text {
            anchors.centerIn: parent
            text: "play"
            font.pixelSize: parent.height * 0.8
            font.family: pixeltext.name
            color:'white'
        }

        MouseArea {
            anchors.fill: parent
            onClicked: mainMenu.visible = false,game.visible = true
        }
    }


    Image {
       // anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.8
        height:window_container.height * 0.08
        source:"qrc:Img/Border3.png"



        Text {
            anchors.centerIn: parent
            text: "settings"
            font.pixelSize: parent.height * 0.5
            font.family: pixeltext.name
            color:'white'
        }
    }

    Item {
        //anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.9
        height:window_container.height * 0.08


    }


   /* Image {
       // anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.7
        height:window_container.height * 0.08
        source:"qrc:Img/Border3.png"



        Text {
            anchors.centerIn: parent
            text: "exit"
            font.pixelSize: parent.height * 0.5
            font.family: pixeltext.name
            color:'white'
        }

        MouseArea {
            anchors.fill:parent
            onClicked: Qt.quit()
        }
    }*/

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


Image {
    anchors.bottom:parent.bottom
    anchors.right:parent.right
    source:"Img/logo1-alpha.png"
    fillMode: Image.PreserveAspectFit
    width:parent.width * 0.1

}

}
