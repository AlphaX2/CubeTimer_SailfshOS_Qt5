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

    property alias clockRunning: timeStringGetter.running
    property alias countdownRunning: countdownStringGetter.running
    property alias current: clock.text
    property alias record: bestTime.text
    property alias average: averageTime.text
    property alias last: lastTime.text
    property int duration: 0

    ///// Functions and Timers are nearly 100% from BB10 edition /////

    /////////// functions controlling start/stop depending on the settings //////////

    function pre_start_controls() {
        if (rubikCom.inspectionMode) { // check that inspection is selected from options

            if (countdownStringGetter.running) { // check that inspection is running or not
                // if running stop everything and set clock to 00:00:00
                duration = 0
                startTimer.stop()
                countdownStringGetter.stop()
                clock.text = "00:00:00"
            }
            else {
                // if not running start the countdown and start QTimer
                var possibleDurations = {0: 5000,
                                         1: 10000,
                                         2: 15000,
                                         3: 20000,
                                         4: 25000,
                                         5: 30000}

                duration = possibleDurations[rubikCom.inspectionTime]

                startTimer.interval = duration

                //update the clock one time directly with the selected inspection time
                clock.text = rubikCom.getNewCountdownString(duration)

                startTimer.start()
                countdownStringGetter.start()
            }
        }
        else { // inspection is not selected -> start normal
            page.start_controls()
        }
    }

    function start_controls() {
        // stop all countdown related stuff
        countdownStringGetter.stop()
        startTimer.stop()

        // start the clock for counting up and getting your time
        rubikCom.restartTimer() // Set QTime behind the scences back to 0 before you start
        timeStringGetter.start() // on every timout (10ms) updates the time on the clock
    }

    function reset_controls() {

        // do all important checks and saving stuff here!
        timeStringGetter.stop() // stop getting updated times
        startTimer.stop()
        countdownStringGetter.stop()

        lastTime.text = clock.text // set last time to the stopped time from clock
        clock.text = "00:00:00" // set timer text at clock back to 0

        // IF NOT STOPWATCH MODE: do all the saving and record checking stuff, IF STOPWATCH
        // we are finished, because all the saving stuff is not needed!
        if (!rubikCom.stopwatchMode) {
            var record = rubikCom.checkRecord(bestTime.text, lastTime.text) // check for record

            // if record save the last time as new best time and show a dialog that the user got a new record
            if (record) {
                // TODO : SHOW NEW RECORD MSG HERE!
                rubikCom.saveTimes(lastTime.text, lastTime.text)
            } else {
                // save times to save file
                rubikCom.saveTimes(bestTime.text, lastTime.text)
            }
        }
    }

    /////////// timers to start countdown/clock ///////////

    // timer to get new time string while clock is running
    Timer {
        id: timeStringGetter

        running: false
        repeat: true
        interval: 1
        onTriggered: clock.text = rubikCom.getNewTimeString()
    }

    // timer that updates the clock string while countdown is running
    Timer {
        id: countdownStringGetter

        running: false
        repeat: true
        interval: 1000
        onTriggered: {
            duration -= 1000
            clock.text = rubikCom.getNewCountdownString(duration)
        }
    }

    // "invisible" timer that stops the countdown and starts the clock
    Timer {
        id: startTimer
        repeat: false
        onTriggered: {
            countdownStringGetter.stop()
            start_controls()
        }
    }

    ////////// Real page content ///////////

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
                text: "Scramble again"
                visible: rubikCom.stopwatchMode ? false : true
                onClicked: {
                    scrambleField.text = rubikCom.getScrambleStr()
                }
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
                id: scrambleField
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
                     * You'll find all start/stop logic
                     * in seperated functions, this should
                     * be faster and cleaner than packaging
                     * all the stuff in the onReleased property.
                     */

                    onReleased: {
                        if(timeStringGetter.running){
                            reset_controls()
                        }
                        else{
                            pre_start_controls()
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
                    width: page.width / 2   // split the width to align it in the middle

                    Label {
                        id: lastTime_text
                        anchors.right: parent.right
                        text: "last time:"
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryColor
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
                    width: page.width / 2   // split the width to align it in the middle

                    Label {
                        id: lastTime
                        x: Theme.paddingMedium
                        text: rubikCom.lastTimeString
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.secondaryColor
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
