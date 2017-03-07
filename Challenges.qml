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
        width:if(orient ==2) {parent.height / 1.2} else {parent.height / 1.8}
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
        font.pixelSize: if(orient ==2) {parent.height * 0.06} else {parent.height * 0.04}
        color:"Yellow"
        anchors.horizontalCenter:backing.horizontalCenter
        anchors.top:backing.top
        anchors.topMargin: parent.height * 0.03
    }

    ListView {
        anchors.top:title.bottom
        anchors.topMargin: if(orient == 2) {parent.height * 0.01} else {parent.height * 0.04}
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
                themode:0
            }

            ListElement {
                gamename:"time attack"
                locked:false
                themode:2
            }

            ListElement {
                gamename:"random"
                locked:false
                themode:3
            }

            ListElement {
                gamename:"vs bot"
                locked:true
                themode:4
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
                anchors.rightMargin: parent.height * 0.1
                source:"qrc:/Img/lock.png"
                width:parent.height * 0.6
                height:parent.height * 0.6
                opacity:0.4
                visible: locked
            }

            MouseArea {
                anchors.fill: parent
                enabled:if(locked == true) {false} else {true}
                onClicked: {//Scripts.cleargame();
                            mainMenu.visible = false;
                            challenges.visible = false;
                            //gamemode = index;
                            gameBoard1.mode = themode;
                            game.visible = true;
                            Scripts.startgame(index);

                }

            }

        }

        add: Transition {
            NumberAnimation { properties: "x,y"; duration: 1000 }
        }

    }

    Text {
        anchors.horizontalCenter: backing.horizontalCenter
        anchors.bottom:backing.bottom
        anchors.bottomMargin: backing.height * 0.05
        color:"Yellow"
        text:"main menu"
        font.family: pixeltext.name
        font.pixelSize: backing.height * 0.02

        MouseArea {
            anchors.fill: parent
            onClicked: {window_container.visible = false,
                endScreen.visible = false,mainMenu.visible = true }
        }
    }


}
