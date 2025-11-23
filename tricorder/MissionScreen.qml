import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    anchors.fill: parent
    padding: Style.margins
    background: Rectangle { color: "#1b1b1b" }

    ColumnLayout {
        anchors.fill: parent
        spacing: Style.spacing

        Text {
            text: "Missions Screen"
            font: Style.title
            color: "white"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        }

        // Criar primeiro o MissionTasks
        MissionTasks {
            id: missionTasksView
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        // Criar TimerPanel depois
        TimerPanel {
            id: timerPanel
            Layout.fillWidth: true

            // Atribuir tasksModel depois que missionTasksView estiver criado
            Component.onCompleted: {
                tasksModel = missionTasksView.tasksModel
            }
        }

        // Conectar TimerPanel ao MissionTasks
        Component.onCompleted: {
            missionTasksView.timerPanel = timerPanel
        }
    }
}
