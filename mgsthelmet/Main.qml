import QtQuick
import QtQuick.Controls.Universal

Window {
    width: 1000
    height: 600
    visible: true
    title: qsTr("Helmet Display")

    SuitLevels {
        anchors.top: parent.top
        anchors.right: parent.right

        o2Gauge: 0.0
        co2Gauge: 0.0
        suitTemperature: 0.0
        externalTemperature: 0.0
        powerCell: 0.0
    }
}
