import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    radius: 8
    color: "transparent"
    Layout.fillWidth: true
    Layout.fillHeight: true

    // 🔥 NOVO — sinal quando exceder o máximo permitido
    signal exceededAllowedDuration(int taskIndex)

    property var tasksModel: tasksModel
    property var timerPanel: null

    // 🔥 Função para máximo permitido = 6:00 (fixo)
    function maxAllowableDuration() {
        return 6 * 60 // 6 minutos
    }

    // Converte "m:ss" para segundos
    function timeStringToSeconds(str) {
        var parts = str.split(":")
        return parseInt(parts[0]) * 60 + parseInt(parts[1])
    }

    // Converte segundos para "m:ss"
    function secondsToTimeString(sec) {
        var m = Math.floor(sec / 60)
        var s = sec % 60
        return m + ":" + (s < 10 ? "0" + s : s)
    }

    ListModel {
        id: tasksModel
        ListElement { title: "Comms Check"; description: "Verify communication systems..."; done: false; projectedDuration: "5:00"; equipments: "Radio,Antenna,Batteries"; timeTaken: "" }
        ListElement { title: "Perimeter Scan"; description: "Walk the perimeter..."; done: false; projectedDuration: "7:00"; equipments: "Flashlight,Rope,Scanner"; timeTaken: "" }
        ListElement { title: "O2 Inspection"; description: "Analyze oxygen tank levels..."; done: false; projectedDuration: "4:00"; equipments: "Oxygen Sensor,Pressure Gauge,Spare Tanks"; timeTaken: "" }
        ListElement { title: "Temp Survey"; description: "Collect environmental temperature readings..."; done: false; projectedDuration: "5:00"; equipments: "Thermometer,Data Logger,Protective Gloves"; timeTaken: "" }
        ListElement { title: "Suit Check"; description: "Run diagnostics on suit structure..."; done: false; projectedDuration: "9:00"; equipments: "Diagnostic Kit,Sealing Tape,Backup Helmet"; timeTaken: "" }
        ListElement { title: "CO2 Check"; description: "Measure carbon dioxide accumulation..."; done: false; projectedDuration: "4:00"; equipments: "CO2 Meter,Filter Replacement,Safety Mask"; timeTaken: "" }
        ListElement { title: "Power Check"; description: "Inspect power cells..."; done: false; projectedDuration: "3:00"; equipments: "Multimeter,Spare Cells,Voltage Tester"; timeTaken: "" }
        ListElement { title: "Env Scan"; description: "Perform a general environmental scan..."; done: false; projectedDuration: "7:00"; equipments: "Scanner,Camera,Sampling Kit"; timeTaken: "" }
        ListElement { title: "Data Sync"; description: "Upload local mission data..."; done: false; projectedDuration: "6:00"; equipments: "Laptop,Data Cable,Backup Drive"; timeTaken: "" }
        ListElement { title: "Nav Calibration"; description: "Calibrate navigation sensors..."; done: false; projectedDuration: "10:00"; equipments: "Compass,GPS Device,Calibration Tool"; timeTaken: "" }
    }

    ListView {
        anchors.fill: parent
        anchors.margins: Style.margins
        spacing: 8
        model: tasksModel

        delegate: Column {
            width: parent.width
            spacing: 4

            Row {
                width: parent.width
                spacing: 10

                CheckBox {
                    checked: done
                    onCheckedChanged: tasksModel.setProperty(index, "done", checked)
                }

                Text {
                    id: titleText
                    text: `${index + 1}. ${title}`
                    font: Style.data
                    color: done ? "#66ff66" : "white"

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            detailsPopup.open()
                            if (timerPanel) {
                                timerPanel.currentTaskIndex = index
                                timerPanel.projectedDurationSeconds = timeStringToSeconds(projectedDuration)
                                timerPanel.timeToFinish = timerPanel.projectedDurationSeconds
                            }
                        }
                    }
                }
            }

            // 🔥 MAXIMUM ALLOWABLE FIRST
            Text {
                text: "Maximum Allowable Duration: " + secondsToTimeString(maxAllowableDuration())
                font: Style.small
                color: timeStringToSeconds(projectedDuration) > maxAllowableDuration() ? "red" : "#66ff66"
            }

            // 🔥 PROJECTED DURATION BELOW
            Text {
                text: "Projected Duration: " + projectedDuration
                font: Style.small
                color: "#66ff66"
            }

            // Time Taken
            Text {
                text: timeTaken !== "" ? "Time Taken: " + timeTaken : "Time Taken: Not finished"
                font: Style.small
                color: timeTaken !== "" ? "#66ff66" : "#888"
            }

            Rectangle { height: 1; width: parent.width; color: "#444" }

            // 🔥 Aviso se a missão excede o máximo permitido
            Component.onCompleted: {
                if (timeStringToSeconds(projectedDuration) > maxAllowableDuration()) {
                    root.exceededAllowedDuration(index)
                }
            }

            // POPUP DETALHADO
            Popup {
                id: detailsPopup
                modal: false
                focus: true
                closePolicy: Popup.NoAutoClose

                width: root.width * 0.9
                height: 300
                x: (root.width - width) / 2
                y: (root.height - height) / 2

                background: Rectangle {
                    color: "#333"
                    radius: 8
                    border.color: "#666"
                }

                Flickable {
                    anchors.fill: parent
                    contentHeight: columnContent.implicitHeight
                    clip: true

                    Column {
                        id: columnContent
                        width: parent.width - 20
                        spacing: 10
                        anchors.margins: 10

                        Text { text: title; font: Style.subtitle; color: "white"; wrapMode: Text.Wrap }
                        Text { text: description; font: Style.small; color: "#ccc"; wrapMode: Text.Wrap }

                        Text {
                            text: "Time Taken: " + (timeTaken !== "" ? timeTaken : "Not finished")
                            font: Style.small
                            color: timeTaken !== "" ? "#66ff66" : "#888"
                        }

                        Button {
                            text: "Close"
                            onClicked: detailsPopup.close()
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }
    }
}
