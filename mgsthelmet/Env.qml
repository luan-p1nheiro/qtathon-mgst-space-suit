pragma Singleton
import QtQuick
import QtCore

QtObject {
    readonly property string mqttHostname: "test.mosquitto.org"
    readonly property int mqttPort: 1883
    readonly property string clientId: ""
}
