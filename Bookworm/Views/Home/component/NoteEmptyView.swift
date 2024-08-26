//
//  NoteEmptyView.swift
//  Bookworm
//
//  Created by Goncalves Higino on 25/08/24.
//

import SwiftUI

struct NoteEmptyView: View {
    var body: some View {
        
        if #available(iOS 17.0, *) {
            ContentUnavailableView(
                "Adicione um apanhado",
                systemImage: "list.bullet.clipboard",
                description: Text("Para adicionar um apanhado toque em +")
            )
        } else {
            VStack {
                Image(systemName: "cart.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
                
                Text("Inicie uma facturação")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 4)
                    .padding(.top, 2)
                Text("Para iniciar uma facturação toque em +")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    NoteEmptyView()
}
