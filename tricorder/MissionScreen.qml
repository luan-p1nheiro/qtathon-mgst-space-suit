import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    anchors.fill: parent
    property alias currentMission: missionTasksView.currentMission

    ColumnLayout {
        anchors.fill: parent
        spacing: Style.spacing


        MissionTasks {
            id: missionTasksView
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

    }
}
