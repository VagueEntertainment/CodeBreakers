import QtQuick 2.4
import Ubuntu.Components 1.3
import "main.js" as Scripts

/*!
    brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    applicationName: "codebreakers.vagueentertainment"

    width: units.gu(175)
    height: units.gu(150)


    property int reset: 0
    property int numofcolumns: 6
    property int turn: 0
    property int level: 0

    property int score: 0
    property int hiscore:0
    property int combo:1
    property var previous: [0]


    property var code: [0]

    property var column0: [0]
    property var column1: [0]
    property var column2: [0]
    property var column3: [0]
    property var column4: [0]
    property var column5: [0]
    property var column6: [0]
    property var column7: [0]




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

            onVisibleChanged: if(visible == true) {gameBoard.visible = true} else {GameBoard.visible = false}

        GameBoard {
            id:gameBoard

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

        width:parent.width
        height:parent.height / 2

        anchors.right:parent.right
        anchors.bottom:parent.bottom
        //visible: false
    }


    Info {
        id:infoWindow
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.8
        height:parent.height * 0.5
        state:"Hide"
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
        } */

    }

}
