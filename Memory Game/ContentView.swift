//
//  ContentView.swift
//  Memory Game
//
//  Created by Nicholas Boleky on 2/27/22.
//

import SwiftUI

struct ContentView: View {
    
    var emojis: Array = ["✈️", "🚁", "🚂", "🚗", "🚲", "🚜",  "🚕", "🏎", "🚑", "🚓", "🚒", "🚀", "🏍", "🚌", "🚐", "🚛", "🛳", "⛴", "🚎", "⛵️", "🚤", "🛴", "🛺", "🛻"]
    
    @State var emojiCount: Int = 24
    
    var body: some View {
        VStack {
            HStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                        ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        })
                    }
                }
                .padding(.horizontal)
                .foregroundColor(.red)
            }
            HStack {
                removeCardButton
                Spacer()
                addCardButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
    }
    
    var removeCardButton: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
        .padding()
    }
    
    var addCardButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                .padding()
        }
    }
    
    struct CardView: View {
        var content: String
        @State var isFaceUp: Bool = false
        let card = RoundedRectangle(cornerRadius: 20)
        
        
        var body: some View {
            ZStack {
                if isFaceUp {
                    card
                        .fill()
                        .foregroundColor(.white)
                    card
                        .stroke()
                    Text(content)
                        .font(.largeTitle)
                } else {
                    card
                        .fill()
                }
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
