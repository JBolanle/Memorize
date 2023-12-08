//
//  EmojiMemoryGameView.swift
//
//  Created by Jumoke Bolanle on 11/28/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    @State var cardColor = Color(.orange)

    //MARK: - MAIN INTERFACE
    var body: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .fontWeight(.semibold)
        ScrollView {
            cards
                .animation(.default, value: viewModel.cards)
        }
        HStack {
            Button("New Game") {
                viewModel.newGame()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .tint(.green)
            .padding()
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .tint(.purple)
            .padding()
        }
        Spacer()
//        changeThemeButton
//            .padding()
    }

    //MARK: - VIEW COMPONENTS

    var cards: some View {
        // Displays CardView and sets that content to what emoji is at the emoji array index
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(cardColor)
    }


}

//MARK: - VIEWS
struct CardView: View {
    let card: MemoryGame<String>.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)

            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
