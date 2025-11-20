import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Intermix.WebScrap

Item {
    id: suitData
    property string o2Gauge: "o2 value"
    property string co2Gauge: "co2 value"
    property string suitTemperature: "suit temp value"
    property string externalTemperature: "ext temp value"
    property string powerCellCharge: "power cell charge"

    HttpRequest {
        id: request
        source: ""
        method: HttpRequest.Get
        requestPayload: {}
        headers: []
        onFinished: {}
        onStateChanged: state => {}
    }

    ColumnLayout {
        anchors.centerIn: parent

        ColumnLayout {
            Label {
                text: "O2 Gauge"
            }
            Label {
                text: suitData.o2Gauge
            }
        }

        ColumnLayout {
            Label {
                text: "CO2 Gauge"
            }
            Label {
                text: suitData.co2Gauge
            }
        }

        ColumnLayout {
            Label {
                text: "Temperature"
            }
            Label {
                text: `External: ${suitData.externalTemperature} | Suit Temp: ${suitData.suitTemperature}`
            }
        }

        ColumnLayout {
            Label {
                text: "Power Cell Charge"
            }
            Label {
                text: suitData.powerCellCharge
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
