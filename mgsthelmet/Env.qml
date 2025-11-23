pragma Singleton
import QtQuick
import QtCore

QtObject {
    readonly property string hostname: "test.mosquitto.org"
    readonly property int port: 1883
    readonly property string clientId: ""
}
