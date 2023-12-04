//
//  ContentView.swift
//  Memorize
//
//  Created by Jumoke Bolanle on 11/28/23.
//

import SwiftUI

struct Memorize: View {
    @State var emojis: [String] = ["👻", "🎃", "🕷️", "👹", "💀", "🧙‍♀️", "🍭", "🙀", "☠️", "🕸️"]

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
        .foregroundColor(Color.orange)
    }

    var changeThemeButton: some View {
        // Creates a text button
        Menu("Change Theme") {
            // Set contents of emojis array based on button pressed.
            Button("Halloween", systemImage: "cat.fill") {
                emojis = ["👻", "👻", "🎃", "🎃", "🕷️", "🕷️", "👹", "👹", "💀", "🧙‍♀️", "🧙‍♀️", "🍭", "🙀", "☠️", "🕸️"].shuffled()
            }
            Button("Sports", systemImage: "figure.american.football") {
                emojis = ["⚽", "⚽", "🏀", "🏀", "🏈", "🏈", "⚾", "⚾", "🎾", "🎾", "🤽‍♀️", "🤽‍♀️", "🥌", "⛸️", "🛷", "🛼", "🛹"].shuffled()
            }
            Button("Professions", systemImage: "person.fill") {
                emojis = ["💼", "💼", "⛑️", "⛑️", "👨‍🏫", "👨‍🏫", "👮‍♀️", "👮‍♀️", "👩‍🌾", "👩‍🌾", "👨‍🎨", "👨‍🔬", "🧑‍⚕️", "👨‍💼", "💂‍♀️", "🧑‍🚀"].shuffled()
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



#Preview {
    Memorize()
}
