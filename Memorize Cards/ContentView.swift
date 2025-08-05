//
//  ContentView.swift
//  Memorize Cards
//
//  Created by Delvina Jenoline on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🕸","🦋","🐋","🦚","🕷","☘️","🍁","🌾","❄️","🫧","🪐","💫"]
    
    @State var CardCount:Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                Cards
            }
            Spacer()
            CardAdjusters
            }
        .padding()
            .foregroundColor(.green)
            
        }
    var Cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0...CardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
    }
    }
    
    var CardAdjusters: some View{
        HStack{
            CardAdder
            Spacer()
            CardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func CardController(by offect: Int,symbol: String) -> some View{
        
        Button(action: {
                CardCount += offect
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(CardCount + offect < 1 || CardCount + offect > emojis.count)
    }
    
    var CardRemover: some View {

                CardController(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var CardAdder: some View {
        
        CardController(by: +1, symbol: "rectangle.stack.fill.badge.plus")
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
            Group {
                base.foregroundColor(.white)
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

