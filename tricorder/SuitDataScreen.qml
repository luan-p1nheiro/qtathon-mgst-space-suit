import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Intermix.WebScrap

Pane {
    id: suitData
    anchors.fill: parent

    property double o2GaugeValue: 100
    property double co2GaugeValue: 100
    property double suitTemperatureValue: 25
    property double externalTemperatureValue: 20
    property double powerCellValue: 100

    Component.onCompleted: {
        MqttClientComponent.publish(`suitdata/o2gauge/${MqttClientComponent.clientId}`, o2GaugeValue, 0, true);
        MqttClientComponent.publish(`suitdata/co2gauge/${MqttClientComponent.clientId}`, co2GaugeValue, 0, true);
        MqttClientComponent.publish(`suitdata/suittemperature/${MqttClientComponent.clientId}`, suitTemperatureValue, 0, true);
        MqttClientComponent.publish(`suitdata/externaltemperature/${MqttClientComponent.clientId}`, externalTemperatureValue, 0, true);
        MqttClientComponent.publish(`suitdata/powercell/${MqttClientComponent.clientId}`, powerCellValue, 0, true);
    }

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
        MqttClientComponent.publish(`suitdata/o2gauge/${MqttClientComponent.clientId}`, o2GaugeValue, 0, true);
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
        MqttClientComponent.publish(`suitdata/co2gauge/${MqttClientComponent.clientId}`, co2GaugeValue, 0, true);
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
        MqttClientComponent.publish(`suitdata/suittemperature/${MqttClientComponent.clientId}`, suitTemperatureValue, 0, true);
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
        MqttClientComponent.publish(`suitdata/externaltemperature/${MqttClientComponent.clientId}`, externalTemperatureValue, 0, true);
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
        MqttClientComponent.publish(`suitdata/powercell/${MqttClientComponent.clientId}`, powerCellValue, 0, true);
    }

    ColumnLayout {
        spacing: Style.spacing
        width: parent.width

        Label {
            Layout.alignment: Qt.AlignHCenter
            font: Style.title
            text: "GAUGES"
        }

        MenuSeparator {
            Layout.fillWidth: true
        }

        DataLabel {
            id: o2Gauge
            iconValue: "󰡴"
            titleValue: "O2: "
            dataValue: `${suitData.o2GaugeValue.toFixed(1)}%`
        }

        DataLabel {
            id: co2Gauge
            iconValue: "󰡴"
            titleValue: "CO2: "
            dataValue: `${suitData.co2GaugeValue.toFixed(1)}%`
        }

        MenuSeparator {
            Layout.fillWidth: true
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            font: Style.title
            text: "TEMPERATURES"
        }

        MenuSeparator {
            Layout.fillWidth: true
        }

        DataLabel {
            id: externalTemperature
            iconValue: ""
            titleValue: "External:"
            dataValue: `${suitData.externalTemperatureValue.toFixed(1)}°C`
        }

        DataLabel {
            id: suitTemperature
            iconValue: ""
            titleValue: "Suit:"
            dataValue: `${suitData.suitTemperatureValue.toFixed(1)}°C`
        }

        MenuSeparator {
            Layout.fillWidth: true
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            font: Style.title
            text: "POWER"
        }

        MenuSeparator {
            Layout.fillWidth: true
        }

        DataLabel {
            id: powerCell
            iconValue: "󱊣"
            titleValue: "Power Cell:"
            dataValue: `${suitData.powerCellValue.toFixed(1)}%`
        }
    }

    Timer {
        id: depleteValues
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            function randomChange(value) {
                const valueChanged = value - (Math.random() < 0.5 ? 1 : 0);
                return Math.max(0, valueChanged);
            }

            suitData.o2GaugeValue = randomChange(suitData.o2GaugeValue);
            suitData.co2GaugeValue = randomChange(suitData.co2GaugeValue);
            suitData.powerCellValue = randomChange(suitData.powerCellValue);
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            function randomChange(value) {
                if (Math.random())
                    return Math.max(-20, value - Math.random(0.5));

                return Math.min(45, value + Math.random(0.5));
            }
            suitData.suitTemperatureValue = randomChange(suitData.suitTemperatureValue);
            suitData.externalTemperatureValue = randomChange(suitData.externalTemperatureValue);
        }
    }
}
