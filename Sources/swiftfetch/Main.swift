import Foundation

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
        // print("\(Colors.orange)Memory:\(Colors.reset)  \(processInfo.physicalMemory / 1024 / 1024 / 1024) GB")
        // Check enery mode on macOS
        #if os(macOS)
            let isLowPower = ProcessInfo.processInfo.isLowPowerModeEnabled
            print(
                "\(Colors.orange)Energy:\(Colors.reset) \(isLowPower ? "Saving 🍃" : "Performance ⚡️")"
            )
        #else
            // Linux doesn't have this API
            print("\(Colors.orange)Energy:\(Colors.reset) N/A on Linux")
        #endif

        // Color Palette bar
        print("\n\u{1b}[41m  \u{1b}[42m  \u{1b}[43m  \u{1b}[44m  \u{1b}[45m  \(Colors.reset)")
    }
}
