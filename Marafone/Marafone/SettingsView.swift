//
//  SettingsView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 30/12/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var keychainManager: KeychainManager
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showTutorial = false
    @State private var showQuiz = false
    @State private var autoLogin = false
    @State private var showSaveMessage = false

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Credentials")) {
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $password)
                    
                    Toggle("Auto Login", isOn: $autoLogin)
                }
                
                Button("Save") {
                    keychainManager.save(username, forKey: "username")
                    keychainManager.save(password, forKey: "password")
                    showSaveMessage = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showSaveMessage = false
                    }
                }
            }
            .onAppear {
                username = keychainManager.username
                password = keychainManager.password
            }
            .navigationTitle("Settings")
            
            if showSaveMessage {
                Text("Credentials saved!")
                    .foregroundColor(.green)
                    .font(.subheadline)
                    .padding()
            }

            Form {
                Button("Tutorial") {
                    showTutorial = true
                }
                .sheet(isPresented: $showTutorial) {
                    TutorialView()
                }
                
                Button("Quiz") {
                    showQuiz = true
                }
                .sheet(isPresented: $showQuiz) {
                    QuizView()
                }
            }
        }
    }
}
