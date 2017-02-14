import QtQuick 2.0
import QtGraphicalEffects 1.0
import "main.js" as Scripts

Item {

    id:window_container
   // onVisibleChanged: if(visible == true) {Scripts.scoreboardLoad()} else {Scripts.scoreboardLoad()}
   // Component.onCompleted: Scripts.scoreboardLoad()

    Image {
        id:backing
        anchors.centerIn: parent
        width:parent.height / 1.2
        height:parent.height * 0.96
        source:"qrc:/Img/Border1.png"
        //fillMode: Image.PreserveAspectFit
        visible: true


        Image {
             anchors.centerIn:backing
             width:backing.width * 0.98
             height:backing.height * 0.93
             source:"qrc:Img/Grid.png"
             fillMode: Image.Tile

             opacity: 0.2

         }

    }

    Text {
        id:title
        text:"challenges"
        font.family: pixeltext.name
        font.pixelSize: parent.height * 0.06
        color:"Yellow"
        anchors.horizontalCenter:backing.horizontalCenter
        anchors.top:backing.top
        anchors.topMargin: parent.height * 0.03
    }

    ListView {
        anchors.top:title.bottom
        anchors.topMargin: parent.height * 0.01
        anchors.bottom:backing.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width:backing.width * 0.95
       // height:backing.height * 0.9
        clip:true
        spacing:parent.height * 0.03
       // anchors.centerIn: backing

        model: ListModel {

            ListElement {
                gamename:"standard"
            }

            ListElement {
                gamename:"time attack"
                locked:true
            }

            ListElement {
                gamename:"vs bot"
                locked:true
            }

            ListElement {
                gamename:"random"
                locked:true
            }

        }

        delegate: Item {
            width:parent.width * 0.95
            height:window_container.height * 0.1
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id:border
                source:"qrc:/Img/Border3.png"
                anchors.fill:parent
            }
            Glow {
                anchors.fill:border
                source:border
                radius:3


            }

            Text {
                anchors.left:parent.left
                anchors.leftMargin:parent.height * 0.08
                anchors.verticalCenter: parent.verticalCenter
                font.family: pixeltext.name
                font.pixelSize: parent.height * 0.5
                text:gamename
                color:"Yellow"
            }

            Image {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right:parent.right
                anchors.rightMargin: parent.height * 0.4
                source:"qrc:/Img/lock.png"
                width:parent.height * 0.6
                height:parent.height * 0.6
                opacity:0.4
                visible: locked
            }

            MouseArea {
                anchors.fill: parent
                enabled:if(locked == true) {false} else {true}
                onClicked: {Scripts.cleargame();
                            mainMenu.visible = false;
                            challenges.visible = false;
                            //gamemode = index;
                            game.visible = true;
                            Scripts.startgame(index);

                }

            }

        }

        add: Transition {
            NumberAnimation { properties: "x,y"; duration: 1000 }
        }

    }



}
