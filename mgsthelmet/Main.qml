import QtQuick
import QtQuick.Controls.Universal

Window {
    width: 1000
    height: 600
    visible: true
    title: qsTr("MGST Helmet Display")

    SuitLevelsSection {
        anchors.top: parent.top
        anchors.right: parent.right
    }

    MissionSection {
        anchors.top: parent.top
        anchors.left: parent.left
    }
}
