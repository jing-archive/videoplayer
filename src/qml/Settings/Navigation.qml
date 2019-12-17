import QtQuick 2.0
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13

Item {
    id: root

    property int iconSize: 32
    property var active: general

    height: parent.height
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    Rectangle {
        width: 1
        height: parent.height
        anchors.right: parent.right
        color: systemPalette.base
    }

    ColumnLayout {
        width: parent.width
        ToolButton {
            id: general
            text: "General"
            checkable: true
            checked: true
            icon.name: "configure"
            icon.width: root.iconSize
            icon.height: root.iconSize
            display: AbstractButton.TextUnderIcon
            Layout.fillWidth: true
            onClicked: {
                settingsViewLoader.sourceComponent = generalSettings
                active.checked = false
                active = general
            }
        }
        ToolButton {
            id: colors
            text: "Color Adjustments"
            checkable: true
            icon.name: "color-management"
            icon.width: root.iconSize
            icon.height: root.iconSize
            display: AbstractButton.TextUnderIcon
            Layout.fillWidth: true
            onClicked: {
                settingsViewLoader.sourceComponent = colorAdjustmentsSettings
                active.checked = false
                active = colors
            }
        }
        ToolButton {
            id: mouse
            text: "Mouse"
            checkable: true
            icon.name: "input-mouse"
            icon.width: root.iconSize
            icon.height: root.iconSize
            display: AbstractButton.TextUnderIcon
            Layout.fillWidth: true
            onClicked: {
                settingsViewLoader.sourceComponent = mouseSettings
                active.checked = false
                active = mouse
            }
        }
        ToolButton {
            id: playlist
            text: "Playlist"
            checkable: true
            icon.name: "view-media-playlist"
            icon.width: root.iconSize
            icon.height: root.iconSize
            display: AbstractButton.TextUnderIcon
            Layout.fillWidth: true
            onClicked: {
                settingsViewLoader.sourceComponent = playlistSettings
                active.checked = false
                active = playlist
            }
        }
        ToolButton {
            id: audio
            text: "Audio"
            checkable: true
            icon.name: "audio-speakers-symbolic"
            icon.width: root.iconSize
            icon.height: root.iconSize
            display: AbstractButton.TextUnderIcon
            Layout.fillWidth: true
            onClicked: {
                settingsViewLoader.sourceComponent = audioSettings
                active.checked = false
                active = audio
            }
        }
        ToolButton {
            id: subtitles
            text: "Subtitles"
            checkable: true
            icon.name: "media-view-subtitles-symbolic"
            icon.width: root.iconSize
            icon.height: root.iconSize
            display: AbstractButton.TextUnderIcon
            Layout.fillWidth: true
            onClicked: {
                settingsViewLoader.sourceComponent = subtitlesSettings
                active.checked = false
                active = subtitles
            }
        }
    }
}
