import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: data
    required property string titleValue
    required property string dataValue
    required property string iconValue

    Label {
        id: iconLabel
        font: Style.data
        text: data.iconValue
    }
    Label {
        id: titleLabel
        font: Style.data
        text: data.titleValue
    }
    Label {
        id: dataLabel
        font: Style.data
        text: data.dataValue
    }
}
