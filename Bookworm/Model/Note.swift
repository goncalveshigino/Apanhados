//
//  Note.swift
//  Bookworm
//
//  Created by Goncalves Higino on 22/03/24.
//

import Foundation
import SwiftData

@Model
class Note {
    let title: String
    let subtitle: String
  
    
    init(title: String, subtitle: String){
        self.title = title
        self.subtitle = subtitle
    }
}

