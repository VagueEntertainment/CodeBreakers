import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    clip:true

   Image {
       id:backing
       source:if(gameBoard1.level > 10) {"qrc:/Img/Border2r.png"} else {if(gameBoard1.level > 5) {"qrc:/Img/Border2y.png"} else {"qrc:/Img/Border2.png"} }
    width:parent.width * 0.98
    height:parent.height * 0.98
    anchors.centerIn: parent
    visible: false
   }



   Glow {
       anchors.fill:backing
       source:backing
       radius: 8
       samples: 17
       opacity: 0.5
        visible: if(orient ==2) {true} else {false}
   }

   DropShadow {
          anchors.fill: backing
          horizontalOffset: 10
          verticalOffset: 10
          radius: 8.0
          samples: 17
          color: "#80000000"
          source: backing
           opacity: 0.5
           visible: if(orient ==2) {true} else {false}
      }

   Image {
        anchors.centerIn:backing
        width:backing.width * 0.98
        height:backing.height * 0.93
        source:"qrc:Img/Grid.png"
        fillMode: Image.Tile

        opacity: 0.2
        visible: if(orient ==2) {true} else {false}

    }

    Score {
        anchors.centerIn: parent
        //anchors.top:parent.top
        //anchors.left:parent.left
        width:parent.width * 0.8
        height:parent.height * 0.8
    }
}
