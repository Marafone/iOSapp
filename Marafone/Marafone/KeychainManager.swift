//
//  KeychainManager.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 02/01/25.
//


import Foundation
import Combine

class KeychainManager: ObservableObject {
    @Published var username: String = KeychainHelper.load(forKey: "username") ?? ""
    @Published var password: String = KeychainHelper.load(forKey: "password") ?? ""

    func save(_ value: String, forKey key: String) {
        KeychainHelper.save(value, forKey: key)
        if key == "username" {
            username = value
        } else if key == "password" {
            password = value
        }
    }
}
