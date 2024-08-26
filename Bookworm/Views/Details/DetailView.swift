//
//  DetailView.swift
//  Bookworm
//
//  Created by Goncalves Higino on 21/02/24.
//
import SwiftData
import SwiftUI

struct DetailView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    @State private var showingNote = false
    
    @State private var title = ""
    @State private var subtitle = ""
        
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                    
                
                
                Text(book.author.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(y: -140)
                    .padding(.trailing)
                
                HStack {
                    Text(book.genre)
                        .font(.system(size: 20))
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.black.opacity(0.75))
                        .clipShape(.capsule)
                        .padding(.bottom)
                        .padding(.leading)
                   
                    
                    Spacer()
                    
                    RatingView(rating: .constant(book.rating))
                        .font(.system(size: 18))
                        .offset(y: -5)
                        .padding(.trailing)
                }
                
                
            }
            
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 20) {
                    
                    Spacer()
                    
                    Text("nota")
                        .foregroundStyle(.secondary)
                    
                    Button {
                        showingNote.toggle()
                    } label: {
                        CustomCircleButtonView()
                    }
                    .sheet(isPresented: $showingNote){
                        NoteView(book: book)
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.medium])
                    }
                }
                .font(.title2)
                
                ForEach(book.notes, id: \.self){ note in
                    GroupBox {
                        DisclosureGroup(note.title){
                            VStack(alignment: .leading) {
                                Text(note.subtitle)
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .foregroundStyle(.black)
                    }.groupBoxStyle(CardGroupBoxStyle())
                }
                
                Spacer()
            }
            .padding()
            
        }
        .navigationTitle(book.title)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", rating: 4)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
