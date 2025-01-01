//
//  TutorialView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 01/01/25.
//


import SwiftUI

struct TutorialView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        TabView {
            VStack {
                Text("Welcome to Marafone!")
                    .font(.title)
                    .padding()
                Text("Marafone is a strategic card game played with a standard deck of Romagnol cards, players play in teams 2 vs 2 and the goal of the game is to be the first team to score 41 points")
                    .padding()
            }
            .tabItem { Text("Introduction") }
            
            VStack {
                Text("Card Values")
                    .font(.title)
                Text("Each card has a point value: King, Horseman, Jack, Trey, Deuce are worth 0.33 points each")
                    .padding()
                HStack {
                    Image("BastoniRe")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity) // Allow flexibility in width
                    Image("BastoniCavallo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    Image("BastoniTre")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    Image("BastoniDue")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity) // Ensures the HStack fits the screen width
                .padding()
                
                Text("Whereas the Aces are worth one whole point")
                    .padding()
                GeometryReader { geometry in
                    Image("BastoniAsso")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: geometry.size.height * 0.5) // 50% of the screen height
                        
                }
                // Add images of cards for illustration
            }
            .tabItem { Text("Card Values") }
            
            VStack {
                Text("Playing a Trick")
                    .font(.title)
                    .padding()
                Text("A trick is won by the highest card of the leading suit unless a trump is played...")
                    .padding()
                // Add visual examples here
            }
            .tabItem { Text("Gameplay Basics") }
            
            VStack {
                Text("Scoring")
                    .font(.title)
                    .padding()
                Text("Points are calculated based on the captured cards...")
                    .padding()
            }
            .tabItem { Text("Scoring") }
        }
        .tabViewStyle(PageTabViewStyle())
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") { dismiss() }
            }
        }
    }
}
