import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Intermix.WebScrap

Item {
    id: suitData

    HttpRequest {
        id: request
        source: Env.backendUrl
        method: HttpRequest.Get
        onFinished: {
            const response = request.responsePayload;
            o2Gauge.level = response.o2GaugeLevel;
            co2Gauge.level = response.co2GaugeLevel;
            suitTemperature.temperature = response.suitTemperature;
            externalTemperature.temperature = response.externalTemperature;
            powerCell.level = response.powerCellCharge;
        }
        onStateChanged: state => {
            if (state === HttpRequest.State.Error)
                console.log(request.errorMessage);
        }
    }

    ColumnLayout {
        anchors.centerIn: parent

        ColumnLayout {
            id: o2Gauge
            property double level: 0.0

            Label {
                text: "O2 Gauge"
            }
            Label {
                text: `${o2Gauge.level.toFixed(1)}`
            }
        }

        ColumnLayout {
            id: co2Gauge
            property double level: 0.0

            Label {
                text: "CO2 Gauge"
            }
            Label {
                text: `${co2Gauge.level.toFixed(1)}`
            }
        }

        ColumnLayout {
            id: externalTemperature
            property double temperature: 0.0

            Label {
                text: "External Temperature"
            }
            Label {
                text: `${externalTemperature.temperature.toFixed(1)} | Suit Temp: `
            }
        }

        ColumnLayout {
            id: suitTemperature
            property double temperature: 0.0

            Label {
                text: "Suit Temperature"
            }
            Label {
                text: `${suitTemperature.temperature.toFixed(1)}`
            }
        }

        ColumnLayout {
            id: powerCell
            property double level: 0.0

            Label {
                text: "Power Cell Charge"
            }
            Label {
                text: `${powerCell.level.toFixed(1)}`
            }
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
