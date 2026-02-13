import Foundation

enum Colors {
    static let reset = "\u{1b}[0m"
    static let blue = "\u{1b}[38;5;75m"
    static let green = "\u{1b}[38;5;78m"
    static let bold = "\u{1b}[1m"
    static let orange = "\u{1b}[38;2;241;80;55m"
}

struct LogoLoader {
    static func loadLogo(named name: String) -> String {
        // Look for the file inside the "./logo/" folder within the bundle
        if let url = Bundle.module.url(
            forResource: name,
            withExtension: "txt",
            subdirectory: "Resources/logos"),
            let content = try? String(contentsOf: url, encoding: .utf8)
        {
            return content
        }

        return "⚠️ Logo '\(name)' not found."
    }
}
