//
//  DetailView+.swift
//  Bookworm
//
//  Created by Goncalves Higino on 25/08/24.
//

import Foundation
import SwiftUI


extension DetailView {
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
    
    func deleteNotes(at offsets: IndexSet) {
        for offset in offsets {
            let book = book.notes[offset]
            modelContext.delete(book)
        }
    }

}
