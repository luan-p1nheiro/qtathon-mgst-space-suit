import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 400
    height: 800
    visible: true
    title: qsTr("Tricorder")

    Component.onCompleted: {
        if (Env.settings.clientId === "") {
            Env.settings.clientId = Date.now().toString();
        }
    }

    Pane {
        anchors.fill: parent
        anchors.margins: Style.margins
        SuitData {}
    }

}
