//
//  ContentView.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 06/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("This is accentColor")
                    .foregroundColor(Color.theme.accent)
                Text("This is secondaryColor")
                    .foregroundColor(Color.theme.secondaryText)
                Text("This is greenColor")
                    .foregroundColor(Color.theme.green)
                Text("This is redColor")
                    .foregroundColor(Color.theme.red)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
