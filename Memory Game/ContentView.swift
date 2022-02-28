//
//  ContentView.swift
//  Memory Game
//
//  Created by Nicholas Boleky on 2/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
    
    struct CardView: View {
        
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
                    Text("✈️")
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
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
