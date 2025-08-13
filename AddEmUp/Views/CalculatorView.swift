//
//  CalculatorView.swift
//  AddEmUp
//
//  Created by Davaughn Williams on 8/12/25.
//

import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject var vm: CalculatorViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            
            Spacer()
            
            ZStack(alignment: .center) {
                Text(vm.displayText)
                    .font(.system(size: 75))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(style: StrokeStyle(lineWidth: 10))
                    
            }
            .frame(height: 200)
            .padding(.horizontal)
            
            
            Spacer()
            
            KeyboardView()
            
            Spacer()
        }
    }
}

#Preview {
    CalculatorView()
        .environmentObject(CalculatorViewModel())
}
