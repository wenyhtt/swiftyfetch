import Foundation

struct DeviceCollector {
    static func getEnergyStatus() -> String? {
        #if os(macOS)
            if #available(macOS 12.0, *) {
                let isLowPower = ProcessInfo.processInfo.isLowPowerModeEnabled
                return isLowPower ? "Saving 🍃" : "Performance ⚡️"
            }
        #endif
        return nil  // Return nil if it's Linux or an old Mac
    }

    static func getDeviceModel() -> String {
        #if os(macOS)
            // On Mac, we ask the system management for 'hw.model'
            var size = 0
            sysctlbyname("hw.model", nil, &size, nil, 0)
            var model = [CChar](repeating: 0, count: size)
            sysctlbyname("hw.model", &model, &size, nil, 0)
            return String(cString: model)
        #else
            // On Linux, we read the 'product_name' file
            let path = "/sys/class/dmi/id/product_name"
            if let model = try? String(contentsOfFile: path, encoding: .utf8) {
                return model.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            return "Unknown Model"
        #endif
    }
}
