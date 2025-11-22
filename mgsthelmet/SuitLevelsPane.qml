import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: dataPane
    required property string titleValue
    required property string dataValue

    RowLayout {
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
