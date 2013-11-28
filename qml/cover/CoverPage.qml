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

CoverBackground {

    CoverActionList {
        CoverAction {
            id: pause
            iconSource: "image://theme/icon-cover-pause"
            onTriggered: {
                if(mainPage.clockRunning){
                    mainPage.reset_controls()
                }
            }
        }
        CoverAction {
            id: start
            iconSource: "image://theme/icon-cover-play"
            onTriggered: {
                if(!mainPage.clockRunning){
                    mainPage.pre_start_controls()
                }
            }
        }
    }
    Column {
        id: coverContent
        width: parent.width

        Item {
            id: spacer
            height: 10
            width: parent.width
        }
        Image {
            id: timeImg
            anchors.horizontalCenter: parent.horizontalCenter
            source: "image://theme/icon-s-time"
        }
        Label {
            id: recordText
            anchors.horizontalCenter: parent.horizontalCenter
            text: mainPage.clockRunning ? "current" : mainPage.countdownRunning ? "countdown" : "record"
        }
        Label {
            id: recordTime
            anchors.horizontalCenter: parent.horizontalCenter
            text: mainPage.clockRunning || mainPage.countdownRunning ? mainPage.current : mainPage.record
            font.pixelSize: Theme.fontSizeLarge
            color: Theme.highlightColor
        }
        Separator {
            width: coverContent.width
            color: Theme.highlightColor
        }
        Item {
            width: parent.width
            height: 30
        }
        Label {
            id: averageTime
            anchors.horizontalCenter: parent.horizontalCenter
            text: "average: "+mainPage.average
            font.pixelSize: Theme.fontSizeTiny
            color: Theme.secondaryColor
        }
        Label {
            id: lastTime
            anchors.horizontalCenter: parent.horizontalCenter
            text: "last: "+mainPage.last
            font.pixelSize: Theme.fontSizeTiny
            color: Theme.secondaryColor
        }
    }
}


