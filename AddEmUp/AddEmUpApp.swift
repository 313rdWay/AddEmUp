//
//  AddEmUpApp.swift
//  AddEmUp
//
//  Created by Davaughn Williams on 8/12/25.
//

import SwiftUI

@main
struct AddEmUpApp: App {
    
    @StateObject private var vm = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(vm)
        }
    }
}
