pragma Singleton
import QtQuick
import QtCore

MqttClient {
    id: mqttClient
    hostname: Env.hostname
    port: Env.port
    clientId: Env.settings.clientId

    Component.onCompleted: {
        mqttClient.connectToHost();
    }

    onStateChanged: {
        if (mqttClient.state === 2) {
            mqttClient.subscribe(Env.broadcastTopic);
            mqttClient.subscribe(`suitdata/${mqttClient.clientId}`);
        }
    }
}
