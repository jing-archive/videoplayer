/*
 * SPDX-FileCopyrightText: 2020 George Florea Bănuș <georgefb899@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import org.kde.kirigami 2.11 as Kirigami

import AppSettings 1.0

Kirigami.BasicListItem {
    id: root

    property bool isPlaying: model.isPlaying

    height: label.font.pointSize * 3 + AppSettings.playlistRowHeight
    padding: 0
    contentItem: Rectangle {
        color: {
            let color = Kirigami.Theme.alternateBackgroundColor
            Qt.hsla(color.hslHue, color.hslSaturation, color.hslLightness, 0.6)
        }
        RowLayout {
            anchors.fill: parent
            Kirigami.Icon {
                source: "media-playback-start"
                width: Kirigami.Units.iconSizes.small
                height: Kirigami.Units.iconSizes.small
                visible: isPlaying
                Layout.leftMargin: Kirigami.Units.largeSpacing
            }

            Label {
                id: label

                color: Kirigami.Theme.textColor
                horizontalAlignment: Qt.AlignLeft
                verticalAlignment: Qt.AlignVCenter
                elide: Text.ElideRight
                font.pointSize: (window.isFullScreen() && playList.bigFont)
                                ? Kirigami.Units.gridUnit
                                : Kirigami.Units.gridUnit - 6
                font.weight: isPlaying ? Font.ExtraBold : Font.Normal
                text: model.name
                layer.enabled: true
                Layout.fillWidth: true
                Layout.rightMargin: Kirigami.Units.largeSpacing
                Layout.leftMargin: isPlaying ? 0 : Kirigami.Units.largeSpacing
                ToolTip {
                    id: toolTip

                    visible: labelMouseArea.containsMouse && label.truncated
                    text: model.name
                    font.pointSize: label.font.pointSize + 2
                }
                MouseArea {
                    id: labelMouseArea
                    anchors.fill: parent
                    acceptedButtons: Qt.NoButton
                    hoverEnabled: true
                }
            }

            Label {
                text: model.duration
                font.pointSize: (window.isFullScreen() && playList.bigFont)
                                ? Kirigami.Units.gridUnit
                                : Kirigami.Units.gridUnit - 6
                horizontalAlignment: Qt.AlignCenter
                Layout.margins: Kirigami.Units.largeSpacing
            }
        }
    }
    onDoubleClicked: {
        window.openFile(model.path, true, false)
        playListModel.setPlayingVideo(index)
    }
}
