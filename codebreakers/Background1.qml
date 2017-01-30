import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {

    Image {
        id:bg
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.left:parent.left
        fillMode:Image.PreserveAspectCrop
        anchors.bottom:parent.bottom
        source:if (level == 0) {"qrc:/Img/background.png"} else if(level < 17) {"qrc:/Img/background-s1.png"}
        //source:"qrc:/Img/background.png"
    }

    GaussianBlur {
        source:bg
        anchors.fill:bg
        samples:10
        radius:8
        visible:if (level == 0) {true} else {false}
    }







}
