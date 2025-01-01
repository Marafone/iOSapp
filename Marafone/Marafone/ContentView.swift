//
//  ContentView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 27/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var reloadWebView = false
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        TabView {
            SimpleWebView(url: URL(string: "http://localhost:5174/login")!,
                          username: KeychainHelper.load(forKey: "username") ?? "",
                          password: KeychainHelper.load(forKey: "password") ?? ""
            )
            .tabItem {
                Label("WebView", systemImage: "globe")
            }
            .onAppear {
                username = KeychainHelper.load(forKey: "username") ?? ""
                password = KeychainHelper.load(forKey: "password") ?? ""
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
