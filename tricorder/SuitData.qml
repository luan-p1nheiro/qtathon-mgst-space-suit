import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: suitData
    anchors.fill: parent
    background: Rectangle {color: "black"}

    function fetchData() {
        const xhr = new XMLHttpRequest();
        xhr.open("GET", Env.backendUrl + Env.settings.clientId);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                try {
                    const response = JSON.parse(xhr.responseText);

                    // 🔥 Atualiza seus dados exatamente como antes
                    o2Gauge.level = response.o2GaugeLevel;
                    co2Gauge.level = response.co2GaugeLevel;
                    suitTemperature.temperature = response.suitTemperature;
                    externalTemperature.temperature = response.externalTemperature;
                    powerCell.level = response.powerCellCharge;
                } catch (e) {
                    console.log("Erro ao parsear JSON:", e);
                }
            }
        }

        xhr.send();
    }

    ColumnLayout {
        spacing: Style.spacing
        width: parent.width

        Label {
            Layout.alignment: Qt.AlignHCenter
            font: Style.title
            text: "GAUGES"
        }

        MenuSeparator { Layout.fillWidth: true }

        SuitDataPane {
            id: o2Gauge
            property double level: 0.0
<<<<<<< HEAD
            titleValue: "O2 Gauge: "
            dataValue: `${o2Gauge.level.toFixed(1)}%`
=======
            background: null

            RowLayout {
                anchors.fill: parent

                Label { font: Style.subtitle; text: "O2 Gauge: " }
                Label { font: Style.data; text: `${o2Gauge.level.toFixed(1)}%` }
            }
>>>>>>> main
        }

        SuitDataPane {
            id: co2Gauge
            property double level: 0.0
<<<<<<< HEAD
            titleValue: "CO2 Gauge: "
            dataValue: `${co2Gauge.level.toFixed(1)}%`
=======
            background: null

            RowLayout {
                anchors.fill: parent

                Label { font: Style.subtitle; text: "CO2 Gauge:" }
                Label { font: Style.data; text: `${co2Gauge.level.toFixed(1)}%` }
            }
>>>>>>> main
        }

        MenuSeparator { Layout.fillWidth: true }

        Label {
            Layout.alignment: Qt.AlignHCenter
            font: Style.title
            text: "TEMPERATURES"
        }

        MenuSeparator { Layout.fillWidth: true }

        SuitDataPane {
            id: externalTemperature
            property double temperature: 0.0
<<<<<<< HEAD
            titleValue: " External:"
            dataValue: `${externalTemperature.temperature.toFixed(1)}°`
=======
            background: null

            RowLayout {
                anchors.fill: parent

                Label { font: Style.subtitle; text: " External:" }
                Label { font: Style.data; text: `${externalTemperature.temperature.toFixed(1)}°` }
            }
>>>>>>> main
        }

        SuitDataPane {
            id: suitTemperature
            property double temperature: 0.0
<<<<<<< HEAD
            titleValue: " Suit:"
            dataValue: `${suitTemperature.temperature.toFixed(1)}°`
=======
            background: null

            RowLayout {
                anchors.fill: parent

                Label { font: Style.subtitle; text: " Suit:" }
                Label { font: Style.data; text: `${suitTemperature.temperature.toFixed(1)}°` }
            }
>>>>>>> main
        }

        MenuSeparator { Layout.fillWidth: true }

        Label {
            Layout.alignment: Qt.AlignHCenter
            font: Style.title
            text: "POWER"
        }

        MenuSeparator { Layout.fillWidth: true }

        SuitDataPane {
            id: powerCell
            property double level: 0.0
<<<<<<< HEAD
            titleValue: "Power Cell:"
            dataValue: `${powerCell.level.toFixed(1)}%`
=======
            background: null

            RowLayout {
                anchors.fill: parent

                Label { font: Style.subtitle; text: "Power Cell Charge:" }
                Label { font: Style.data; text: `${powerCell.level.toFixed(1)}%` }
            }
>>>>>>> main
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            fetchData();
        }
    }
}
