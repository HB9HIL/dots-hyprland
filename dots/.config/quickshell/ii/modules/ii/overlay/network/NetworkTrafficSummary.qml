// NetworkTrafficSummary.qml  
component NetworkTrafficSummary: RowLayout {  
    id: root  
    required property list<real> downloadHistory  
    required property list<real> uploadHistory  
      
    ColumnLayout {  
        Layout.fillWidth: true  
        spacing: 4  
          
        // Download  
        RowLayout {  
            StyledText {  
                text: "↓ " + formatBytes(root.downloadHistory[root.downloadHistory.length - 1] || 0) + "/s"  
            }  
        }  
          
        // Upload    
        RowLayout {  
            StyledText {  
                text: "↑ " + formatBytes(root.uploadHistory[root.uploadHistory.length - 1] || 0) + "/s"  
            }  
        }  
    }  
      
    function formatBytes(bytes) {  
        if (bytes < 1024) return bytes.toFixed(0) + " B";  
        if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + " KB";  
        return (bytes / (1024 * 1024)).toFixed(1) + " MB";  
    }  
}