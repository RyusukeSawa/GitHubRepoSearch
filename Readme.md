GItHubリポジトリ検索アプリ

■環境
・SwiftUI / Swift
・ローテートなし、iPhone14.5のみ動作確認済み
・画面遷移後に再度入力して更新されているところまで確認
・サンプルなので最大文字数などのテストは行っていない

■仕様
・[GET / search/repositories]APIでGithubのリポジトリを検索する
・外部ライブラリの使用はなし
・文字列はインクリメンタルサーチだが、5秒に一回更新した文字列でAPIリクエストで一覧の更新を行う
・空文字または前回と同じ文字列の場合はAPIリクエストを行わない
・最大30件まで表示

例：APIGitHubSearchRepositories.swiftで投げ方を設定
URLQueryItem(name: "q", value: delegate.query),
URLQueryItem(name: "sort", value: "stars"),
URLQueryItem(name: "order", value: "desc"),
URLQueryItem(name: "per_page", value: "30"),
URLQueryItem(name: "page", value: "1"),

