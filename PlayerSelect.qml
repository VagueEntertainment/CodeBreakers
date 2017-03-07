import QtQuick 2.0
import QtGraphicalEffects 1.0

import "main.js" as Scripts

Item {
    id:window_container

    Image {
        id:bg
        anchors.fill:parent
        fillMode: Image.PreserveAspectCrop
        source:"qrc:/Img/ps1.png"
        visible: false
    }


    GaussianBlur {
        source:bg
        anchors.fill:bg
        samples:10
        radius:8
        //visible:if (game.level == 0) {true} else {false}
    }

    Text {
        id:lobbycode
        text:"3gf45"
        anchors.right:parent.right
        anchors.bottom:parent.bottom
        font.family: pixeltext.name
        font.pixelSize: parent.height * 0.05
    }


}
