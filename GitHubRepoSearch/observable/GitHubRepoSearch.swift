//
//  GitHubRepoSearch.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

class GitHubSearchModel: ObservableObject, APIGitHubSearchRepositoriesDelegate {

    @Published var items: [APIItem] = [] //検索結果

    var query: String {
        return searchText
    }

    var searchText: String = ""
    var tmpText: String = "tmp"
    var timer: Timer!

    init() {
        startTimer()
    }

    /// タイマー開始
    private func startTimer() {
        CLog.d()
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(search), userInfo: nil, repeats: true)
    }

    /// タイマー停止
    func cancelTimer() {
        CLog.d()
        //タイマー停止
        if timer != nil {
            timer.invalidate()
        }
    }

    /// 検索を行う
    @objc func search() {
        CLog.d("tmpText:\(tmpText) != searchText:\(searchText)")
        if searchText != "" && tmpText != searchText {
            APIGitHubSearchRepositories.request(delegate: self)
            tmpText = searchText
        }
    }

    func onResponseSuccess(model: APISearchRepositories) {
        CLog.d(model)
        var resultList: [APIItem] = []
        for item in model.items {
            resultList.append(APIItem(name: item.name, dump: item))
        }
        items = resultList
    }

    func onResponseFaild(message: String) {
        CLog.d(message)
    }
}

