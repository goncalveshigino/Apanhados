//
//  ContentView.swift
//  Bookworm
//
//  Created by Goncalves Higino on 20/02/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort:[SortDescriptor(\Book.title),SortDescriptor(\Book.author)]) var books: [Book]
    
    @State var showingAddScreen = false
    @State private var shouldShowSuccess = false
    @State private var isLoading = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if books.isEmpty {
                    NoteEmptyView()
                } else {
                    List {
                        ForEach(books) { book in
                            NavigationLink(value: book) {
                                HStack {
                                    EmojiRatingView(rating: book.rating)
                                        .font(.largeTitle)
                                    
                                    VStack(alignment: .leading) {
                                        Text(book.title)
                                            .foregroundStyle(book.rating == 1 ? .red : .black)
                                            .font(.headline)
                                        
                                        Text(book.author)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteBooks)
                    }
                }
            }
            .navigationTitle("Apanhados")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add book", systemImage: "plus") {
                        showingAddScreen.toggle()
                        isLoading = false
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView(shouldShowSuccess: $shouldShowSuccess)
                    .presentationDetents([.height(400)])
            }
            .overlay {
                if shouldShowSuccess {
                    CheckmarkPopoverView()
                        .transition(.scale.combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation(.spring().delay(2)) {
                                    self.shouldShowSuccess.toggle()
                                }
                            }
                        }
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
