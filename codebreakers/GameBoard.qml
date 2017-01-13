import QtQuick 2.0
import QtGraphicalEffects 1.0
import "main.js" as Scripts

Item {
    id:board

    property var colors: [0]
    property int executeEnable: 0

onVisibleChanged: if(visible == true) {generateCode.running = true}

    Timer {
        id:generateCode
        running:false
        repeat:false
        interval:5
        onTriggered: Scripts.nextlevel()
    }


    Image {
        id:backing
        anchors.left:parent.left
        anchors.top:parent.top
        height:parent.height
        width:parent.width * 1.12
        source:"qrc:/Img/Border1.png"
    }

    Glow {
        samples: 17
        radius: 8
        source:backing
        anchors.fill: backing
    }

    DropShadow {
           anchors.fill: backing
           horizontalOffset: 10
           verticalOffset: 10
           radius: 8.0
           samples: 17
           color: "#80000000"
           source: backing
       }

    Image {
        anchors.fill:columns
        source:"qrc:/Img/lock.png"
        fillMode:Image.PreserveAspectFit
        opacity:0.3
    }



    Row {
        id:columns
        anchors.left: parent.left
        anchors.leftMargin: parent.height * 0.03
        anchors.bottom:parent.bottom
        anchors.bottomMargin: parent.height * 0.2
        width:board.width
        height:parent.height * 0.75
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
         height:backing.height * 0.93
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
        anchors.topMargin: parent.height * 0.043
        anchors.top:columns.bottom
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


            model: codeEntry


            delegate:  Tile {
                id:colored
                width:parent.height
                height:parent.height
                incell: colorpicked
                iscorrect:correct


                MouseArea {
                    anchors.fill:parent
                    enabled: if(correct == 0) {true} else {false}
                    onClicked:  { if( parent.incell != 7) {parent.incell = parent.incell + 1} else {parent.incell = 0}

                        colors[index] = parent.incell;
                        Scripts.check(colors);
                    }



                }
            }

        }
    }

    Image {
            id:exebutton
        anchors.left: codeBlock.right
       anchors.leftMargin:-parent.height * 0.03
        anchors.bottom:codeBlock.bottom
        anchors.bottomMargin: parent.height * 0.03
        height:units.gu(10)
        width: units.gu(30)
        //color: if(executeEnable == 1) {"gray"} else {"lightgray"}
        source:"qrc:/Img/Border3.png"
        //fillMode: Image.PreserveAspectFit
        mirror:true
        rotation: 90
        clip:true

        Text {
            anchors.centerIn: parent

            text: "Execute"
            color:if(executeEnable == 1) {"white"} else {"black"}
            font.pixelSize: parent.height / 2

        }

        MouseArea {
            enabled: executeEnable
            anchors.fill:parent
            onClicked:Scripts.execute(colors)
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
       }

    Glow {
        source:exebutton
        anchors.fill:exebutton
        samples:14
        radius:5
        rotation: 90
        visible: if(executeEnable == 1) {true} else {false}
    }




}
