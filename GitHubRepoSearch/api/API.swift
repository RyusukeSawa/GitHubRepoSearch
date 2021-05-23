//
//  GitHubAPI.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

enum API {
    case SEARCH_REPOSITORIES
    case NONE
    var urlStr: String {
        var resultUrl: String = ""
        switch self {
        case .SEARCH_REPOSITORIES:
            resultUrl = "search/repositories"
            break
        default:
            //Nothing
            resultUrl = ""
            break
        }
        //TODO:環境変数から取得予定
        let baseUrl = "https://api.github.com/"
        return baseUrl + resultUrl
    }
}

