//
//  NoteView+.swift
//  Bookworm
//
//  Created by Goncalves Higino on 25/08/24.
//

import Foundation
import SwiftUI


extension NoteView {
    func addNote() {
        guard title.isEmpty else { return }
        
        withAnimation {
            let newNote = Note(title: title, subtitle: subtitle)
            book.notes.append(newNote)
            self.title = ""
            self.subtitle = ""
        }
    }
}
