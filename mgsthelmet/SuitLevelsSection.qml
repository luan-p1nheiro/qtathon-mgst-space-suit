import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: suitLevels
    property double o2Gauge
    property double co2Gauge
    property double suitTemperature
    property double externalTemperature
    property double powerCell

    Connections {
        target: MqttClientComponent
        function onSuitDataMessageReceived(data) {
            o2Gauge = data.o2GaugeLevel;
            co2Gauge = data.co2GaugeLevel;
            suitTemperature = data.suitTemperature;
            externalTemperature = data.externalTemperature;
            powerCell = data.powerCellCharge;
        }
    }

    ColumnLayout {
        width: parent.width

        Label {
            Layout.alignment: Qt.AlignCenter
            font: Style.title
            text: "SUIT DATA "
        }

        Item {
            implicitHeight: Style.spacing / 2
        }

        SuitLevelsLabel {
            Layout.alignment: Qt.AlignRight
            iconValue: ""
            titleValue: "O2:"
            dataValue: `${suitLevels.o2Gauge.toFixed(1)}%`
        }

        SuitLevelsLabel {
            Layout.alignment: Qt.AlignRight
            iconValue: ""
            titleValue: "CO2:"
            dataValue: `${suitLevels.co2Gauge.toFixed(1)}%`
        }

        SuitLevelsLabel {
            Layout.alignment: Qt.AlignRight
            iconValue: ""
            titleValue: "Ext:"
            dataValue: `${suitLevels.externalTemperature.toFixed(1)}°`
        }

        SuitLevelsLabel {
            Layout.alignment: Qt.AlignRight
            iconValue: ""
            titleValue: "Suit:"
            dataValue: `${suitLevels.suitTemperature.toFixed(1)}°`
        }

        SuitLevelsLabel {
            Layout.alignment: Qt.AlignRight
            iconValue: ""
            titleValue: "Power Cell:"
            dataValue: `${suitLevels.powerCell.toFixed(1)}%`
        }
    }
}
