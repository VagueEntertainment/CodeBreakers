import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    clip:true

   Image {
       id:backing
    source:"qrc:/Img/Border2.png"
    width:parent.width * 0.9
    height:parent.height * 0.9
    anchors.centerIn: parent
    opacity: 0.9
   }

   Glow {
       anchors.fill:backing
       source:backing
       radius: 8
       samples: 17

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

    Score {
        anchors.centerIn: parent
        //anchors.top:parent.top
        //anchors.left:parent.left
        width:parent.width * 0.8
        height:parent.height * 0.8
    }
}
