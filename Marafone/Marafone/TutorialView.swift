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
                HStack {
                    Image("BastoniAsso")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity) // Allow flexibility in width
                    Image("DenaraAsso")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    Image("SpadeAsso")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    Image("CoppeAsso")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity) // Ensures the HStack fits the screen width
                .padding()
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
                Text("Points are calculated at the end of each round based on the captured cards in each trick")
                    .padding()
                Text("The team that captures the lasti trick is granted one additional point")
                    .padding()
                Text("If a player declares a trump suit of which he has the Ace, Deuce and Trey his team is then granted three bonus points, this is called a maraffa")
                    .padding()
                
                HStack {
                    Image("BastoniAsso")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity) // Allow flexibility in width
                    Image("BastoniDue")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    Image("BastoniTre")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity) // Ensures the HStack fits the screen width
                .padding()
                Text("A sample maraffa")
                    .font(.title3)
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
