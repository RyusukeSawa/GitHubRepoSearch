//
//  APIClient.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import Foundation

struct APIClient {

    static func request(base: APIBaseDelegate) {
        CLog.d()
        //URLコンポーネントを生成
        var urlComponents = URLComponents(string: base.api.urlStr)!
        //パラメーター設定
        urlComponents.queryItems = base.queryItems
        //URLリクエストを作成
        var request = URLRequest(url: urlComponents.url!)
        //メソッド設定
        request.httpMethod = base.method

        CLog.d(request)
        //通信
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let jsonData = data else {
                CLog.e("ValidCheckError:\(String(describing: response))")
                //失敗時
                base.onResponseFaild(message: "ValidCheckError:\(String(describing: response))")
                return
            }
            //成功時
            base.onResponseSuccess(data: jsonData)
        }
        task.resume()
    }

}
