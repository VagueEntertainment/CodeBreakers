import QtQuick 2.0

Item {
    id:window_container





    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width* 0.7
        height: parent.height * 0.6
        spacing:parent.height * 0.03

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: parent.height * 0.3
            text:"Test"

        }


    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.9
        height:window_container.height * 0.08
        color:"gray"

        Text {
            anchors.centerIn: parent
            text: "Play"
            font.pixelSize: parent.height * 0.8
        }
    }


    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.9
        height:window_container.height * 0.08
        color:"gray"

        Text {
            anchors.centerIn: parent
            text: "Settings"
            font.pixelSize: parent.height * 0.8
        }
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.9
        height:window_container.height * 0.08

    }


    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width * 0.9
        height:window_container.height * 0.08
        color:"gray"

        Text {
            anchors.centerIn: parent
            text: "Exit"
            font.pixelSize: parent.height * 0.8
        }
    }

    }


Image {
    anchors.bottom:parent.bottom
    anchors.right:parent.right
    source:"Img/logo1-alpha.png"
    fillMode: Image.PreserveAspectFit
    width:parent.width * 0.1

}

}
