import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: mission

    property string name: "Mission 1"
    property string duration: "07:00"
    property string timeTaken: "03:41"

    ColumnLayout {
        width: parent.width

        Label {
            Layout.alignment: Qt.AlignCenter
            font: Style.title
            text: "CURRENT MISSION 󰅍"
        }

        Item {
            implicitHeight: Style.spacing / 2
        }

        Label {
            font: Style.subtitle
            text: mission.name
        }
        SuitLevelsLabel {
            iconValue: "󰥔"
            titleValue: "Duration:"
            dataValue: mission.duration
        }
    }
}
