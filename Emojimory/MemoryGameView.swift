//
//  MemoryGameView.swift
//  Emojimory
//
//  Created by Florian Thiévent on 17.09.20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @State var showingDetail = false
    
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    
    var body: some View {

            HStack{
                ForEach(viewModel.cards){card in
                    CardView(card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                }
            }.padding()
        
        }
        
    }

struct CardView:View{
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View {
        GeometryReader{ geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize)-> some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius:cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(.blue)
                    .animation(.easeIn)
                Text(card.content).font(.system(size: fontSize(size)))
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.blue)
            }
        }.aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    
    // MARK: - Drawing Constants
    let cornerRadius = CGFloat(10)
    let lineWidth = CGFloat(3)
    let aspectRatio = CGFloat(0.75)
    private func fontSize(_ size: CGSize)->CGFloat{
        min(size.height, size.width) * 0.8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
    }
}
