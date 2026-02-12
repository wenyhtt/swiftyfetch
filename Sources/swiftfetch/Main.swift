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
        print("\(Colors.orange)OS:\(Colors.reset) \(SystemCollector.getOSName())")
        print("\(Colors.orange)Host:\(Colors.reset) \(SystemCollector.getHostInfo())")
        print("\(Colors.orange)Uptime:\(Colors.reset) \(SystemCollector.getUptime())")
        print("\(Colors.orange)Device:\(Colors.reset) \(DeviceCollector.getDeviceModel())")
        print("\(Colors.orange)Kernel:\(Colors.reset) \(SystemCollector.getKernelVersion())")
        print("\(Colors.orange)Shell:\(Colors.reset) \(SystemCollector.getShell())")
        print("\(Colors.orange)RAM:\(Colors.reset) \(MemoryCollector.getPhysicalMemory())")

        // Energy Status (for macOS)
        if let energy = DeviceCollector.getEnergyStatus() {
            print("\(Colors.orange)Energy:\(Colors.reset) \(energy)")
        }

        // Color Palette bar
        print("\n\u{1b}[41m  \u{1b}[42m  \u{1b}[43m  \u{1b}[44m  \u{1b}[45m  \(Colors.reset)")
    }
}
