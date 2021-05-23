//
//  GitHubRepoSearchApp.swift
//  GitHubRepoSearch
//
//  Created by 澤隆介 on 2021/05/23.
//

import SwiftUI

@main
struct GitHubRepoSearchApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
