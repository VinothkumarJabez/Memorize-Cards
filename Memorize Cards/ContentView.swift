//
//  ContentView.swift
//  Memorize Cards
//
//  Created by Delvina Jenoline on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🕸","🦋","🐋","🦚","🕷"]
    
    var body: some View {
        HStack{
            
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.green)
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View{
    @State var isFaceUp: Bool = true
    let content: String
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

