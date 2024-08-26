//
//  NoteView.swift
//  Bookworm
//
//  Created by Goncalves Higino on 22/02/24.
//

import SwiftUI
import SwiftData

struct NoteView: View {
    
    @Bindable var book: Book
    @Environment(\.dismiss) var dismiss
    
    @State var title = ""
    @State var subtitle = ""
   
    
    var body: some View {
        VStack(alignment: .leading) {
            Section {
                Text("Título")
                    .font(.system(size: 20, weight: .bold))
                
                TextField("Adicione um título", text: $title, axis: .vertical)
                    .frame(height: 55)
                    .noteCustomStyle()
                
                
                Text("Apanhado")
                    .font(.system(size: 20, weight: .bold))
                
                TextField("Adicione um seu apanhado", text: $subtitle, axis: .vertical)
                    .noteCustomStyle()
                   
            }
            
            Button("Save", systemImage: "plus") {
                let newNote = Note(title: title, subtitle: subtitle)
                book.notes.append(newNote)
                
                self.title = ""
                self.subtitle = ""
                
              dismiss()
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.blue.opacity(0.5))
            .clipShape(.rect(cornerRadius: 10))
            
            
            Spacer()
        }
        .padding()
    }
    
}



#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        
        let book = Book(title: "Mente caracter e personalidade vol.1", author: "Ellen G. White", genre: "Profecia", rating: 4)
        return NoteView(book: book)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
    
}
