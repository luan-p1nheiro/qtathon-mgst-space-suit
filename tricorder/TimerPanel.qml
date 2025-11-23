import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

Rectangle {
    id: root
    color: Universal.background
    radius: 8
    Layout.fillWidth: true
    height: 120

    property var tasksModel: null
    property int currentTaskIndex: -1
    property int projectedDurationSeconds: 0
    property int timeToFinish: 0
    property bool running: false
    property bool active: false  // só ativo quando popup aberto

    Timer {
        id: missionTimer
        interval: 1000
        repeat: true
        running: root.running
        onTriggered: {
            if (timeToFinish > 0) {
                timeToFinish--
            } else {
                running = false
            }
        }
    }

    // MouseArea para controlar clicabilidade
    MouseArea {
        anchors.fill: parent
        enabled: root.active   // só interage quando popup aberto
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Style.margins
        spacing: Style.spacing

        // Cabeçalho / mensagem
        Text {
            text: currentTaskIndex >= 0
                  ? "Current Mission: " + tasksModel.get(currentTaskIndex).title
                  : "Choose a mission to start"
            font: Style.subtitle
            color: currentTaskIndex >= 0 ? "white" : "#888"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.alignment: Qt.AlignHCenter
            wrapMode: Text.Wrap
        }

        // Timer + Botões
        RowLayout {
            spacing: Style.spacing
            Layout.fillWidth: true

            // Timer
            Text {
                text: currentTaskIndex >= 0 ? secondsToTimeString(timeToFinish) : "--:--"
                font: Style.subtitle
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
            }

            // Start / Pause
            Button {
                text: running ? "Pause" : "Start"
                enabled: root.active && currentTaskIndex >= 0
                Layout.preferredWidth: 80
                onClicked: if(root.active && currentTaskIndex >= 0) root.running = !root.running

                contentItem: Text {
                    text: parent.text
                    font: Style.data
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            // Stop
            Button {
                text: "Stop"
                enabled: root.active && currentTaskIndex >= 0
                Layout.preferredWidth: 80
                onClicked: if(root.active && currentTaskIndex >= 0) {
                    root.running = false

                    if (currentTaskIndex >= 0 && tasksModel) {
                        var elapsed = projectedDurationSeconds - timeToFinish
                        if (elapsed < 0) elapsed = 0

                        var formattedElapsed = secondsToTimeString(elapsed)
                        tasksModel.setProperty(currentTaskIndex, "timeTaken", formattedElapsed)
                        tasksModel.setProperty(currentTaskIndex, "timeToFinish", timeToFinish)
                    }

                    timeToFinish = projectedDurationSeconds
                }

                contentItem: Text {
                    text: parent.text
                    font: Style.data
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }

    // Funções utilitárias
    function timeStringToSeconds(str) {
        if (!str) return 0
        var parts = str.split(":")
        return parseInt(parts[0])*60 + parseInt(parts[1])
    }

    function secondsToTimeString(sec) {
        let m = Math.floor(sec / 60)
        let s = (sec % 60).toString().padStart(2,"0")
        return `${m}:${s}`
    }
}
