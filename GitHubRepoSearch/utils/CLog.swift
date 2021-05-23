//
//  CLog.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

class CLog {
    static func d(_ message: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
        #if DEBUG
            NSLog("==>[DEBUG]\(file.url.lastPathComponent):L\(line):\(function)#\(message)")
        #endif
    }
    static func i(_ message: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
        #if DEBUG
            NSLog("==>[INFO]\(file.url.lastPathComponent):L\(line):\(function)#\(message)")
        #endif
    }
    static func w(_ message: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
        #if DEBUG
            NSLog("==>[WARNING]\(file.url.lastPathComponent):L\(line):\(function)#\(message)")
        #endif
    }
    static func e(_ message: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
        #if DEBUG
            NSLog("==>[ERROR]\(file.url.lastPathComponent):L\(line):\(function)#\(message)")
        #endif
    }
}

