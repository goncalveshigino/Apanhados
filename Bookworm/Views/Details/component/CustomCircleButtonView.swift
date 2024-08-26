//
//  CustomCircleButton.swift
//  Bookworm
//
//  Created by Goncalves Higino on 22/02/24.
//

import SwiftUI

struct CustomCircleButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    colors: [
                        .white,
                        .blue,
                        .black],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            Circle()
            .stroke(
              LinearGradient(
              colors: [
                .blue,
                .black
              ],
              startPoint: .top,
              endPoint: .bottom
              ),
              lineWidth: 4
            )
            
            Image(systemName: "plus")
                .fontWeight(.black)
                .font(.system(size: 20))
                .foregroundStyle(.white)
        }
        .frame(width: 30, height: 30)

    }
}

#Preview {
    CustomCircleButtonView()
}
