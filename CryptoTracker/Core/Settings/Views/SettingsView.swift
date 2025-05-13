//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 13/05/25.
//

import SwiftUI

struct SettingsView: View {
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coingeckoURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let personalURL = URL(string: "https://www.noorfan.my.id")!
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                swiftfulThinkingSection
                coinGeckoSection
                developerSection
                applicationSection
            }
            .listStyle(.grouped)
            .font(.headline)
            .tint(.blue)

        }
        .navigationTitle("Settings")
        .toolbar {
            XMarkButton {
                dismiss()
            }
        }
    }
}

#Preview {
    SettingsView()
}


extension SettingsView {
    private var swiftfulThinkingSection: some View {
        Section {
            Image("logo")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text("This app was made by following the SwiftUI Tutorials on YouTube by Nick Sarno, It uses MVVM Architecture, Combine and CoreData!")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(Color.theme.accent)
            Link(destination: youtubeURL) {
                Text("Subscribe on youtube")
            }
            Link(destination: coffeeURL) {
                Text("Buy him a coffee")
            }
        } header: {
            Text("Swiftful Thinking")
        }
        .padding(.vertical)
    }
    
    private var coinGeckoSection: some View {
        Section {
            Image("coingecko")
                .resizable()
                .scaledToFit()
                .frame( height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text("This app uses API data from coingecko, the prices might be delayed.")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(Color.theme.accent)
            Link(destination: coingeckoURL) {
                Text("Visit coin gecko 🦎")
            }
        } header: {
            Text("CoinGecko")
        }
        .padding(.vertical)
    }
    
    private var developerSection: some View {
        Section {
            Image("logo")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text("Hello it's me noorfan 👋🏼, I just finished the crypto app courses from swiftful thinking playlist. I learnt a lot from this course, especially on MVVM, Combine and CoreData.")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(Color.theme.accent)
            Link(destination: personalURL) {
                Text("Visit my site")
            }
        } header: {
            Text("Developer Info")
        }
        .padding(.vertical)
    }
    
    private var applicationSection: some View {
        Section {
            Link(destination: defaultURL) {
                Text("Terms of service")
            }
            Link(destination: defaultURL) {
                Text("Privacy policy")
            }
            Link(destination: defaultURL) {
                Text("Company Website")
            }
            Link(destination: defaultURL) {
                Text("Learn more..")
            }
        } header: {
            Text("Terms of Service")
        }
        .padding(.vertical)
    }
}
