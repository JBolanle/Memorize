//
//  ContentView.swift
//  Memorize
//
//  Created by Jumoke Bolanle on 11/28/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame

    @State var emojis: [String] = ["👻", "🎃", "🕷️", "👹", "💀", "🧙‍♀️", "🍭", "🙀", "☠️", "🕸️"]
    @State var cardColor = Color(.orange)

    //MARK: - MAIN INTERFACE
    var body: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .fontWeight(.semibold)
        ScrollView {
            cards
        }
        .padding()
        Spacer()
        changeThemeButton
            .padding()
    }

    //MARK: - VIEW COMPONENTS

    var cards: some View {
        // Displays CardView and sets that content to what emoji is at the emoji array index
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(cardColor)
    }

    var changeThemeButton: some View {
        // Set contents of emojis array and card color based on button pressed.
        Menu("Change Theme") {
            Button("Halloween", systemImage: "cat.fill") {
                emojis = ["👻", "👻", "🎃", "🎃", "🕷️", "🕷️", "👹", "👹", "💀", "🧙‍♀️", "🧙‍♀️", "🍭", "🙀", "☠️", "🕸️"].shuffled()
                cardColor = Color.orange
            }
            Button("Sports", systemImage: "figure.american.football") {
                emojis = ["⚽", "⚽", "🏀", "🏀", "🏈", "🏈", "⚾", "⚾", "🎾", "🎾", "🤽‍♀️", "🤽‍♀️", "🥌", "⛸️", "🛷", "🛼", "🛹"].shuffled()
                cardColor = Color.blue
            }
            Button("Professions", systemImage: "person.fill") {
                emojis = ["💼", "💼", "⛑️", "⛑️", "👨‍🏫", "👨‍🏫", "👮‍♀️", "👮‍♀️", "👩‍🌾", "👩‍🌾", "👨‍🎨", "👨‍🔬", "🧑‍⚕️", "👨‍💼", "💂‍♀️", "🧑‍🚀"].shuffled()
                cardColor = Color.green
            }
        }
    }
}

//MARK: - VIEWS
struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)

            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



//#Preview {
//    Memorize()
//}
