import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: suitLevels
    required property double o2Gauge
    required property double co2Gauge
    required property double suitTemperature
    required property double externalTemperature
    required property double powerCell

    ColumnLayout {
        width: parent.width

        Label {
            Layout.alignment: Qt.AlignHCenter
            font: Style.title
            text: ""
        }

        SuitLevelsPane {
            iconValue: ""
            titleValue: "O2:"
            dataValue: `${suitLevels.o2Gauge.toFixed(1)}%`
        }

        SuitLevelsPane {
            iconValue: ""
            titleValue: "CO2:"
            dataValue: `${suitLevels.co2Gauge.toFixed(1)}%`
        }

        SuitLevelsPane {
            iconValue: ""
            titleValue: "Ext:"
            dataValue: `${suitLevels.externalTemperature.toFixed(1)}°`
        }

        SuitLevelsPane {
            iconValue: ""
            titleValue: "Suit:"
            dataValue: `${suitLevels.suitTemperature.toFixed(1)}°`
        }

        SuitLevelsPane {
            iconValue: ""
            titleValue: "Power Cell:"
            dataValue: `${suitLevels.powerCell.toFixed(1)}%`
        }
    }
}
