//
//  ContentView+.swift
//  Bookworm
//
//  Created by Goncalves Higino on 25/08/24.
//

import Foundation
import SwiftUI

extension ContentView {
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}
