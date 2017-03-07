import QtQuick 2.0

Item {
    id:infoscreen



    Column {
        width:parent.width
        height:parent.height
        spacing:parent.height * 0.1

        Row {
            width:parent.width
            spacing:infoscreen.height * 0.1

            Text {
                text:"level:"+gameBoard1.level
                font.pixelSize: infoscreen.height * 0.08
                font.family: pixeltext.name
                color:"white"
            }
            Text {
                text: "turn:"+(gameBoard1.turn-1)
                font.pixelSize: infoscreen.height * 0.08
                font.family: pixeltext.name
                color:"white"
            }
        }

    Text {
        width:parent.width * 0.5
        //height:parent.height * 0.1
        text:"score:"+ gameBoard1.score
        font.pixelSize: parent.height * 0.08
        font.family: pixeltext.name
        color:"white"
    }

    /*Text {
        width:parent.width * 0.5
       // height:parent.height * 0.1
        text:"combo:"+combo+"x"
        font.pixelSize: parent.height * 0.08
        font.family: pixeltext.name
        color:"white"
    } */

    Text {
        width:parent.width * 0.5
      //  height:parent.height * 0.1
        text:"hiscore:"+hiscore
        font.pixelSize: parent.height * 0.08
        font.family: pixeltext.name
        color:"white"
    }

    }

}
