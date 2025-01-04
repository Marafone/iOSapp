//
//  TutorialView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 01/01/25.
//


import SwiftUI

struct TutorialView: View {
    @Environment(\.dismiss) var dismiss

    // Reusable component for styled images
    func styledImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }

    var body: some View {
        TabView {
            // Introduction Tab
            VStack {
                Text("Welcome to Marafone!")
                    .font(.title)
                    .padding()
                Text("""
                    Marafone is a strategic card game played with a standard deck of 40 Romagnol cards.
                    Players play in teams (2 vs 2), and the goal of the game is to be the first team to score 41 points. Each player receives 10 cards at the beginning of the game.
                    """)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("""
                    There are 4 suits of cards: Sticks, Coins, Swords and Cups
                    """)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack {
                    styledImage("BastoniAsso")
                    styledImage("DenaraAsso")
                    styledImage("SpadeAsso")
                    styledImage("CoppeAsso")
                }
                .padding()
            }
            .tabItem { Text("Introduction") }

            // Card Values Tab
            VStack {
                Text("Card Values")
                    .font(.title)
                Text("""
                    Each card has a point value: King, Horseman, Jack, Trey, and Deuce are worth 0.33 points each.
                    """)
                    .multilineTextAlignment(.center)
                    .padding()

                HStack {
                    styledImage("BastoniRe")
                    styledImage("BastoniCavallo")
                    styledImage("BastoniTre")
                    styledImage("BastoniDue")
                }
                .padding()

                Text("Whereas the Aces are worth one whole point.")
                    .multilineTextAlignment(.center)
                    .padding()

                HStack {
                    styledImage("BastoniAsso")
                    styledImage("DenaraAsso")
                    styledImage("SpadeAsso")
                    styledImage("CoppeAsso")
                }
                .padding()
            }
            .tabItem { Text("Card Values") }

            // Gameplay Basics Tab
            VStack {
                Text("Playing a Trick")
                    .font(.title)
                    .padding()
                Text("""
                    A trick is won by the highest card of the leading suit unless a trump is played.
                    All 4 players play their cards sequentially; the first one chooses the leading suit,
                    and the others must play cards of the same suit if they have any.
                    """)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Hierarchical order of the cards from strongest to weakest: 3 2 A K H J 7 6 5 4.")
                    .multilineTextAlignment(.center)
                    .padding()

                ScrollView(.horizontal) {
                    HStack {
                        styledImage("BastoniTre")
                        styledImage("BastoniDue")
                        styledImage("BastoniAsso")
                        styledImage("BastoniRe")
                        styledImage("BastoniCavallo")
                        styledImage("BastoniFante")
                        styledImage("BastoniSette")
                        styledImage("BastoniSei")
                        styledImage("BastoniCinque")
                        styledImage("BastoniQuattro")
                    }
                }
                .padding()
            }
            .tabItem { Text("Gameplay Basics") }
            
            // Trump Suit Tab
            VStack {
                Text("Trump Suit")
                    .font(.title)
                    .padding()
                Text("""
                    The player that is dealt the 4 of Coins is the first one to choose the Trump suit ("Briscola"), this suit beats all of the others for the rest of the hand. Then in the next hand the player to his right chooses the trump suit. It's important to have many cards of this suit since it gives a clear advantage.
                    """)
                    .multilineTextAlignment(.center)
                    .padding()

                styledImage("DenaraQuattro")
                .padding()
            }
            .tabItem { Text("Trump Suit") }

            // Scoring Tab
            VStack {
                Text("Scoring")
                    .font(.title)
                    .padding()
                Text("""
                    Points are calculated at the end of each round based on the captured cards in each trick.
                    The team that captures the last trick is granted one additional point.
                    """)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("""
                    If a player declares a trump suit of which they have the Ace, Deuce, and Trey, 
                    their team is granted three bonus points. This is called a Maraffa.
                    """)
                    .multilineTextAlignment(.center)
                    .padding()

                HStack {
                    styledImage("BastoniAsso")
                    styledImage("BastoniDue")
                    styledImage("BastoniTre")
                }
                .padding()

                Text("A sample Maraffa")
                    .font(.title3)
                    .padding(.top)
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
