//
//  GroupBoxModifier.swift
//  Bookworm
//
//  Created by Goncalves Higino on 25/08/24.
//

import Foundation
import SwiftUI

struct CardGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
