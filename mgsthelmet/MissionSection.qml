import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

Pane {
    id: mission

    property string missionName: "Current Mission Name"
    property string nextTaskName: "Next Task Name"

    Connections {
        target: MqttClientComponent
        function onMissionMessageReceived(data) {
            missionName = data.missionName;
            nextTaskName = data.nextTaskName;
        }
    }

    ColumnLayout {
        width: parent.width

        Label {
            Layout.alignment: Qt.AlignLeft
            font: Style.title
            text: "MISSION 󰅍"
        }

        Item {
            implicitHeight: Style.spacing / 2
        }

        DataLabel {
            Layout.alignment: Qt.AlignLeft
            iconValue: "󰅍"
            titleValue: ":"
            dataValue: mission.missionName
        }

        DataLabel {
            Layout.alignment: Qt.AlignLeft
            iconValue: ""
            titleValue: ":"
            dataValue: mission.nextTaskName
        }
    }
}
