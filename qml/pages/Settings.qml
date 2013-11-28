import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: settingsPage
    anchors.fill: parent

    PageHeader {
        id: header
        title: "CubeTimer - Settings"
    }

    onStatusChanged: {
        if(status === PageStatus.Inactive){
            rubikCom.saveSettings(stopwatchSwitch.checked, inspectionSwitch.checked, timeSelect.currentIndex)
        }
        else if(status === PageStatus.Active){
            rubikCom.loadSettings()
        }
    }

    Column {
        id: settingsContent
        anchors.top: header.bottom
        width: parent.width
        spacing: Theme.paddingLarge

        TextSwitch {
            id: stopwatchSwitch
            x: Theme.paddingMedium
            text: "Stopwatch mode"
            checked: rubikCom.stopwatchMode
        }
        TextSwitch {
            id: inspectionSwitch
            x: Theme.paddingMedium
            text: "Inspection time"
            checked: rubikCom.inspectionMode
        }
        ComboBox {
            id: timeSelect
            x: Theme.paddingMedium

            label: "Inspection time: "
            visible: inspectionSwitch.checked ? true : false
            currentIndex: rubikCom.inspectionTime ? rubikCom.inspectionTime : 0

            menu: ContextMenu {
                MenuItem {text: "05 seconds"}
                MenuItem {text: "10 seconds"}
                MenuItem {text: "15 seconds"}
                MenuItem {text: "20 seconds"}
                MenuItem {text: "25 seconds"}
                MenuItem {text: "30 seconds"}
            }
        }
        Separator {
            id: seperator
            width: parent.width
            color: Theme.secondaryHighlightColor
            //alignment: Qt.AlignHCenter
        }
        Button {
            id: deleteLabel
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Reset Times"
            onClicked: {
                pageStack.push(myWarnDialog)
            }
        }
    }


    /*
     * Complete Reset dialog, short enough to be in Settings.qml
     */

    Component {
        id: myWarnDialog

        Dialog {
        id: warningDialog

            anchors.fill: parent

            onRejected: {
                warningDialog.close()
            }
            onAccepted: {
                if(allData.checked){rubikCom.resetData()}
                if(recordData.checked){rubikCom.resetRecord()}
            }

            Column {
                id: content
                anchors.top: header.bottom
                width: parent.width

                DialogHeader {
                    id: header
                    acceptText: "Delete"
                }
                Label {
                    x: Theme.paddingMedium
                    text: "What do you want to delete?"
                    font.bold: true
                    font.pixelSize: Theme.fontSizeMedium
                    color: Theme.highlightColor
                }
                TextSwitch {
                    id: allData

                    x: Theme.paddingMedium
                    text: "delete all time data"
                    enabled: recordData.checked ? false : true
                }
                TextSwitch {
                    id: recordData

                    x: Theme.paddingMedium
                    text: "just the record time"
                    enabled: allData.checked ? false : true
                }
            }
        }
    }
}

