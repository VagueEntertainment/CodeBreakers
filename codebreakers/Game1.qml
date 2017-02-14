import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtMultimedia 5.5
import "main.js" as Scripts

Item {
    id:board

    property var colors: [0]
    property int executeEnable: 0
    property int islocked: 1
    property int playernum: 0
    property string playername: ""

    property var column0: [0]
    property var column1: [0]
    property var column2: [0]
    property var column3: [0]
    property var column4: [0]
    property var column5: [0]
    property var column6: [0]
    property var column7: [0]


onVisibleChanged: if(visible == true) {Scripts.loadhi(),generateCode.running = true} else {}

onIslockedChanged: if(islocked == 1) {lock.state = "locked"} else {lock.state = "unlocked"}

    Timer {
        id:generateCode
        running:false
        repeat:false
        interval:5
        onTriggered: Scripts.nextlevel()
    }


    Image {
        id:backing
        anchors.left:columns.left
        anchors.right:columns.right
        anchors.top:parent.top
        height:parent.height
        anchors.leftMargin:-parent.height * 0.02
        anchors.rightMargin:-parent.height * 0.02

        source:if(level > 10) {"qrc:/Img/Border1r.png"} else {if(level > 5) {"qrc:/Img/Border1y.png"} else {"qrc:/Img/Border1.png"} }
        visible: false
    }

    Image {
        id:lockbacking
       // source:"qrc:/Img/s1lock.png"
        source:if(level > 10) {"qrc:/Img/Border1r.png"} else {if(level > 5) {"qrc:/Img/Border1y.png"} else {"qrc:/Img/Border1.png"} }

        width:s1_locks.width
        height:s1_locks.height * 1.3
        anchors.centerIn: s1_locks
        opacity: 1
    }
    DropShadow {
        source:lockbacking
        anchors.fill: lockbacking
        horizontalOffset: 5
        verticalOffset: 5
        radius: 8.0
        samples: 17
        color: "#80000000"

    }

    Glow {
        samples: 17
        radius: 8
        source:lockbacking
        anchors.fill: lockbacking
        opacity: 0.5
    }

    Column {
        id:s1_locks

        anchors.top:backing.top
        anchors.left:backing.right
        anchors.topMargin: parent.height * 0.08
        anchors.leftMargin:parent.height * 0.04
        width:parent.height * 0.08
        height:parent.height * 0.35
        spacing:parent.height * 0.004
        //clip:true
        rotation:180

        Repeater {
            model:16


            Item {
                anchors.horizontalCenter: parent.horizontalCenter
                width:parent.height * 0.1
                height:parent.height * 0.05

            Rectangle {
                id:locklight
                width:parent.width
                height:parent.height
                border.width:parent.height * 0.08
                border.color: "black"
                color: if(level > index+1) {"green"} else {"darkgreen"}
                opacity: 0.3


            }

            Glow {
                source: locklight
                radius: 5
                samples: 17
                color:"lightgreen"
                anchors.fill: locklight
                visible: if(level > index+1) {true} else {false}
                opacity: 0.9
            }

        }
        }

    }



    Glow {
        samples: 17
        radius: 8
        source:backing
        anchors.fill: backing
        opacity: 0.5
    }

    DropShadow {
           anchors.fill: backing
           horizontalOffset: 10
           verticalOffset: 10
           radius: 8.0
           samples: 17
           color: "#80000000"
           source: backing
           opacity:0.5
       }

    Image {
        id:lock
        states: [
            State {
                name:"locked"
                PropertyChanges {
                    target:lock
                    opacity:0.3
                    scale:1
                }
            },

            State {
                name:"unlocked"
                PropertyChanges {
                    target: lock
                    opacity:0.0
                    scale:2
                }
            }
        ]
        transitions: [

            Transition {
                from: "unlocked"
                to: "locked"
                reversible: true

                NumberAnimation {
                    target: lock
                    property: "opacity"
                    duration: 100
                    easing.type: Easing.InOutQuad
                }


                NumberAnimation {
                    target: lock
                    property: "scale"
                    duration: 200
                    easing.type: Easing.InOutQuad
                }

            }

        ]

        state:"unlocked"
        anchors.fill:columns
        source:"qrc:/Img/lock.png"
        fillMode:Image.PreserveAspectFit
        opacity:0.3
    }



    Row {
        id:columns
        anchors.left: parent.left
        anchors.leftMargin: parent.height * 0.08
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height * 0.2
        //width:board.width
        height:parent.height * 0.75
        width:parent.height * 0.62
        //spacing:parent.width * 0.01
        clip:true
        //rotation:1.7

        Repeater {
            model:numofcolumns
       GameColumn {
           clip:true
           width:board.width / numofcolumns
           height:parent.height
           printindex:index
       }

     }

    }

    Image {
         anchors.centerIn:backing
         width:backing.width * 0.98
         height:backing.height * 0.91
         source:"qrc:Img/Grid.png"
         fillMode: Image.Tile

         opacity: 0.2

     }

    //Rectangle {

   /* Glow {
     samples:15
     radius:8
     source:codeBlock
     anchors.fill:codeBlock

    } */

    Item {
        id:codeBlock
        anchors.left:columns.left
        //anchors.leftMargin:parent.height * 0.01
        //anchors.topMargin: parent.height * 0.043
       // anchors.top:columns.bottom
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height * 0.043
        height:board.width / numofcolumns
        width: board.width
       // source:"qrc:/Img/Border3.png"
        //color:"darkgray"
       // rotation:2.5
       // fillMode:Image.PreserveAspectCrop
        clip:true


        ListView {
            id:theRow
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width
            height:parent.height
            orientation:Qt.Horizontal
            visible: if(gameBoard1.islocked == 1 && infoWindow.played == 1) {true} else {false}


            model: codeEntry


            delegate:  Tile {
                id:colored
                width:parent.height
                height:parent.height
                incell: colorpicked
                iscorrect:correct
                incolumn:0


                MouseArea {
                    id:tileclick
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    anchors.fill:parent
                    enabled: if(correct == 0 && gameBoard1.islocked == 1 && infoWindow.played == 1) {true} else {false}
                    onPressed:  { if(tileclick.pressedButtons == Qt.RightButton) {
                                    if( parent.incell != maxcolors) {parent.incell = parent.incell + 1} else {parent.incell = 1}
                        } else {
                            if( parent.incell > 1) {parent.incell = parent.incell - 1} else {parent.incell = maxcolors}
                        }

                        //console.log(tileclick.pressedButtons);
                        colors[index] = parent.incell;
                        Scripts.check(colors);
                        select.play();
                    }




                }
            }

        }
    }

    Image {
            id:exebutton
        anchors.left: backing.right
        anchors.leftMargin:-parent.height * 0.03
        //    anchors.left:s1_locks.left
        anchors.bottom:codeBlock.bottom
        anchors.bottomMargin: parent.height * 0.03
        //height:units.gu(10)
       // width: units.gu(30)
        height:parent.height * 0.08
        width:parent.height * 0.2

        //color: if(executeEnable == 1) {"gray"} else {"lightgray"}
        source:if(level > 10) {"qrc:/Img/Border3r.png"} else {if(level > 5) {"qrc:/Img/Border3y.png"} else {"qrc:/Img/Border3.png"} }
        //fillMode: Image.PreserveAspectFit
        mirror:true
        rotation: 90
        clip:true
        visible: false

        Text {
            anchors.centerIn: parent

            text: "Execute"
            color:if(executeEnable == 1) {"white"} else {"black"}
            font.pixelSize: parent.height / 2

        }



        SoundEffect {
            id:execSound
            source:"qrc:/Sounds/220166__gameaudio__button-confirm-spacey.wav"
            volume: 1


        }

        SoundEffect {
            id:select
            source:"qrc:/Sounds/220181__gameaudio__computer-beep-1.wav"
            volume:0.2
        }


    }

    DropShadow {
           anchors.fill: exebutton
           horizontalOffset: if(executeEnable == 1) {10} else {-1}
           verticalOffset: if(executeEnable == 1) {-10 } else {-1}
           radius: 8.0
           samples: 17
           color: "#80000000"
           source: exebutton
           rotation: 90
           opacity: 0.7
       }

    Glow {
        source:exebutton
        anchors.fill:exebutton
        samples:14
        radius:5
        rotation: 90
        visible: if(executeEnable == 1) {true} else {false}
        opacity: 0.7

        MouseArea {
            enabled: executeEnable
            anchors.fill:parent
            onClicked:Scripts.execute(colors),execSound.play()
    }
    }






}
