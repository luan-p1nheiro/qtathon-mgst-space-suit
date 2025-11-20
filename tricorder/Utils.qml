pragma Singleton
import QtQuick

QtObject {
    readonly property string hostname: "test.mosquitto.org"
    readonly property int port: 1883
    readonly property string broadcastTopic: "broadcast/channel"
}
