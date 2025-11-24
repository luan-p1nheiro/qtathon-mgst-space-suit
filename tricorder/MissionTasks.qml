import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    radius: 8
    color: "transparent"
    Layout.fillWidth: true
    Layout.fillHeight: true

    property var currentMission

    signal exceededAllowedDuration(int taskIndex)


    ButtonGroup { id: taskGroup }

    function secondsToTimeString(sec) {
        var m = Math.floor(sec / 60)
        var s = sec % 60
        return m + ":" + (s < 10 ? "0" + s : s)
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Style.margins
        spacing: 12

        Text {
            text: "MISSION SCREEN"
            font: Style.title
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
        }


        ListModel {
            id: tasksModel

            ListElement { title: "Comms Check"; description: "Verify all communication systems, including radios and antennas, are functional. Ensure backup channels are ready and perform a signal clarity test with base."; done: false; equipments: "Radio,Antenna,Batteries"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
            ListElement { title: "Perimeter Scan"; description: "Walk the entire perimeter to detect any anomalies, obstacles, or potential security breaches. Record all findings and environmental observations."; done: false; equipments: "Flashlight,Rope,Scanner"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
            ListElement { title: "O2 Inspection"; description: "Analyze oxygen tank levels to ensure adequate supply. Inspect valves, pressure gauges, and filters, and log any irregularities or maintenance needs."; done: false; equipments: "Oxygen Sensor,Pressure Gauge,Spare Tanks"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
            ListElement { title: "Temp Survey"; description: "Collect temperature readings from multiple locations inside and outside the facility. Record data for environmental analysis and safety monitoring."; done: false; equipments: "Thermometer,Data Logger,Protective Gloves"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
            ListElement { title: "Suit Check"; description: "Perform a full diagnostic of the protective suit, including helmet integrity, seal conditions, and electronic components. Ensure suit safety for upcoming operations."; done: false; equipments: "Diagnostic Kit,Sealing Tape,Backup Helmet"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
            ListElement { title: "CO2 Check"; description: "Measure carbon dioxide accumulation within the environment. Ensure filters are functioning properly and atmospheric levels remain safe for personnel."; done: false; equipments: "CO2 Meter,Filter Replacement,Safety Mask"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
            ListElement { title: "Power Check"; description: "Inspect all power cells and circuits to confirm full operational status. Replace depleted cells and verify voltage stability across connected systems."; done: false; equipments: "Multimeter,Spare Cells,Voltage Tester"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
            ListElement { title: "Env Scan"; description: "Perform a comprehensive environmental scan using sensors and cameras. Collect data on hazards, obstacles, and general environmental conditions."; done: false; equipments: "Scanner,Camera,Sampling Kit"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
            ListElement { title: "Data Sync"; description: "Upload all collected mission data to the central server. Verify file integrity and ensure proper backup copies are saved for future reference."; done: false; equipments: "Laptop,Data Cable,Backup Drive"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
            ListElement { title: "Nav Calibration"; description: "Calibrate navigation sensors and GPS units to ensure precise positioning and route mapping. Record calibration results for validation and future missions."; done: false; equipments: "Compass,GPS Device,Calibration Tool"; maximumAllowedDuration: 360; projectedDurationSeconds: 300; timeTaken: "" }
        }


        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 8
            model: tasksModel

            delegate: Column {
                width: parent.width
                spacing: 4

                Row {
                    width: parent.width
                    spacing: 10

                    RadioButton {
                        id: radio
                        ButtonGroup.group: taskGroup
                        checked: done
                        anchors.verticalCenter: titleText.verticalCenter

                        onCheckedChanged: {
                            if (checked) {
                                root.currentMission = {
                                    id: model.idMission,
                                    title: model.title,
                                    description: model.description,
                                    equipments: model.equipments.split(",")  // se for string
                                }
                            }
                        }


                    }

                    Text {
                        id: titleText
                        text: `${index + 1}. ${title}`
                        font: Style.data
                        color: done ? "#66ff66" : "white"
                        wrapMode: Text.NoWrap

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: detailsPopup.open()
                        }
                    }
                }

                Text {
                    text: "Maximum Allowed Duration: " + secondsToTimeString(maximumAllowedDuration)
                    font: Style.small
                    color: "#ccc"
                }

                Text {
                    text: "Time Taken: " + (timeTaken !== "" ? timeTaken : "Not finished")
                    font: Style.small
                    color: timeTaken !== "" ? "#66ff66" : "#888"
                }

                Rectangle { height: 1; width: parent.width; color: "#444" }

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
                        contentHeight: content.implicitHeight
                        clip: true

                        Column {
                            id: content
                            width: parent.width - 20
                            spacing: 10
                            anchors.margins: 10

                            Text { text: title; font: Style.subtitle; color: "white" }
                            Text { text: description; font: Style.small; color: "#ccc"; wrapMode: Text.Wrap }

                            Text {
                                text: "Maximum Allowed Duration: " + secondsToTimeString(maximumAllowedDuration)
                                font: Style.small
                                color: "#ccc"
                            }

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
}
