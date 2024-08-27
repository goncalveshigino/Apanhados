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
    @State private var rating = 1
    @State private var genre = "Finance"
    @State private var noteTitle = ""
    @State private var noteSubtitle = ""
    
    @Binding var shouldShowSuccess: Bool
   
    
    
    let genres = ["Fantasy","Finance", "Horror", "Kids", "Mystery", "Poetry", "Romance", "personal development"]
    
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
                    HStack {
                        Spacer()
                        
                        Button("Salvar") {
                            let newBook = Book(title: title, author: author, genre: genre, rating: rating)
                            
                            modelContext.insert(newBook)
                            self.shouldShowSuccess.toggle()
                            dismiss()
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("Adiciona o livro")
        }
    }
}

#Preview {
    AddBookView(shouldShowSuccess: .constant(false))
}
