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
            
            displayView
            
            Spacer()
            
            keyboardView
            
            Spacer()
        }
    }
}

#Preview {
    CalculatorView()
        .environmentObject(CalculatorViewModel())
}

extension CalculatorView {
    private var displayView: some View {
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
    }
    
    private var keyboardView: some View {
        VStack(spacing: -25) {
            ForEach(vm.buttonLayout, id: \.self) { row in
                HStack(spacing: -25) {
                    ForEach(row, id: \.self) { item in
                        ButtonView(label: item,
                                   backgroundColor: self.vm.colorForButton(item),
                                   action: {vm.handleButtonPress(item)
                        })
                    }
                }
            }
        }
    }
}
