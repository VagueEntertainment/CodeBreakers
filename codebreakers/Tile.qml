import QtQuick 2.0

Item {
    id:tile
    //visible: if(turn == 0) {false} else {true}
    //anchors.centerIn: parent
    property int incell: 0
    property int iscorrect: 0

    Rectangle {
        anchors.centerIn: parent
        width:parent.width * 0.95
        height:parent.height * 0.95
        radius:8
        color:if(iscorrect == 1) {"gold"} else {"gray"}

    }

    Rectangle {
        width:parent.width * 0.8
        height:parent.height * 0.8
        color:switch(incell) {
              case 0: "lightgray";break;
              case 1: "white";break;
              case 2: "green";break;
              case 3: "red";break;
              case 4: "orange";break;
              case 5: "purple";break;
              case 6: "brown";break;
              default: "#000000";break;
              }

        radius:width /2
        anchors.centerIn: parent
    }

}
