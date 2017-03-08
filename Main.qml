import QtQuick 2.5
import QtQuick.Controls 1.4
//import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import QtQuick.Layouts 1.3

import QtQuick.LocalStorage 2.0 as Sql



import "main.js" as Scripts

/*!
    brief MainView with a Label and Button elements.
*/

ApplicationWindow {
    // objectName for functional testing purposes (autopilot-qt5)
  //  objectName: "mainView"

   // applicationName: "codebreakers.vagueentertainment"

    //width: units.gu(175)
    //height: units.gu(150)
    width:Screen.width
    height:Screen.height
    visible: true


    property var db : Sql.LocalStorage.openDatabaseSync("UserInfo", "1.0", "Local UserInfo", 1);
    property int reset: 0


    property int hiscore:0


    property int numofplayers: 4

    property string name: "ABC"
    property string date: "No Date"

    property string devId: "Vag-01001011"
    property string appId: "sys76Cod-0115"
    property int gamemode: 0

    property var dict: [""]

    property double orient: Screen.primaryOrientation



   // Component.onCompleted: console.log("current Orientation "+orient)

    FontLoader { id: pixeltext; source: "qrc:/Font/ROBOTICA.TTF" }


    Item {
            anchors.fill:parent

        Background1 {
            id:bg
            width:parent.width
            height:parent.height
        }


        CBMenu {
            id:mainMenu
            width:parent.width
            height:parent.height
            //visible:false
        }

        Item {
            id:game
            width:parent.width
            height:parent.height
            visible:false


            //onVisibleChanged: if(visible == true)

        Game1 {
            id:gameBoard1

            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin: parent.height * 0.01
            width:if(orient == 2) {parent.width / 2.5} else {parent.width}
            anchors.left:parent.left
            anchors.leftMargin: parent.height * 0.01
            height:parent.height * 0.96
           // clip:true
            visible: false
            //mode:0
        }

        ScoreBoard {
            id:scoreBoard

            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin: if(orient ==2) {parent.height * 0.01} else {parent.height * 0.03}
            anchors.right:parent.right
            anchors.rightMargin: if(orient ==2) {parent.height * 0.01} else {parent.width * 0.6}
            width:if(orient ==2) {parent.height * 0.48} else {parent.height * 0.24}
            height:if(orient ==2) {parent.height * 0.55} else {parent.height * 0.26}
        }


    DialogBox {
        id:talkingBox
        width:parent.width
        height:if(orient == 2) {parent.height / 2} else {parent.height}

        anchors.right:parent.right
        anchors.bottom:parent.bottom
        //visible: false
    }


    Info {
        id:infoWindow
        anchors.horizontalCenter: parent.horizontalCenter
        width:if(orient ==2) {parent.width * 0.6}  else {parent.width * 0.9}
        height:parent.height * 0.3
        state:"Hide"
    }

        }

        Item {
            id:mpgame
            width:parent.width
            height:parent.height
            visible:false


            //onVisibleChanged: if(visible == true)

        RowLayout {
            height:parent.height * 0.98
            width:parent.width * 0.98
            Layout.alignment: Qt.AlignCenter
            anchors.centerIn: parent
            spacing: parent.height * 0.03

            Repeater {
             model:numofplayers


        Game1 {

            width:parent.width / (numofplayers + 0.3)

            height:parent.height * 0.90
           // clip:true
            visible: mpgame.visible
            playernum:index
            mode:1
        }

            }

        }

        }

        PlayerSelect {
            id:select_player
            anchors.fill: parent
            visible: false
        }



        Challenges {
            id:challenges
            anchors.fill:parent
            visible: false
        }

        EndScreen {
            id:endScreen
            anchors.fill: parent
            visible: false
        }

        /* Rectangle {
            visible: if(gameBoard1.visible == 1) {true} else {false}
            anchors.bottom:bg.bottom
            anchors.bottomMargin: bg.height * 0.01
            anchors.right: bg.right
            anchors.rightMargin: bg.height * 0.04
            width:bg.height * 0.1
            height:bg.height * 0.05
            border.color:"Yellow"
            border.width:parent.height * 0.001
            color:"#000000"
            radius:5

            Text {
                anchors.centerIn: parent
                font.family: pixeltext.name
                color:"Yellow"
                font.pixelSize: parent.height * 0.5
                text: "back"
            }

            MouseArea {
                anchors.fill:parent
                onClicked: Scripts.cleargame(),game.visible = false,mainMenu.visible = true
            }

        } */

    }

    Splash {
        id:splashscreen
        anchors.fill:parent
        state:"Show"
    }



}
