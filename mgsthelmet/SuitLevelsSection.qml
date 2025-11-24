import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: suitLevels
    property double o2GaugeValue: 100
    property double co2GaugeValue: 100
    property double suitTemperatureValue: 25
    property double externalTemperatureValue: 20
    property double powerCellValue: 100

    onO2GaugeValueChanged: {
        if (o2GaugeValue === 0) {
            o2Gauge.color = Style.dangerColor;
            o2Gauge.iconValue = "󰡳";
        } else if (o2GaugeValue < 20) {
            o2Gauge.color = Style.dangerColor;
            o2Gauge.iconValue = "󰡵";
        } else if (o2GaugeValue < 60) {
            o2Gauge.color = Style.warningColor;
            o2Gauge.iconValue = "󰊚";
        } else {
            o2Gauge.color = Style.defaultColor;
            o2Gauge.iconValue = "󰡴";
        }
    }

    onCo2GaugeValueChanged: {
        if (co2GaugeValue === 0) {
            co2Gauge.color = Style.dangerColor;
            co2Gauge.iconValue = "󰡳";
        } else if (co2GaugeValue < 20) {
            co2Gauge.color = Style.dangerColor;
            co2Gauge.iconValue = "󰡵";
        } else if (co2GaugeValue < 60) {
            co2Gauge.color = Style.warningColor;
            co2Gauge.iconValue = "󰊚";
        } else {
            co2Gauge.color = Style.defaultColor;
            co2Gauge.iconValue = "󰡴";
        }
    }

    onSuitTemperatureValueChanged: {
        if (suitTemperatureValue < 0) {
            suitTemperature.color = Style.dangerColor;
            suitTemperature.iconValue = "";
        } else if (suitTemperatureValue < 10) {
            suitTemperature.color = Style.warningColor;
            suitTemperature.iconValue = "";
        } else if (suitTemperatureValue > 30) {
            suitTemperature.color = Style.dangerColor;
            suitTemperature.iconValue = "";
        } else if (suitTemperatureValue > 28) {
            suitTemperature.color = Style.warningColor;
            suitTemperature.iconValue = "";
        } else {
            suitTemperature.color = Style.defaultColor;
            suitTemperature.iconValue = "";
        }
    }

    onExternalTemperatureValueChanged: {
        if (externalTemperatureValue < -10) {
            externalTemperature.color = Style.dangerColor;
            externalTemperature.iconValue = "";
        } else if (externalTemperatureValue < 0) {
            externalTemperature.color = Style.warningColor;
            externalTemperature.iconValue = "";
        } else if (externalTemperatureValue > 40) {
            externalTemperature.color = Style.dangerColor;
            externalTemperature.iconValue = "";
        } else if (externalTemperatureValue > 35) {
            externalTemperature.color = Style.warningColor;
            externalTemperature.iconValue = "";
        } else {
            externalTemperature.color = Style.defaultColor;
            externalTemperature.iconValue = "";
        }
    }

    onPowerCellValueChanged: {
        if (powerCellValue < 60) {
            powerCell.color = Style.warningColor;
            powerCell.iconValue = "󱊢";
        } else if (powerCellValue < 20) {
            powerCell.color = Style.dangerColor;
            powerCell.iconValue = "󱊡";
        } else if (powerCellValue === 0) {
            powerCell.iconValue = "󰂎";
        } else {
            powerCell.color = Style.defaultColor;
            powerCell.iconValue = "󱊣";
        }
    }

    Connections {
        target: MqttClientComponent

        function onO2GaugeMessageReceived(data) {
            suitLevels.o2GaugeValue = data;
        }
        function onCo2GaugeMessageReceived(data) {
            suitLevels.co2GaugeValue = data;
        }
        function onSuitTemperatureMessageReceived(data) {
            suitLevels.suitTemperatureValue = data;
        }
        function onExternalTemperatureMessageReceived(data) {
            suitLevels.externalTemperatureValue = data;
        }
        function onPowerCellMessageReceived(data) {
            suitLevels.powerCellValue = data;
        }
    }

    ColumnLayout {
        width: parent.width

        Label {
            Layout.alignment: Qt.AlignRight
            font: Style.title
            text: "SUIT DATA "
        }

        Item {
            implicitHeight: Style.spacing / 2
        }

        DataLabel {
            id: o2Gauge
            Layout.alignment: Qt.AlignRight
            iconValue: "󰡴"
            titleValue: "O2:"
            dataValue: `${suitLevels.o2GaugeValue.toFixed(1)}%`
        }

        DataLabel {
            id: co2Gauge
            Layout.alignment: Qt.AlignRight
            iconValue: "󰡴"
            titleValue: "CO2:"
            dataValue: `${suitLevels.co2GaugeValue.toFixed(1)}%`
        }

        DataLabel {
            id: externalTemperature
            Layout.alignment: Qt.AlignRight
            iconValue: ""
            titleValue: "Ext:"
            dataValue: `${suitLevels.externalTemperatureValue.toFixed(1)}°`
        }

        DataLabel {
            id: suitTemperature
            Layout.alignment: Qt.AlignRight
            iconValue: ""
            titleValue: "Suit:"
            dataValue: `${suitLevels.suitTemperatureValue.toFixed(1)}°`
        }

        DataLabel {
            id: powerCell
            Layout.alignment: Qt.AlignRight
            iconValue: "󱊣"
            titleValue: "Power Cell:"
            dataValue: `${suitLevels.powerCellValue.toFixed(1)}%`
        }
    }
}
