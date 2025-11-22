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
        spacing: Style.spacing

        SuitLevelsPane {
            id: o2Gauge
            titleValue: "O2 Gauge:"
            dataValue: `${suitLevels.o2Gauge.toFixed(1)}%`
        }

        SuitLevelsPane {
            titleValue: "CO2 Gauge:"
            dataValue: `${suitLevels.co2Gauge.toFixed(1)}%`
        }

        SuitLevelsPane {
            id: externalTemperature
            titleValue: " Ext:"
            dataValue: `${suitLevels.externalTemperature.toFixed(1)}°`
        }

        SuitLevelsPane {
            titleValue: " Suit:"
            dataValue: `${suitLevels.suitTemperature.toFixed(1)}°`
        }

        SuitLevelsPane {
            titleValue: "Power Cell:"
            dataValue: `${suitLevels.powerCell.toFixed(1)}%`
        }
    }
}
