import QtQuick 2.0

Item {
    property int printindex: 0
    property var inlist: [0]
    property int locked: 0



   /* Text {
        text: "Column index:"+printindex
        rotation: 90
       // color:"white"
        font.pixelSize: parent.width * 0.3
        anchors.centerIn: parent
    } */

    ListView {
        id:theColumn
        width:parent.width
        anchors.bottom:parent.bottom
        height:contentHeight
        spacing:parent.height * 0.01
        verticalLayoutDirection: ListView.TopToBottom
        visible: if(turn == 0) {false} else {true}
        clip:true
        model:switch(printindex) {
                case 0:filledLine0;break;
                case 1:filledLine1;break;
                case 2:filledLine2;break;
                case 3:filledLine3;break;
                case 4:filledLine4;break;
                case 5:filledLine5;break;
                case 6:filledLine6;break;
                case 7:filledLine7;break;
              }



        delegate: Tile {
            iscorrect:correct
            incell:colorpicked
            width:parent.width
            height:parent.width
        }

        add:Transition {
            NumberAnimation { properties: "y"; from: height; duration: 300 }
        }
        addDisplaced: Transition {
                NumberAnimation { properties: "y"; duration: 400 }
            }
        remove: Transition {
            NumberAnimation { properties: "y"; from: height; duration: 1000 }
        }


    }

    Image {
        width:parent.width
        height:parent.height
        opacity:0.4
        source:"qrc:/Img/columnlock.gif"
        cache:false
    }



}
