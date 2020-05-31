//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Georgi Teoharov on 29.05.20.
//  Copyright © 2020 CS193p Freelancer. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
        if card.isFaceUp {
            RoundedRectangle(cornerRadius: cornerRaidus)
                    .fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRaidus)
                .stroke(lineWidth: edgeLineWidth)
            Text(card.content)
            } else {
            RoundedRectangle(cornerRadius: cornerRaidus)
                .fill()
            }
        }
        .font(Font.system(size: fontSize(for: size)))
        .aspectRatio(2/3, contentMode: .fit)
    }
    
    // MARK: - Drawing Constant
    let cornerRaidus: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.75
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
