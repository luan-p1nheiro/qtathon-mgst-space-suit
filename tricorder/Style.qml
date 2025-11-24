pragma Singleton

import QtQuick
import QtQuick.Controls.Universal

Item {
    readonly property FontLoader regularFont: FontLoader {
        source: "fonts/Silkscreen/Silkscreen-Regular.ttf"
    }

    readonly property font title: Qt.font({
        family: regularFont.font.family,
        pixelSize: 24
    })

    readonly property font subtitle: Qt.font({
        family: regularFont.font.family,
        pixelSize: 16
    })
    readonly property font data: Qt.font({
        family: regularFont.font.family,
        pixelSize: 16
    })

    readonly property font iconData: Qt.font({
        family: regularFont.font.family,
        pixelSize: 24
    })

    readonly property real spacing: 10
    readonly property real margins: 10

    readonly property color defaultColor: "white"
    readonly property color successColor: "green"
    readonly property color warningColor: "yellow"
    readonly property color dangerColor: "red"
}
