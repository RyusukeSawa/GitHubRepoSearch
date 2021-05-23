//
//  APIGitHubSearchRepositories.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

protocol APIGitHubSearchRepositoriesDelegate {
    func onResponseSuccess(model: APISearchRepositories)
    func onResponseFaild(message: String)
    var query: String { get }
}

/// GitHubリポジトリ検索
/// https://docs.github.com/en/rest/reference/search
struct APIGitHubSearchRepositories: APIBaseDelegate {

    var api: API {
        return .SEARCH_REPOSITORIES
    }

    var method: String {
        return "GET"
    }

    var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: "q", value: delegate.query),
            URLQueryItem(name: "sort", value: "stars"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "per_page", value: "30"),
            URLQueryItem(name: "page", value: "1"),
        ]
    }

    let delegate: APIGitHubSearchRepositoriesDelegate!

    init(delegate: APIGitHubSearchRepositoriesDelegate) {
        self.delegate = delegate
    }

    func onResponseSuccess(data: Data) {
        do {
            let model: APISearchRepositories = try JSONDecoder().decode(APISearchRepositories.self, from: data)
            CLog.d(model)
            delegate.onResponseSuccess(model: model)
        } catch(let error) {
            CLog.e(error)
            delegate.onResponseFaild(message: "error:\(error)")
        }
    }

    /// 失敗ケース
    /// Not modified > Status: 304 Not Modified
    /// Validation failed > Status: 422 Unprocessable Entity
    /// Service unavailable > Status: 503 Service Unavailable
    func onResponseFaild(message: String) {
        CLog.d(message)
        delegate.onResponseFaild(message: "error:\(message)")
    }

    static func request(delegate: APIGitHubSearchRepositoriesDelegate) {
        APIClient.request(base: APIGitHubSearchRepositories(delegate: delegate))
    }

}
