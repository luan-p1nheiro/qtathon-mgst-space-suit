pragma Singleton
import QtQuick
import QtCore

MqttClient {
    id: client
    hostname: Env.mqttHostname
    port: Env.mqttPort
    clientId: Env.settings.clientId

    Component.onCompleted: {
        client.connectToHost();
    }
}
