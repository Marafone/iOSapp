//
//  SettingsView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 30/12/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showTutorial = false
    @State private var showQuiz = false

    var body: some View {
    
        VStack{
            Form {
                Section(header: Text("Credentials")) {
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $password)
                }
                
                Button("Save") {
                    KeychainHelper.save(username, forKey: "username")
                    KeychainHelper.save(password, forKey: "password")
                }
            }
            .onAppear {
                username = KeychainHelper.load(forKey: "username") ?? ""
                password = KeychainHelper.load(forKey: "password") ?? ""
            }
            .navigationTitle("Settings")
            
            Form{
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
