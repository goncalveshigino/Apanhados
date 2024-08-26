//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Goncalves Higino on 20/02/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
