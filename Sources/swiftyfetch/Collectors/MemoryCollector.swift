import Foundation

struct MemoryCollector {
    static func getPhysicalMemory() -> String {
        let totalBytes = ProcessInfo.processInfo.physicalMemory
        let gigabytes = Double(totalBytes) / 1024 / 1024 / 1024
        return String(format: "%.1f GB", gigabytes)
    }
}
