//
//  APIBase.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

protocol APIBaseDelegate {
    var api: API { get }
    var method: String { get }
    var queryItems: [URLQueryItem] { get }
    func onResponseSuccess(data: Data)
    func onResponseFaild(message: String)
}
