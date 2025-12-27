//
//  ContentView.swift
//  MemorzieGame
//
//  Created by Артём on 27.12.2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "😈", "👹", "🧙🏻‍♀️", "🧛🏻‍♂️","💀"]
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            
            cardCountAdjusters
        }
        .padding()
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { emoji in
                CardView(content: emojis[emoji])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundStyle(Color.orange)
        }
    }
    
    private var cardCountAdjusters: some View {
        HStack {
            cardAdder
            
            Spacer()
        
            cardRemover
        }
        .font(.largeTitle)
        .imageScale(.large)
    }
    
    func cardCounterAdjuster(by offset: Int, symbol: String) -> some View {
        Button() {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset > emojis.count || cardCount + offset < 1)
    }
    
    private var cardRemover: some View {
        cardCounterAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    private var cardAdder: some View {
        cardCounterAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

#Preview {
    ContentView()
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
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
