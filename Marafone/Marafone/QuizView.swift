//
//  QuizView.swift
//  Marafone
//
//  Created by Tomasz Jarzabek on 01/01/25.
//

import SwiftUI

struct QuizView: View {
    @State private var questionIndex = 0
    @State private var score = 0
    @State private var showScore = false
    
    let questions: [String] = [
        "What card is worth 1 point?",
        "Can you play a trump card if you have the leading suit and the trump suit is not the leading one?",
        "What happens if you declare a 'maraffa'?",
        "How many points are required to win the game?",
        "Who starts the first hand in the game?",
        "What is the trump suit called in Marafone?",
        "What happens if no trump card is played in a trick?",
        "Which cards are worth ⅓ of a point?",
        "What is the value of cards 7, 6, 5, and 4?",
        "How many cards are dealt to each player?"
    ]

    let answers: [[String]] = [
        ["Ace", "King", "Trey"],
        ["Yes", "No"],
        ["3 Bonus Points", "5 Bonus Points"],
        ["41", "51", "31"],
        ["The dealer", "Player with 4 of Coins", "The last trick winner"],
        ["Briscola", "Maraffa", "Tressette"],
        ["The strongest card of the leading suit wins", "The trick is discarded"],
        ["Deuces, Treys, and Court Cards", "Kings, Sevens, and Fives"],
        ["0 points", "⅓ of a point"],
        ["10 cards", "5 cards", "15 cards"]
    ]

    let correctAnswers: [Int] = [0, 1, 0, 0, 1, 0, 0, 0, 0, 0]
    
    
    var body: some View {
        VStack {
            if showScore {
                // Show the final score
                Text("Quiz Completed!")
                    .font(.largeTitle)
                    .padding()
                
                Text("Your score: \(score) / \(questions.count)")
                    .font(.title2)
                    .padding()
                
                Button("Restart Quiz") {
                    restartQuiz()
                }
                .padding()
                .background(Color.green.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                // Show the current question and answers
                Text("Question \(questionIndex + 1) of \(questions.count)")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Text(questions[questionIndex])
                    .font(.title2)
                    .padding()
                
                ForEach(0..<answers[questionIndex].count, id: \.self) { index in
                    Button(answers[questionIndex][index]) {
                        if index == correctAnswers[questionIndex] {
                            score += 1
                        }
                        nextQuestion()
                    }
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .animation(.easeInOut, value: showScore)
    }
    
    private func nextQuestion() {
        if questionIndex < questions.count - 1 {
            questionIndex += 1
        } else {
            showScore = true
        }
    }
    
    private func restartQuiz() {
        questionIndex = 0
        score = 0
        showScore = false
    }
}
