import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Intermix.WebScrap

Pane {
    id: suitData
    anchors.fill: parent

    HttpRequest {
        id: request
        source: Env.backendUrl + Env.settings.clientId
        method: HttpRequest.Get
        onFinished: {
            const response = request.responsePayload;
            o2Gauge.level = response.o2GaugeLevel;
            co2Gauge.level = response.co2GaugeLevel;
            suitTemperature.temperature = response.suitTemperature;
            externalTemperature.temperature = response.externalTemperature;
            powerCell.level = response.powerCellCharge;
            MqttClientComponent.publish(`suitdata/${MqttClientComponent.clientId}`, response, 0, false);
        }
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

        SuitDataPane {
            id: o2Gauge
            property double level: 0.0
            titleValue: "O2 Gauge: "
            dataValue: `${o2Gauge.level.toFixed(1)}%`
        }

        SuitDataPane {
            id: co2Gauge
            property double level: 0.0
            titleValue: "CO2 Gauge: "
            dataValue: `${co2Gauge.level.toFixed(1)}%`
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

        SuitDataPane {
            id: externalTemperature
            property double temperature: 0.0
            titleValue: " External:"
            dataValue: `${externalTemperature.temperature.toFixed(1)}°`
        }

        SuitDataPane {
            id: suitTemperature
            property double temperature: 0.0
            titleValue: " Suit:"
            dataValue: `${suitTemperature.temperature.toFixed(1)}°`
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

        SuitDataPane {
            id: powerCell
            property double level: 0.0
            titleValue: "Power Cell:"
            dataValue: `${powerCell.level.toFixed(1)}%`
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            request.start();
        }
    }
}
