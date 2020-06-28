//
//  Cardify.swift
//  Memorize
//
//  Created by Georgi Teoharov on 28.06.20.
//  Copyright © 2020 CS193p Freelancer. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRaidus).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRaidus).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRaidus).fill()
            }
        }
    }
    
    let cornerRaidus: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
