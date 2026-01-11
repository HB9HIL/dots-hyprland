import QtQuick
import QtQuick.Layouts
import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets

RowLayout {
    id: root

    property color color: Appearance.colors.colOnLayer0
    property real downloadBps: Network.downloadHistory.length > 0 ? Network.downloadHistory[Network.downloadHistory.length - 1] : 0
    property real uploadBps: Network.uploadHistory.length > 0 ? Network.uploadHistory[Network.uploadHistory.length - 1] : 0

    spacing: 8
    Layout.alignment: Qt.AlignVCenter
    visible: Network.activeInterface !== ""

    MaterialSymbol {
        Layout.fillWidth: false
        Layout.preferredWidth: Appearance.font.pixelSize.normal
        Layout.preferredHeight: Appearance.font.pixelSize.normal
        text: "south"
        iconSize: Appearance.font.pixelSize.normal
        color: root.color
    }

    StyledText {
        color: root.color
        font {
            pixelSize: Appearance.font.pixelSize.small
            family: Appearance.font.family.numbers
        }
        text: formatBytes(downloadBps)
        Layout.preferredWidth: 50
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
    }

    Item {
        Layout.preferredWidth: 4
    }

    MaterialSymbol {
        Layout.fillWidth: false
        Layout.preferredWidth: Appearance.font.pixelSize.normal
        Layout.preferredHeight: Appearance.font.pixelSize.normal
        text: "north"
        iconSize: Appearance.font.pixelSize.normal
        color: root.color
    }

    StyledText {
        color: root.color
        font {
            pixelSize: Appearance.font.pixelSize.small
            family: Appearance.font.family.numbers
        }
        text: formatBytes(uploadBps)
        Layout.preferredWidth: 50
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        Layout.rightMargin: 4
    }

    function formatBytes(bytes) {
        if (bytes < 1024) return bytes.toFixed(0) + " B/s";
        if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + " KB/s";
        if (bytes < 1024 * 1024 * 1024) return (bytes / (1024 * 1024)).toFixed(1) + " MB/s";
        return (bytes / (1024 * 1024 * 1024)).toFixed(2) + " GB/s";
    }
}
