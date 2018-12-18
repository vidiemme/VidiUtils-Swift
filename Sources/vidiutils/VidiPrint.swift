//Vidiprint public class

import Foundation

public enum VidiEvent: String {
    case debug = "🐛"
    case warning = "⚠️"
    case error = "🔥"
}

public struct vidiprint {
    
    public static var printFile: Bool = true
    public static var printFunc: Bool = true
    public static var printLine: Bool = true
    public static var loggerHandler: ((String, VidiEvent) -> (Void))?
    
    fileprivate init() { }
    
    //debug
    public static func d(_ items: String, separator: String = "", terminator: String = "\n", file: String = #file, line: Int = #line, funcName: String = #function) {
        let newItems = "\(VidiEvent.debug.rawValue) \(addInfos(items: items, file: file, line: line, funcName: funcName))"
        vidiprint.loggerHandler?(newItems, .debug)
        #if DEBUG
        _vidiprint(newItems, separator: separator, terminator: terminator, file: file, line: line, funcName: funcName)
        #endif
    }
    
    //warning
    public static func w(_ items: String, separator: String = "", terminator: String = "\n", file: String = #file, line: Int = #line, funcName: String = #function) {
        let newItems = "\(VidiEvent.warning.rawValue) \(addInfos(items: items, file: file, line: line, funcName: funcName))"
        vidiprint.loggerHandler?(newItems, .warning)
        #if DEBUG
        _vidiprint(newItems, separator: separator, terminator: terminator, file: file, line: line, funcName: funcName)
        #endif
    }
    
    //error
    public static func e(_ items: String, separator: String = "", terminator: String = "\n", file: String = #file, line: Int = #line, funcName: String = #function) {
        let newItems = "\(VidiEvent.error.rawValue) \(addInfos(items: items, file: file, line: line, funcName: funcName))"
        vidiprint.loggerHandler?(newItems, .error)
        #if DEBUG
        _vidiprint(newItems, separator: separator, terminator: terminator, file: file, line: line, funcName: funcName)
        #endif
    }
    
    fileprivate static func addInfos(items: String, file: String, line: Int, funcName: String) -> String {
        var newItems = items
        let fileName = URL(fileURLWithPath: file).lastPathComponent
        if self.printFunc || self.printLine || self.printFile {
            var prefix = "["
            if self.printFile { prefix.append("\(fileName)") }
            if self.printLine { prefix.append(" line:\(line)") }
            if self.printFunc { prefix.append(" \(funcName)") }
            prefix.append("]:")
            newItems = "\(prefix) \(newItems)"
        }
        return newItems
    }
}

fileprivate func _vidiprint(_ items: Any, separator: String = "", terminator: String = "\n", file: String = #file, line: Int = #line, funcName: String = #function) {
    print(items, separator: separator, terminator: terminator)
}

