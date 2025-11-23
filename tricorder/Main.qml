import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    id: root
    width: 400
    height: 800
    visible: true
    title: qsTr("Tricorder")

    Component.onCompleted: {
        if (Env.settings.clientId === "") {
            Env.settings.clientId = Date.now().toString();
        }
    }

    SwipeView {
        id: view
        currentIndex: bar.currentIndex
        anchors.fill: parent

        Item {
            SuitData {
                anchors.margins: Style.margins
            }
        }
        Item {
            MissionScreen{
                anchors.margins: Style.margins
            }
        }
    }

    footer: TabBar {
        id: bar
        currentIndex: view.currentIndex
        width: parent.width

        TabButton {
            font: Style.title
            text: qsTr("Suit Data")
        }

        TabButton {
            font: Style.title
            text: qsTr("Missions")
        }
    }
}
