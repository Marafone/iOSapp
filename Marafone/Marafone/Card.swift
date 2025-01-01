//
//  Card.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 01/01/25.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let rank: String
    let suit: String
    let points: Double
}

let cardDeck: [Card] = [
    Card(rank: "3", suit: "Coins", points: 0.33),
    Card(rank: "2", suit: "Coins", points: 0.33),
    // Add all cards with suits: Coins, Cups, Swords, Clubs
]

struct CardView: View {
    let card: Card
    
    var body: some View {
        VStack {
            Text("\(card.rank) of \(card.suit)")
                .font(.headline)
            Text("\(card.points, specifier: "%.1f") Points")
                .font(.subheadline)
        }
        .padding()
        .background(Color.yellow.opacity(0.3))
        .cornerRadius(10)
    }
}
