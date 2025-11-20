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
        width: parent.width

        MenuSeparator {
            Layout.fillWidth: true
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            font: Style.title
            text: "GAUGES"
        }

        MenuSeparator {
            Layout.fillWidth: true
        }

        Pane {
            id: o2Gauge
            property double level: 0.0

            RowLayout {
                anchors.fill: parent

                Label {
                    font: Style.subtitle
                    text: "O2 Gauge: "
                }

                Label {
                    font: Style.data
                    text: `${o2Gauge.level.toFixed(1)}%`
                }
            }
        }

        Pane {
            id: co2Gauge
            property double level: 0.0

            RowLayout {
                anchors.fill: parent

                Label {
                    font: Style.subtitle
                    text: "CO2 Gauge:"
                }

                Label {
                    font: Style.data
                    text: `${co2Gauge.level.toFixed(1)}%`
                }
            }
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

        Pane {
            id: externalTemperature
            property double temperature: 0.0

            RowLayout {
                anchors.fill: parent

                Label {
                    font: Style.subtitle
                    text: " External:"
                }

                Label {
                    font: Style.data
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
                    font: Style.subtitle
                    text: " Suit:"
                }

                Label {
                    font: Style.data
                    text: `${suitTemperature.temperature.toFixed(1)}°`
                }
            }
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

        Pane {
            id: powerCell
            property double level: 0.0

            RowLayout {
                anchors.fill: parent

                Label {
                    font: Style.subtitle
                    text: "Power Cell Charge:"
                }

                Label {
                    font: Style.data
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
