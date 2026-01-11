import qs.modules.common
import qs.modules.common.widgets
import qs.services
import QtQuick
import QtQuick.Layouts

StyledPopup {
    id: root

    // Helper functions
    function formatKB(kb) {
        return (kb / (1024 * 1024)).toFixed(1) + " GB";
    }
    function formatBps(bytes) {
        if (bytes < 1024) return bytes.toFixed(0) + " B/s";
        if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + " KB/s";
        if (bytes < 1024 * 1024 * 1024) return (bytes / (1024 * 1024)).toFixed(1) + " MB/s";
        return (bytes / (1024 * 1024 * 1024)).toFixed(2) + " GB/s";
    }

    Row {
        anchors.centerIn: parent
        spacing: 12

        Column {
            anchors.top: parent.top
            spacing: 8

            StyledPopupHeaderRow {
                icon: "memory"
                label: "RAM"
            }
            Column {
                spacing: 4
                StyledPopupValueRow {
                    icon: "clock_loader_60"
                    label: Translation.tr("Used:")
                    value: root.formatKB(ResourceUsage.memoryUsed)
                }
                StyledPopupValueRow {
                    icon: "check_circle"
                    label: Translation.tr("Free:")
                    value: root.formatKB(ResourceUsage.memoryFree)
                }
                StyledPopupValueRow {
                    icon: "empty_dashboard"
                    label: Translation.tr("Total:")
                    value: root.formatKB(ResourceUsage.memoryTotal)
                }
            }
        }

        Column {
            visible: ResourceUsage.swapTotal > 0
            anchors.top: parent.top
            spacing: 8

            StyledPopupHeaderRow {
                icon: "swap_horiz"
                label: "Swap"
            }
            Column {
                spacing: 4
                StyledPopupValueRow {
                    icon: "clock_loader_60"
                    label: Translation.tr("Used:")
                    value: root.formatKB(ResourceUsage.swapUsed)
                }
                StyledPopupValueRow {
                    icon: "check_circle"
                    label: Translation.tr("Free:")
                    value: root.formatKB(ResourceUsage.swapFree)
                }
                StyledPopupValueRow {
                    icon: "empty_dashboard"
                    label: Translation.tr("Total:")
                    value: root.formatKB(ResourceUsage.swapTotal)
                }
            }
        }

        Column {
            anchors.top: parent.top
            spacing: 8

            StyledPopupHeaderRow {
                icon: "planner_review"
                label: "CPU"
            }
            Column {
                spacing: 4
                StyledPopupValueRow {
                    icon: "bolt"
                    label: Translation.tr("Load:")
                    value: `${Math.round(ResourceUsage.cpuUsage * 100)}%`
                }
            }
        }

        Column {
            visible: Network.activeInterface !== ""
            anchors.top: parent.top
            spacing: 8

            StyledPopupHeaderRow {
                icon: "upload_download"
                label: Translation.tr("Network")
            }
            Column {
                spacing: 4
                StyledPopupValueRow {
                    icon: "settings_ethernet"
                    label: Translation.tr("Interface:")
                    value: Network.activeInterface || Translation.tr("n/a")
                }
                StyledPopupValueRow {
                    icon: "south"
                    label: Translation.tr("Down:")
                    value: formatBps(Network.downloadRate)
                }
                StyledPopupValueRow {
                    icon: "north"
                    label: Translation.tr("Up:")
                    value: formatBps(Network.uploadRate)
                }
                StyledPopupValueRow {
                    icon: "stacked_bar_chart"
                    label: Translation.tr("Peak (recent):")
                    value: formatBps(Network.netRecentPeak)
                }
            }
        }
    }
}
