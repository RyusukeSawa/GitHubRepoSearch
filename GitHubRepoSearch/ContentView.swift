//
//  ContentView.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State private var searchText: String = ""
    @ObservedObject var model = GitHubSearchModel()

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    //ヘッダ
                    HStack {
                        //NOP
                    }.padding()
                    //検索バー
                    SearchBarView(text: $model.searchText)
                        .padding(.top, -30)
                    //リスト
                    List(model.items.filter(
                        { searchText.isEmpty ? true: $0.name.contains(searchText) }
                        )) { item in
                        NavigationLink(destination: ScrollView(.vertical) { Text(item.dumpStr) }) {
                            Text(item.name)
                        }
                    }
                    //タイトル表示
                    .navigationTitle(SystemUtils.appName)
                        .navigationBarTitleDisplayMode(.inline)
                        .onDisappear {
                        model.cancelTimer()
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
