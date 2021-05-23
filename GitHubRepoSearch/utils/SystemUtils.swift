//
//  SystemUitls.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

class SystemUtils {

    static var appName: String {
        if let value = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName"), let appName = value as? String {
            return appName
        } else {
            return ""
        }
    }
}
