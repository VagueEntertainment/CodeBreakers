import QtQuick 2.0
import QtGraphicalEffects 1.0
import "main.js" as Scripts

Item {
    id:tile
    //visible: if(turn == 0) {false} else {true}
    //anchors.centerIn: parent
    property int incell: 0
    property int iscorrect: 0
    property int dupls: 0
    property int incolumn: 1

    onIncellChanged: dupls = 0,Scripts.others(incell)

    Rectangle {
        anchors.centerIn: parent
        width:parent.width * 0.95
        height:parent.height * 0.95
        radius:8
        color:if(iscorrect == 1) {"gold"} else {"gray"}
        border.color:"yellow"
        opacity: if(iscorrect == 1) {0.9} else {0.4}

    }

    Rectangle {
        width:parent.width * 0.8
        height:parent.height * 0.8
        color:switch(incell) {
              case 0: "gray";break;
              case 1: "white";break;
              case 2: "green";break;
              case 3: "red";break;
              case 4: "orange";break;
              case 5: "purple";break;
              case 6: "cyan";break;
              default: "#000000";break;
              }
        border.color: "black"
        border.width:1

        radius:width /2
        anchors.centerIn: parent
    }

    Text {
        anchors.right:parent.right
        anchors.top:parent.top
        anchors.rightMargin: -parent.height * 0.04
        anchors.topMargin: -parent.height * 0.06

        text:if(dupls == 0 ) {" "} else {if(incolumn == 0) {" "} else {dupls}}
        font.family: pixeltext.name
        font.pixelSize: parent.height * 0.3
        color:"black"

    }

}
