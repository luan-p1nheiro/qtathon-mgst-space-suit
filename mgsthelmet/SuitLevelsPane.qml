import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: dataPane
    required property string titleValue
    required property string dataValue
    required property string iconValue

    RowLayout {
        Label {
            id: iconLabel
            font: Style.subtitle
            text: dataPane.iconValue
        }

        Label {
            id: titleLabel
            font: Style.subtitle
            text: dataPane.titleValue
        }
        Label {
            id: dataLabel
            font: Style.data
            text: dataPane.dataValue
        }
    }
}
