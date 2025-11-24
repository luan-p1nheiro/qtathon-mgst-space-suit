import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: root
    anchors.fill: parent

    property var currentMission

    ColumnLayout {
        anchors.fill: parent

        // Título da missão
        Label {
            text: root.currentMission ? root.currentMission.title : "Select a mission"
            font: Style.title
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        // Descrição da missão
        Label {
            text: root.currentMission ? root.currentMission.description : ""
            font: Style.subtitle
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }
    }

    // Equipamentos
    Pane {
        anchors.bottom: parent.bottom

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 8

            Label {
                text: "Equipments:"
                font: Style.subtitle
            }

            Repeater {
                model: root.currentMission ? root.currentMission.equipments : []
                delegate: Label {
                    text: "• " + modelData
                    font: Style.data
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
}
