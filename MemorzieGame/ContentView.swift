//
//  ContentView.swift
//  MemorzieGame
//
//  Created by Артём on 27.12.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
        .foregroundStyle(Color.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}


struct CardView: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text("👻")
                    .imageScale(.large)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
