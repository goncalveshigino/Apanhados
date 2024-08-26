//
//  Book.swift
//  Bookworm
//
//  Created by Goncalves Higino on 21/02/24.
//

import Foundation
import SwiftData

@Model
class Book {
    
    var title: String
    var author: String
    var genre: String
    var rating: Int
    @Relationship(deleteRule: .cascade) var notes = [Note]()
   
    
    init(title: String = "", author: String = "", genre: String = "", rating: Int = 2) {
        self.title = title
        self.author = author
        self.genre = genre
        self.rating = rating
    }
    
}
