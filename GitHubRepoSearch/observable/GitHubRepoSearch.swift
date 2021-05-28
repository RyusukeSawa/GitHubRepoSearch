//
//  GitHubRepoSearch.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

class GitHubSearchModel: ObservableObject, APIGitHubSearchRepositoriesDelegate {
    //検索結果
    @Published var items: [APIItem] = []
    //更新時間
    let TIME_INTERVAL: TimeInterval = 2.5
    //検索クエリ
    var query: String {
        return searchText
    }
    //検索ワード
    var searchText: String = ""
    //前回情報を保持するTEMPワード
    var tmpText: String = "tmp"
    //Timer
    var timer: Timer!

    init() {
        startTimer()
    }

    /// タイマー開始
    private func startTimer() {
        CLog.d()
        Timer.scheduledTimer(timeInterval: self.TIME_INTERVAL, target: self, selector: #selector(search), userInfo: nil, repeats: true)
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

    ///API成功時
    func onResponseSuccess(model: APISearchRepositories) {
        CLog.d(model)
        var resultList: [APIItem] = []
        for item in model.items {
            resultList.append(APIItem(name: item.name, dump: item))
        }
        DispatchQueue.main.async {
            self.items = resultList
        }
    }

    ///API失敗時
    /// - TODO: Dialogとか表示
    func onResponseFaild(message: String) {
        CLog.d(message)
    }
}

