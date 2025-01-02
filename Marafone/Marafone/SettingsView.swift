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
    @State private var showSaveMessage = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 30)

                // Credentials Section
                VStack(alignment: .leading, spacing: 15) {
                    Text("Credentials")
                        .font(.headline)
                        .padding(.bottom, 5)

                    VStack(spacing: 10) {
                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.secondarySystemBackground)))
                .padding(.horizontal)

                // Save Button
                Button(action: {
                    keychainManager.save(username, forKey: "username")
                    keychainManager.save(password, forKey: "password")
                    showSaveMessage = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showSaveMessage = false
                    }
                }) {
                    Text("Save")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                if showSaveMessage {
                    Text("Credentials saved!")
                        .foregroundColor(.green)
                        .font(.subheadline)
                        .padding(.top, 5)
                }

                // Additional Features
                VStack(spacing: 15) {
                    Button(action: {
                        showTutorial = true
                    }) {
                        Text("Tutorial")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showTutorial) {
                        TutorialView()
                    }

                    Button(action: {
                        showQuiz = true
                    }) {
                        Text("Quiz")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showQuiz) {
                        QuizView()
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                username = keychainManager.username
                password = keychainManager.password
            }
            .padding(.bottom, 30)
        }
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}
