import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Intermix.WebScrap

Item {
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
        }
    }

    ColumnLayout {
        spacing: Style.spacing

        Pane {
            id: o2Gauge
            property double level: 0.0

            RowLayout {
                anchors.fill: parent

                Label {
                    text: "O2 Gauge: "
                }

                Label {
                    text: `${o2Gauge.level.toFixed(1)}%`
                }
            }
        }

        MenuSeparator{
            Layout.fillWidth: true
        }

        Pane {
            id: co2Gauge
            property double level: 0.0

            RowLayout {
                anchors.fill: parent

                Label {
                    text: "CO2 Gauge:"
                }

                Label {
                    text: `${co2Gauge.level.toFixed(1)}%`
                }
            }
        }

        Pane {
            id: externalTemperature
            property double temperature: 0.0

            RowLayout {
                anchors.fill: parent

                Label {
                    text: " External:"
                }

                Label {
                    text: `${externalTemperature.temperature.toFixed(1)}°`
                }
            }
        }

        Pane {
            id: suitTemperature
            property double temperature: 0.0

            RowLayout {
                anchors.fill: parent

                Label {
                    text: " Suit:"
                }

                Label {
                    text: `${suitTemperature.temperature.toFixed(1)}°`
                }
            }
        }

        Pane {
            id: powerCell
            property double level: 0.0

            RowLayout {
                anchors.fill: parent

                Label {
                    text: "Power Cell Charge:"
                }

                Label {
                    text: `${powerCell.level.toFixed(1)}%`
                }
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
