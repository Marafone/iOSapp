//
//  ContentView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 27/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var keychainManager = KeychainManager()

    var body: some View {
        TabView {
            SimpleWebView(keychainManager: keychainManager,
                          url: URL(string: "http://localhost:5174/login")!)
                .tabItem {
                    Label("WebView", systemImage: "globe")
                }

            NavigationView {
                SettingsView()
                    .environmentObject(keychainManager)
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}
