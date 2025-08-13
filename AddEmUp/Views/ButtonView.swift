//
//  ButtonView.swift
//  AddEmUp
//
//  Created by Davaughn Williams on 8/12/25.
//

import SwiftUI

struct ButtonView: View {
    
    let label: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle()
                .foregroundStyle(backgroundColor)
                .frame(width: 90, height: 90)
                .overlay {
                    Text(label)
                        .font(.system(size: 60))
                        .fontWeight(.black)
                        .foregroundStyle(.white)
                }
                .padding()
        }
    }
}

#Preview {
    ButtonView(label: "X", backgroundColor: .secondary, action: {})
}
