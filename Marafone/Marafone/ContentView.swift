//
//  ContentView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 27/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var reloadWebView = false

    var body: some View {
        TabView {
            SimpleWebView(url: URL(string: "http://localhost:5174/login")!)
                .tabItem {
                    Label("WebView", systemImage: "globe")
                }
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}
