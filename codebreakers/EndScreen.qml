import QtQuick 2.0
import QtGraphicalEffects 1.0
import "main.js" as Scripts

Item {
    id:window_container
    onVisibleChanged: if(visible == true) {Scripts.scoreboardLoad()} else {Scripts.scoreboardLoad()}
    Component.onCompleted: Scripts.scoreboardLoad()

    Image {
        id:backing
        anchors.centerIn: parent
        width:parent.height / 1.5
        height:parent.height * 0.96
        source:"qrc:/Img/Border1.png"
        //fillMode: Image.PreserveAspectFit
        visible: false

    }
        Image {
             anchors.centerIn:backing
             width:backing.width * 0.98
             height:backing.height * 0.93
             source:"qrc:Img/Grid.png"
             fillMode: Image.Tile

             opacity: 0.2

         }

        Glow {
            samples: 17
            radius: 8
            source:backing
            anchors.fill: backing
            opacity: 0.6
        }

        DropShadow {
               anchors.fill: backing
               horizontalOffset: 10
               verticalOffset: 10
               radius: 8.0
               samples: 17
               color: "#80000000"
               source: backing
               opacity:0.6
           }



    Text {
        id:title
        anchors.horizontalCenter: backing.horizontalCenter
        anchors.top:backing.top
        anchors.topMargin: backing.height * 0.1
        font.family: pixeltext.name
        text:"access granted"
        color:"Yellow"
        font.pixelSize: backing.height * 0.06
    }

    Text {
        id:players
        text:name.toLowerCase()

        anchors.left:backing.left
        anchors.leftMargin: backing.height * 0.05

        anchors.top:title.bottom
        anchors.topMargin: backing.height * 0.05

        font.family: pixeltext.name
        color:"Yellow"
        font.pixelSize: backing.height * 0.06

        Image {
            width:parent.height /2
            height:parent.height /2
            anchors.bottom:parent.bottom
            anchors.bottomMargin: -parent.height * 0.1
            anchors.left:parent.right
            anchors.leftMargin:parent.height * 0.02
            source:"qrc:/Img/edit.svg"
        }

        TextInput {
            width:parent.width
            height:parent.height
            anchors.left:parent.left
            maximumLength: 3
            font.pixelSize: backing.height * 0.06
            color:"Yellow"
            text:name.toLowerCase()
            font.family: pixeltext.name
            font.capitalization: Font.AllLowercase
            onTextChanged: name = text

        }

    }


    Text {
        anchors.right: backing.right
        anchors.rightMargin: backing.height * 0.05
        anchors.top:title.bottom
        anchors.topMargin: backing.height * 0.05
        text:hiscore
        font.family: pixeltext.name
        color:"Yellow"
        font.pixelSize: backing.height * 0.06
    }

    Rectangle {
        anchors.top:players.bottom
        anchors.topMargin: backing.height * 0.01
        anchors.right: backing.right
        anchors.rightMargin: backing.height * 0.04
        width:backing.height * 0.1
        height:backing.height * 0.05
        border.color:"Yellow"
        border.width:parent.height * 0.001
        color:"#0FFFFFFF"
        radius:5

        Text {
            anchors.centerIn: parent
            font.family: pixeltext.name
            color:"Yellow"
            font.pixelSize: parent.height * 0.5
            text: "save"
        }

        MouseArea {
            anchors.fill:parent
            onClicked: Scripts.scoreboardSave(name,hiscore)
        }

    }

    Rectangle {
        width:backing.width * 0.9
        height:backing.height * 0.55
        anchors.bottom:backing.bottom
        border.color:"Yellow"
        border.width:parent.height * 0.001
        color:"#0FFFFFFF"
        anchors.bottomMargin: backing.height * 0.1
        anchors.horizontalCenter: backing.horizontalCenter
        clip:true

        ListView {
            anchors.top:parent.top
            anchors.left:parent.left
            width:parent.width
            height:parent.height

            model:scores

            delegate: Item {
                width:parent.width
                height:window_container.height * 0.05

                Row {
                    width:parent.width
                    height:parent.height
                   // spacing:parent.width / 3

                    Text {
                        text:thename
                        width:parent.width / 3
                        font.family: pixeltext.name
                        color:"Yellow"
                        font.pixelSize: parent.height * 0.5
                    }
                    Text {
                        text:thedate
                        width:parent.width / 3
                        font.family: pixeltext.name
                        color:"Yellow"
                        font.pixelSize: parent.height * 0.5
                    }
                    Text {
                        text:thescore
                        width:parent.width / 3
                        horizontalAlignment: Text.AlignRight
                        font.family: pixeltext.name
                        color:"Yellow"
                        font.pixelSize: parent.height * 0.5
                    }
                }
            }
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
            onClicked: Scripts.cleargame(),endScreen.visible = false,mainMenu.visible = true
        }
    }

    ListModel {
        id:scores


    }

}
