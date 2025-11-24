import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal

ApplicationWindow {
    id: root
    width: 400
    height: 800
    visible: true
    title: qsTr("Tricorder")

    Universal.theme: Universal.Dark
    Universal.accent: "white"

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
            SuitDataScreen {
                id: suitDataScreen
                anchors.margins: Style.margins
            }
        }
        Item {
            Missions {
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
