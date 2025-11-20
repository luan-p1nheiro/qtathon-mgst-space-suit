pragma Singleton
import QtQuick
import QtCore

QtObject {
    readonly property string backendUrl: "http://localhost:3000/"
    readonly property Settings settings: Settings {
        property string clientId: ""
    }
}
