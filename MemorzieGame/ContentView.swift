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
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text("👻")
                    .imageScale(.large)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}
