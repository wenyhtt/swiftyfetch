import Foundation

func getPhysicalMemory() -> String {
    let totalBytes = ProcessInfo.processInfo.physicalMemory
    let gigabytes = Double(totalBytes) / 1024 / 1024 / 1024
    return String(format: "%.1f GB", gigabytes)
}

@main
struct swiftfetch {
    static func main() {
        let asciiLogo = LogoLoader.loadLogo(named: "swift")

        // Print Logo
        print("\(Colors.orange)\(Colors.bold)\(asciiLogo)\(Colors.reset)")

        // Print System Info
        print(
            "\(Colors.orange)OS:\(Colors.reset) \(ProcessInfo.processInfo.operatingSystemVersionString)"
        )
        print(
            "\(Colors.orange)Uptime:\(Colors.reset) \(Int(ProcessInfo.processInfo.systemUptime / 3600)) hours"
        )
        print("\(Colors.orange)Memory:\(Colors.reset)  \(getPhysicalMemory())")
        // Check enery mode on macOS
        #if os(macOS)
            var energyStatus = "Unknown"
            if #available(macOS 12.0, *) {
                let isLowPower = ProcessInfo.processInfo.isLowPowerModeEnabled
                energyStatus = isLowPower ? "Saving 🍃" : "Performance ⚡️"
            } else {
                energyStatus = "Not Supported ⚠️"
            }
            print(
                "\(Colors.orange)Energy:\(Colors.reset) \(energyStatus)"
            )
        #endif

        // Color Palette bar
        print("\n\u{1b}[41m  \u{1b}[42m  \u{1b}[43m  \u{1b}[44m  \u{1b}[45m  \(Colors.reset)")
    }
}
