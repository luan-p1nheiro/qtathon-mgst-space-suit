import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    radius: 8
    color: "#222"      // fundo escuro mas visível
    Layout.fillWidth: true
    Layout.fillHeight: true
    anchors.fill: parent

    property var currentMission

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 20

        // Título da missão
        Text {
            text: currentMission ? currentMission.title : "Select a mission"
            font.pixelSize: 24
            font.bold: true
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }

        // Descrição da missão
        Text {
            text: currentMission ? currentMission.description : ""
            font.pixelSize: 16
            color: "#ccc"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
        }

        // Equipamentos
        Rectangle {
            Layout.fillWidth: true
            color: "#333"
            radius: 8
            border.color: "#555"
            border.width: 1



            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 8

                Text {
                    text: "Equipments:"
                    font.pixelSize: 18
                    color: "#fff"
                    font.bold: true
                }

                Repeater {
                    model: currentMission ? currentMission.equipments : []
                    delegate: Text {
                        text: "• " + modelData
                        font.pixelSize: 16
                        color: "#ddd"
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }

        // Placeholder para futuras informações, alinhamento central
        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#555"
        }
    }
}
