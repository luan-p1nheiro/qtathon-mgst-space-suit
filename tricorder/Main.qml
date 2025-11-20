import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 640
    height: 800
    visible: true
    title: qsTr("Hello World")



    Component.onCompleted: {
        if (Env.settings.clientId === "") {
            Env.settings.clientId = Date.now().toString();
        }
    }

    Pane {
        anchors.fill: parent
        SuitData {}
    }
}
