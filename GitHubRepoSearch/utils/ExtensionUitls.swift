//
//  ExtensionUitls.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

extension String {
    /* URL変換 */
    public var url: URL {
        return URL(string: self)!
    }

}
