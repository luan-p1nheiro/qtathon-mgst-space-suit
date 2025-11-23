import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        spacing: Style.spacing

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
