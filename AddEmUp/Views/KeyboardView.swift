//
//  KeyboardView.swift
//  AddEmUp
//
//  Created by Davaughn Williams on 8/13/25.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject private var vm: CalculatorViewModel
    
    var body: some View {
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

#Preview {
    KeyboardView()
        .environmentObject(CalculatorViewModel())
}
