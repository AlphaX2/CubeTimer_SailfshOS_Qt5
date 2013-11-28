/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property alias running: clockTimer.running
    property alias current: clock.text
    property alias record: bestTime.text
    property alias average: averageTime.text
    property alias last: lastTime.text
    property int duration: 0

    // timer to get new time string while clock is running
    Timer {
        id: clockTimer

        running: false
        repeat: true
        interval: 1
        onTriggered: clock.text = rubikCom.getNewTimeString()
    }

    // timer that updates the clock string while countdown is running
    Timer {
        id: countdownTimer

        running: false
        repeat: true
        interval: 1000
        onTriggered: {
            if(duration > 0){
                clock.text = rubikCom.getNewCountdownString(duration);
                duration -= 1000
            }
            else if(duration <= 0){
                clock.text = "00:00:00"
                countdownTimer.stop()

                // reset the internal QTime and have to be called before starting clockTimer
                rubikCom.restartTimer()
                clockTimer.start()
            }
        }
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("AboutDialog.qml"))
                }
            }
            MenuItem {
                text: "Settings"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("Settings.qml"))
                }
            }
            MenuItem {
                text: "Reset"
                onClicked: {}
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: mainColumn.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: mainColumn

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: rubikCom.stopwatchMode ? "CubeTimer - Stopwatch" : "CubeTimer"
            }
            TextEdit {
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.rightMargin: 25
                anchors.leftMargin: 25

                text: rubikCom.getScrambleStr()
                color: Theme.secondaryColor
                font.pixelSize: Theme.fontSizeExtraSmall
                horizontalAlignment: TextEdit.AlignHCenter
                wrapMode: TextEdit.WordWrap
                readOnly: true
                visible: rubikCom.stopwatchMode ? false : true
            }
            Separator {
                id: upperSeparator
                width: parent.width
                color: Theme.highlightColor
            }
            Rectangle {
                id: clockBackground
                width: parent.width
                height: 200
                color: Theme.secondaryHighlightColor

                Label {
                    id: clock
                    anchors.centerIn: clockBackground

                    text: "00:00:00"
                    font.pixelSize: 125
                    font.family: "Source Sans Pro"
                    color: Theme.primaryColor
                }
                MouseArea {
                    id: startStopArea
                    anchors.fill: clockBackground

                    /*
                     * Here you'll find all start/stop logic
                     */

                    onReleased: {
                        if(rubikCom.stopwatchMode){
                            console.log("Stopwatch mode...")

                            if(clockTimer.running){
                                clockTimer.stop()
                            }
                            else {
                                // reset the internal QTime and have to be called before starting clockTimer
                                rubikCom.restartTimer()
                                clockTimer.start()
                            }
                        }
                        else if(rubikCom.inspectionMode){
                            console.log("Inspection mode...")

                            if(clockTimer.running){
                                console.log("Clock running already...")
                                clockTimer.stop()
                                lastTime.text = clock.text
                                clock.text = "00:00:00"
                                var record = rubikCom.checkRecord(bestTime.text, lastTime.text)
                                if (record) {
                                    console.log("New record!")
                                    bestTime.text = lastTime.text
                                }
                                rubikCom.saveTimes(bestTime.text, lastTime.text)
                            }
                            else if(countdownTimer.running){
                                console.log("Countdown running already!")
                                countdownTimer.stop()
                                clock.text = "00:00:00"
                            }
                            else {
                                var possibleDurations = {0: 5000,
                                                         1: 10000,
                                                         2: 15000,
                                                         3: 20000,
                                                         4: 25000,
                                                         5: 30000}

                                duration = possibleDurations[rubikCom.inspectionTime]
                                countdownTimer.start()
                            }
                        }
                        else {
                            if(clockTimer.running){
                                console.log("Clock running already!")
                                clockTimer.stop()
                                lastTime.text = clock.text
                                clock.text = "00:00:00"
                                var record = rubikCom.checkRecord(bestTime.text, lastTime.text)
                                if (record) {
                                    console.log("New record!")
                                    bestTime.text = lastTime.text
                                }
                                rubikCom.saveTimes(bestTime.text, lastTime.text)
                            }
                            else {
                                console.log("Normal mode: start clock!")

                                // reset the internal QTime and have to be called before starting clockTimer
                                rubikCom.restartTimer()
                                clockTimer.start()
                            }
                        }
                    }
                }
            }
            Separator {
                id: lowerSeparator
                width: parent.width
                color: Theme.highlightColor
            }
            Row {
                width: parent.width

                Column {
                    id: timeColumn_text
                    spacing: Theme.paddingLarge
                    width: page.width / 2

                    Label {
                        id: lastTime_text
                        anchors.right: parent.right
                        text: "last time:"
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryColor
                        visible: rubikCom.stopwatchMode ? false : true
                    }
                    Label {
                        id: averageTime_text
                        anchors.right: parent.right
                        text: "average time:"
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryColor
                        visible: rubikCom.stopwatchMode ? false : true
                    }
                    Label {
                        id: bestTime_text
                        anchors.right: parent.right
                        text: "best time:"
                        font.pixelSize: Theme.fontSizeExtraSmall
                        font.bold: true
                        color: Theme.highlightColor
                        visible: rubikCom.stopwatchMode ? false : true
                    }
                }
                Column {
                    id: timeColumn
                    spacing: Theme.paddingLarge
                    width: page.width / 2

                    Label {
                        id: lastTime
                        x: Theme.paddingMedium
                        text: rubikCom.lastTimeString
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryColor
                        visible: rubikCom.stopwatchMode ? false : true
                    }
                    Label {
                        id: averageTime
                        x: Theme.paddingMedium
                        text: rubikCom.averageTimeString
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryColor
                        visible: rubikCom.stopwatchMode ? false : true
                    }
                    Label {
                        id: bestTime
                        x: Theme.paddingMedium
                        text: rubikCom.bestTimeString
                        font.pixelSize: Theme.fontSizeExtraSmall
                        font.bold: true
                        color: Theme.highlightColor
                        visible: rubikCom.stopwatchMode ? false : true
                    }
                }
            }
        }
    }
}
