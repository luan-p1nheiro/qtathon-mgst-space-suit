import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: data
    property string titleValue: ""
    property string dataValue: ""
    property string iconValue: ""
    property color color: Style.defaultColor

    Label {
        id: iconLabel
        visible: data.iconValue
        color: data.color
        font: Style.iconData
        text: data.iconValue
    }
    Label {
        id: titleLabel
        visible: data.titleValue
        color: data.color
        font: Style.data
        text: data.titleValue
    }
    Label {
        id: dataLabel
        visible: data.dataValue
        color: data.color
        font: Style.data
        text: data.dataValue
    }
}
