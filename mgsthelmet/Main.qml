import QtQuick
import QtQuick.Controls.Universal

Window {
    width: 1000
    height: 600
    visible: true
    title: qsTr("MGST Helmet Display")

    MqttClient {
        id: mqttClient
        hostname: Env.hostname
        port: Env.port
        clientId: Env.clientId

        Component.onCompleted: {
            mqttClient.connectToHost();
            mqttClient.subscribe(mqttClient.clientId);
        }

        onMessageReceived: (topic, message, sender) => {
            console.log(topic + ":" + message + " " + sender);
        }
    }

    SuitLevels {
        anchors.top: parent.top
        anchors.right: parent.right

        o2Gauge: 0.0
        co2Gauge: 0.0
        suitTemperature: 0.0
        externalTemperature: 0.0
        powerCell: 0.0
    }
}
