//
//  noteCustomStyle.swift
//  Bookworm
//
//  Created by Goncalves Higino on 25/08/24.
//
import SwiftUI

struct NoteCustomStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func noteCustomStyle() -> some View {
        self.modifier(NoteCustomStyle())
    }
}
