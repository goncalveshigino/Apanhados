//
//  CheckmarkPopoverView.swift
//  Bookworm
//
//  Created by Goncalves Higino on 27/08/24.
//

import Foundation
import SwiftUI

enum Symbols {
    static let checkmark = Image(systemName: "checkmark")
}


struct CheckmarkPopoverView: View {
    var body: some View {
        Symbols.checkmark
            .font(.system(.largeTitle,
                          design: .rounded).bold())
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10,
                                                            style: .continuous))
    }
}

#Preview {
    CheckmarkPopoverView()
}

