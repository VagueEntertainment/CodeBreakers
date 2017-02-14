import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.LocalStorage 2.0 as Sql
import QtQuick.Window 2.0


import "main.js" as Scripts

/*!
    brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    applicationName: "codebreakers.vagueentertainment"

    //width: units.gu(175)
    //height: units.gu(150)
    width:Screen.width
    height:Screen.height


    property var db : Sql.LocalStorage.openDatabaseSync("UserInfo", "1.0", "Local UserInfo", 1);
    property int reset: 0
    property int numofcolumns: 6
    property int turn: 0
    property int level: 0
    property int maxcolors: 3

    property int score: 0
    property int hiscore:0
    property int combo:1
    property var previous: [0]

    property int numofplayers: 1


    property var code: [0]



    property string name: "ABC"
    property string date: "No Date"

    property string devId: "Vag-01001011"
    property string appId: "sys76Cod-0115"
    property int gamemode: 0

    property var dict: [""]


    onLevelChanged:talkingBox.level = level


    FontLoader { id: pixeltext; source: "qrc:/Font/ROBOTICA.TTF" }


    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("codebreakers")
            StyleHints {
                foregroundColor: UbuntuColors.orange
                backgroundColor: UbuntuColors.porcelain
                dividerColor: UbuntuColors.slate
            }
            visible: false
        }

        Background1 {
            id:bg
            width:parent.width
            height:parent.height
        }


        Menu {
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
            width:parent.width / 3
            anchors.left:parent.left
            anchors.leftMargin: parent.height * 0.01
            height:parent.height * 0.96
           // clip:true
            visible: false
        }

        ScoreBoard {
            id:scoreBoard

            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin: parent.height * 0.01
            anchors.right:parent.right
            anchors.rightMargin: parent.height * 0.01
            width:units.gu(50)
            height:units.gu(50)
        }


    DialogBox {
        id:talkingBox
        width:parent.width
        height:parent.height / 2

        anchors.right:parent.right
        anchors.bottom:parent.bottom
        //visible: false
    }


    Info {
        id:infoWindow
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.6
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



        Game1 {
           // id:gameBoard1

            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin: parent.height * 0.01
            width:parent.width / 3
            anchors.left:parent.left
            anchors.leftMargin: parent.height * 0.01
            height:parent.height * 0.96
           // clip:true
            visible: mpgame.visible
        }

        ScoreBoard {
          //  id:scoreBoard

            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin: parent.height * 0.01
            anchors.right:parent.right
            anchors.rightMargin: parent.height * 0.01
            width:units.gu(50)
            height:units.gu(50)
        }


    DialogBox {
      //  id:talkingBox
        width:parent.width
        height:parent.height / 2

        anchors.right:parent.right
        anchors.bottom:parent.bottom
        //visible: false
    }


    Info {
        //id:infoWindow
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.6
        height:parent.height * 0.3
        state:"Hide"
    }

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

        Rectangle {
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

        }

    }

    ListModel {
        id:filledLine0

        ListElement {
            colorpicked: 0
            correct:0
        }

    }

    ListModel {
        id:filledLine1

        ListElement {
            colorpicked: 0
            correct:0
        }

    }
    ListModel {
        id:filledLine2

        ListElement {
            colorpicked: 0
            correct:0
        }

    }
    ListModel {
        id:filledLine3

        ListElement {
            colorpicked: 0
            correct:0
        }

    }
    ListModel {
        id:filledLine4

        ListElement {
            colorpicked: 0
            correct:0
        }

    }
    ListModel {
        id:filledLine5

        ListElement {
            colorpicked: 0
            correct:0
        }

    }

    ListModel {
        id:filledLine6

        ListElement {
            colorpicked: 0
            correct:0
        }

    }

    ListModel {
        id:filledLine7

        ListElement {
            colorpicked: 0
            correct:0
        }

    }

    ListModel {
        id:codeEntry


       /* ListElement {
            colorpicked:0
            correct:0
            incolumn:0
        } */

    }

}
