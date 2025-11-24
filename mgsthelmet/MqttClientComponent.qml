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
            mqttClient.subscribe(`suitdata/o2gauge/${mqttClient.clientId}`);
            mqttClient.subscribe(`suitdata/co2gauge/${mqttClient.clientId}`);
            mqttClient.subscribe(`suitdata/suittemperature/${mqttClient.clientId}`);
            mqttClient.subscribe(`suitdata/externaltemperature/${mqttClient.clientId}`);
            mqttClient.subscribe(`suitdata/powercell/${mqttClient.clientId}`);
        }
    }
}
