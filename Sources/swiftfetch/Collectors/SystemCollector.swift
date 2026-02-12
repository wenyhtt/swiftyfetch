import Foundation

struct SystemCollector {
    static func getOSName() -> String {
        #if os(macOS)
            return "macOS \(ProcessInfo.processInfo.operatingSystemVersionString)"
        #else
            return ProcessInfo.processInfo.operatingSystemVersionString
        #endif
    }

    static func getUptime() -> String {
        let uptimeInterval = ProcessInfo.processInfo.systemUptime
        let uptimeHours = Int(uptimeInterval) / 3600
        let uptimeMinutes = (Int(uptimeInterval) % 3600) / 60
        return "\(uptimeHours)h \(uptimeMinutes)m"
    }

    static func getShell() -> String {
        return ProcessInfo.processInfo.environment["SHELL"]?.components(separatedBy: "/").last
            ?? "unknown"
    }

    static func getHostInfo() -> String {
        let hostname = ProcessInfo.processInfo.hostName
        let username = NSUserName()  // Standard Foundation way to get current user
        return "\(username)@\(hostname)"
    }

    static func getKernelVersion() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)

        // Convert the C-string 'release' to a Swift String
        let mirror = Mirror(reflecting: systemInfo.release)
        let version = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return version
    }
}
