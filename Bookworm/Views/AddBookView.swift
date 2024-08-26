//
//  AddBookView.swift
//  Bookworm
//
//  Created by Goncalves Higino on 21/02/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var noteTitle = ""
    @State private var noteSubtitle = ""
  
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nome do livro", text: $title)
                    TextField("Nome do autor", text: $author)
                    
                    Picker("Genero", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    RatingView(rating: $rating)
                }
                
                
                Section {
                    Button("Salvar") {
                        let newBook = Book(title: title, author: author, genre: genre, rating: rating)
                        
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Adiciona o livro")
        }
    }
}

#Preview {
    AddBookView()
}
