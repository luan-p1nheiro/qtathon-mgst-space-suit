pragma Singleton

import QtQuick

Item {
    readonly property FontLoader regularFont: FontLoader {
        source: "fonts/DepartureMono/DepartureMonoNerdFont-Regular.otf"
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

    readonly property real spacing: 10
    readonly property real margins: 10
}
